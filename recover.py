import re

from google import genai
from google.genai import types

from os import system
from time import sleep
#from ollama import chat
from argparse import ArgumentParser


def analyze_functions(assembly_code, internal_call, explained_calls, select_all):
    # Regular expression to match function start
    func_start_pattern = r'sub_[0-9A-F]+\s+proc\s+near\s*$(.*?)^sub_[0-9A-F]+\s+endp\s*$'
    # Regular expression to match call instructions
    call_pattern = r'call\s+(es:word_[0-9A-F]|sub_[0-9A-F]+|far\s+ptr\s+sub_[0-9A-F]+|word\s+ptr|\[)'

    # Find all functions
    functions = re.finditer(func_start_pattern, assembly_code, re.MULTILINE | re.DOTALL)

    # Store functions without calls
    selected_functions = []

    for func_match in functions:
        func_body = func_match.group(1)
        func_name = func_match.group(0).split()[0]

        if func_name in explained_calls:
            continue

        # Check if there are any call instructions
        calls = set(re.findall(call_pattern, func_body))
        #print(func_name)
        #print(calls)

        if internal_call in func_body and select_all:
            selected_functions.append((func_name, func_body, calls))
            continue

        if internal_call in calls and len(calls.difference(explained_calls)) == 0:
            calls.remove(internal_call)
            print(func_name)
            #print(func_body)
            selected_functions.append((func_name, func_body, calls))

    return selected_functions


def augment_assembly_with_symbols(assembly_code_filename, symbols):

    with open(assembly_code_filename, 'rb') as file:
        assembly_code = file.read().decode('utf-8', errors='ignore')

    # Regular expression to match call instructions
    #call_pattern = r'call\s+(es:word_[0-9A-F]|sub_[0-9A-F]+|far\s+ptr\s+sub_[0-9A-F]+|word\s+ptr|\[)'
    #calls = set(re.findall(call_pattern, assembly_code))

    for name, symbol in symbols.items():
        assembly_code = assembly_code.replace(name, symbol)

    return assembly_code


def parse_map_from_assembly(assembly_code_file, internal_call, only_internals):

    with open(assembly_code_file, 'rb') as file:
        assembly_code = file.read().decode('utf-8', errors='ignore')

    # Regular expression to match function start
    func_start_pattern = r'sub_[0-9A-F]+\s+proc\s+near\s*$(.*?)^sub_[0-9A-F]+\s+endp\s*$'
    # Regular expression to match call instructions
    call_pattern = r'call\s+(es:word_[0-9A-F]|sub_[0-9A-F]+|far\s+ptr\s+sub_[0-9A-F]+|word\s+ptr|\[)'

    # Find all functions
    functions = re.finditer(func_start_pattern, assembly_code, re.MULTILINE | re.DOTALL)

    # Store functions without calls
    selected_functions = {}

    for func_match in functions:
        func_body = func_match.group(1)
        func_name = func_match.group(0).split()[0]

        # Check if there are any call instructions
        calls = set(re.findall(call_pattern, func_body))
        address = func_name.split("_")[1]
        address = int(address, 16)

        if only_internals and internal_call not in calls:
            selected_functions[func_name] = address

        if not only_internals and internal_call in calls:
            selected_functions[func_name] = address

    return selected_functions



intro = """I have dissembled the DOS release of "The Scoop", a mystery adventure game published by Spinnaker Software in 1989.
The original code was compiled using the Microsoft C compiler. Write a C function keeping the original name that gets compiled to this assembly code by the Microsoft C 5.0 (released in 1987)
making sure you cover the following requirements:

* Only answer with the code, and nothing else.
* Keep the code as high-level as possible: do not use inline assembly, gotos nor dummy variables.
* Do not use extern variables nor pragmas, these are not supported by this old compiler.
* "call _strlen" is really a call to strlen, the "_" is inserted by the compiler.
* Import and use dos.h and other headers if needed to call a well known function (e.g. dos_write).
* If you see an unknown function call (e.g. sub_X), write a function implementation with an explicit empty body.
* Preserve memory usage: make sure that the local variables are in the same order.
* Preserve jump types: make sure the jumps are the same (e.g. jmp, jmpf, jne, jnef) and its order is preserved.
* For segmented or global memory, just create a global variable with the name and type (e.g. `int word_F6EC`). Do NOT use MK_FP.
* Ignore the call to `sub_AAFE` (__chkstk) since it is automatically inserted by the compiler.
* Include a main() function that calls the function you are writing using zeros as parameters and immediately return 0. The main should not call any other functions
* Do NOT include comments since these can break the compiler parsing
"""

def compile_code(prefix, initial_code, chat, try_count=0):
    initial_code = initial_code.replace("```c", "")
    initial_code = initial_code.replace("```", "")
    #print(initial_code)

    # Write the code to env/CODE.C
    with open('dos/CODE.C', 'w') as file:
        file.write(initial_code)

    system("SDL_VIDEODRIVER=dummy dosbox -conf conf/toolchain.conf > /dev/null 2> /dev/null")
    print("Compiled the code!")

    # Read possible errors from env/ERRORS.LOG if it exists
    errors = ""
    try:
        with open('dos/ERRORS.LOG', 'r') as file:
            errors = file.read()
    except FileNotFoundError:
        pass

    if "error" in errors and try_count < 3:
        message = "The Microsoft C compiler failed with the following errors:\n```" + errors + "```\nPlease fix the errors and try again."
        message += " Do NOT explain the issue, just output the fixed code, again making sure you cover the requirements."

        if chat is None:
            final_code = resolve_prompt(message)
        else:
            response = chat.send_message(message)
            print(response.text)
            final_code = str(response.text)

        return compile_code(prefix, final_code, chat, try_count + 1)
    elif "error" in errors:
        print("Failed to compile the code. Giving up")
        return None

    print("Code compiled successfully")
    return initial_code

def resolve_prompt(prompt):
    # Write prompt to tmp.txt
    with open('tmp.txt', 'w') as file:
        file.write(prompt)

    # Open nano to edit the prompt
    system("cat tmp.txt | xclip -selection clipboard")
    system("nano tmp.txt")

    # Read the modified prompt
    with open('tmp.txt', 'r') as file:
        return file.read()


def find_symbol_on_map(symbol):
    address = None
    with open('dos/CODE.MAP', 'r') as file:
        for line in file:
            if symbol in line:
                address = line.split()[0]
                break

    assert len(address) == 9
    return address.split(":")[1]

def parse_symbols_from_map(mapfile):
    symbols = {}
    with open(mapfile, 'r') as file:
        i = 0
        lines = file.readlines()
        while i < len(lines):
            if not lines[i].lstrip().startswith("Address"):
                i += 1
            else:
                break

        i += 2
        while i < len(lines):
            #print(lines[i])
            fields = lines[i].split()
            if len(fields) < 2:
                break
            address = fields[0]
            name = fields[1]

            if name.startswith("_"):
                name = name[1:]

            if name != "Abs":
                symbols[name] = address
            i += 1

    for name, address in symbols.items():
        segment, offset = address.split(":")
        converted_address = int(segment, 16) * 16 + int(offset, 16)
        symbols[name] = converted_address

    return symbols

def find_symbol_size_on_map(symbol, symbols):
    # Iterate over the symbols to find the size of the symbol locating the smallest address that is greater than the  and substrating the current address
    size = None
    for name, address in symbols.items():
        if address > symbols[symbol]:
            if size is None:
                size = address - symbols[symbol]
            else:
                size = min(size, address - symbols[symbol])

    return size

def find_internal_symbols(recovered_symbols, target_exefile, target_asmfile, target_stkchk_call, example_exefile, example_mapfile):
    print(f"Trying to recover internal symbols using {example_exefile}")
    symbols_example = parse_symbols_from_map(example_mapfile)
    symbols_target = parse_map_from_assembly(target_asmfile, target_stkchk_call, True)

    for example_name, example_address in symbols_example.items():
        if example_name.startswith("example_"):
            continue

        if example_name == "edata":
            continue

        if example_name in recovered_symbols.values():
            continue

        symbol_size = find_symbol_size_on_map(example_name, symbols_example)
        if symbol_size is None:
            print(example_name, "has no size")
            continue

        func_address = None
        for target_name, target_address in symbols_target.items():
            #print(f"Checking {example_name} at address {hex(example_address)} compared to {target_name} at address {hex(target_address)}")
            system(f"./mzretools/debug/mzdiff --ctx 0 --loose --verbose --nocall {target_exefile}:{hex(target_address)}-{hex(target_address + symbol_size)} {example_exefile}:{hex(example_address)}-{hex(example_address + symbol_size)} > mzdiff.log")

            result = ""
            try:
                with open('mzdiff.log', 'r') as file:
                    result = file.read()

                # Remove the color codes
                result = re.sub(r'\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]', '', result)
            except FileNotFoundError:
                pass

            #if ("kbhit" in example_name):
            #    print(result)

            #print(result)
            #if len(result.splitlines()) > max_score:
            #    max_score = len(result.splitlines())
            #    best_match = result
            #    func_address = target_name

            if "Comparison result: match" in result:
                func_address = target_name
                break
            elif len(result.splitlines()) > 6:
                last_line = result.splitlines()[-6]
                if "jmp " in last_line or "ret " in last_line:
                    print("Last matched line:", last_line)
                    func_address = target_name
                    break

                #last_line = result.splitlines()[-5]
                #if "retf " in last_line and "ret " in last_line:
                #    print("Last matched line:", last_line)
                #    func_address = target_name
                #    break

        if func_address is not None:
            #print(f"Best match for {example_name}")
            #print(best_match)
            recovered_symbols[func_address] = example_name
            print(f"Matched {example_name} with {func_address}")

    return recovered_symbols

def check_mzdiff(original_addr, reimplementation_addr):
    system(f"./mzretools/debug/mzdiff --loose --verbose --nocall game/SCOOPUN.EXE:0x{original_addr} dos/CODE.EXE:0x{reimplementation_addr} > mzdiff.log")

    result = ""
    try:
        with open('mzdiff.log', 'r') as file:
            result = file.read()

        # Remove the color codes
        result = re.sub(r'\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]', '', result)
    except FileNotFoundError:
        pass

    return result

def read_assembly(function_name):
    # Read the env/CODE.ASM file with the assembly code
    with open('dos/CODE.ASM', 'r') as file:
        assembly = file.read()

    # Parse assembly code between "PUBLIC  _scoop" and "_scoop  ENDP"
    assembly = assembly.split(f"_{function_name}	PROC")[1]
    assembly = assembly.split(f"_{function_name}	ENDP")[0]
    assembly = assembly.replace(" NEAR", "")

    # Discard the lines that start with ";"
    assembly = "\n".join([line for line in assembly.split("\n") if not line.startswith(";")])

    print(assembly)
    return assembly


def side_by_side(str1, str2, tab_size=4):
    """
    Combine two multi-line strings side by side with proper padding.
    Handles tabs in the input strings by expanding them to spaces.

    Args:
        str1 (str): First string
        str2 (str): Second string
        tab_size (int, optional): Number of spaces to replace each tab. Defaults to 4.

    Returns:
        str: Combined string with lines from both inputs side by side
    """
    # Replace tabs with spaces in both strings
    str1 = str1.replace('\t', ' ' * tab_size)
    str2 = str2.replace('\t', ' ' * tab_size)

    # Split strings into lines
    lines1 = str1.split('\n')
    lines2 = str2.split('\n')

    # Find the maximum length of lines in the first string
    max_length = max(len(line) for line in lines1) if lines1 else 0

    # Determine how many lines to process
    max_lines = max(len(lines1), len(lines2))

    # Build the result
    result = []
    for i in range(max_lines):
        # Get lines or empty strings if we're past the end
        line1 = lines1[i] if i < len(lines1) else ""
        line2 = lines2[i] if i < len(lines2) else ""

        # Pad the first line to the maximum length
        padded_line1 = line1.ljust(max_length)

        # Combine the lines with separator
        combined = f"{padded_line1} | {line2}"
        result.append(combined)

    # Join all lines with newlines and return
    return '\n'.join(result)

def save_code(name, code, iteration):
    # Save code to src/recovered/name.iteration.c
    with open(f"src/recovered/{name}.{iteration}.c", 'w') as file:
        file.write(code)

def main():

    # Parse arguments using argparse
    parser = ArgumentParser(description="Recover high-level code from assembly code")
    parser.add_argument("--manual", action="store_true", help="Enable manual mode")
    parser.add_argument("--depth", type=int, default=1, help="Depth of the analysis")
    parser.add_argument("--internal_call", default="__chkstk", help="Internal call to chkstk")
    parser.add_argument("--model", default="gemini-2.0-flash-001", help="Model to use for chat")
    parser.add_argument("--filter", nargs="+", help="Filter functions by name (e.g. sub_1234)")
    parser.add_argument("--api_key", help="API key for Google GenAI")
    parser.add_argument("assembly_code", help="Path to dissembled code from IDA")
    parser.add_argument("target_exe", help="Path to dissembled code from IDA")

    args = parser.parse_args()
    #recovered_symbols = {}
    #recovered_symbols = find_internal_symbols(recovered_symbols, args.target_exe, args.assembly_code, args.internal_call, "examples/string/CODE.EXE", "examples/string/CODE.MAP")
    #recovered_symbols = find_internal_symbols(recovered_symbols, args.target_exe, args.assembly_code, args.internal_call, "examples/math/CODE.EXE", "examples/math/CODE.MAP")
    #recovered_symbols = find_internal_symbols(recovered_symbols, args.target_exe, args.assembly_code, args.internal_call, "examples/conio/large/CODE.EXE", "examples/conio/large/CODE.MAP")
    #recovered_symbols = find_internal_symbols(recovered_symbols, args.target_exe, args.assembly_code, args.internal_call, "examples/conio/small/CODE.EXE", "examples/conio/small/CODE.MAP")
    #recovered_symbols = find_internal_symbols(recovered_symbols, args.target_exe, args.assembly_code, args.internal_call, "examples/stdlib/CODE.EXE", "examples/stdlib/CODE.MAP")
    #recovered_symbols = find_internal_symbols(recovered_symbols, args.target_exe, args.assembly_code, args.internal_call, "examples/dosapi/CODE.EXE", "examples/dosapi/CODE.MAP")
    #recovered_symbols = find_internal_symbols(recovered_symbols, args.target_exe, args.assembly_code, args.internal_call, "examples/graph/CODE.EXE", "examples/graph/CODE.MAP")
    #recovered_symbols = find_internal_symbols(recovered_symbols, args.target_exe, args.assembly_code, args.internal_call, "examples/stdio/CODE.EXE", "examples/stdio/CODE.MAP")
    #recovered_symbols = find_internal_symbols(recovered_symbols, args.target_exe, args.assembly_code, args.internal_call, "examples/io/CODE.EXE", "examples/io/CODE.MAP")

    #print(recovered_symbols)
    #assembly_code = augment_assembly_with_symbols(args.assembly_code, recovered_symbols)

    # Save the augmented assembly code
    #with open("src/asm/CODE.ASM", 'w') as file:
    #    file.write(assembly_code)

    #assert(0)

    manual_mode = args.manual
    # Read the assembly code from file or use the provided text
    # For this example, assuming the code is in a variable 'assembly_code'
    with open(args.assembly_code, 'rb') as file:
        assembly_code = file.read()
        assembly_code = assembly_code.decode('utf-8', errors='ignore')

    if manual_mode:
        chat = None
    else:
        client = genai.Client(api_key=args.api_key)
        chat = client.chats.create(model='gemini-2.5-pro-preview-03-25', temperature=0.3)

    # Analyze the code
    compiler_internal_call = args.internal_call
    explained = {}

    for depth in range(1):
        print("Depth:", depth)
        selected_funcs = analyze_functions(assembly_code, compiler_internal_call, set(list(explained.keys()) + [compiler_internal_call]), True)

        if (len(args.filter) > 0):
            selected_funcs = list(filter(lambda x: x[0] in args.filter, selected_funcs))
        else:
            analyze_functions(assembly_code, compiler_internal_call, set(list(explained.keys()) + [compiler_internal_call], False))

        for name, body, calls in selected_funcs:
            assert name not in explained
            prompt = intro + "\n" + name + ":\n```" + body + "```\n"
            #if len(calls) > 0:
            #    prompt += "Assume the following facts for the functions called:\n"
            #    for call in calls:
            #        prompt += call + "\n" + explained[call]

            print(prompt)
            if manual_mode:
                initial_code = resolve_prompt(prompt)
            else:
                response = chat.send_message(prompt)
                initial_code = str(response.text)

            final_code = compile_code("dos/msc5", initial_code, chat, manual_mode)
            save_code(name, final_code, 0)

            if (final_code is not None):
                for t in range(50):
                    print("Try:", t)
                    reimplemented_assembly = read_assembly(name)
                    prompt = "The code compiled correctly!\n"
                    prompt += "Here is the original and the reimplementation of the assembly code side by side:\n```\n"
                    prompt += side_by_side(body, reimplemented_assembly)
                    prompt += "\n```\n```\n"
                    reimplemented_address = find_symbol_on_map("_"+name)
                    original_address = name.split("_")[1]
                    prompt += check_mzdiff(original_address, reimplemented_address)

                    prompt += "\n```\nModify the reimplemented code to match with the two assembly codes.\n"
                    prompt += "If the two assembly are essentially the same, please respond with DONE"
                    #print(prompt)

                    if manual_mode:
                        initial_code = resolve_prompt(prompt)
                    else:
                        response = chat.send_message(prompt)
                        initial_code = str(response.text)

                    print(initial_code)
                    if ("DONE" in initial_code):
                            break

                    final_code = compile_code("dos/msc5", initial_code, chat, manual_mode)
                    print(final_code)
                    if final_code is None:
                        break
                    save_code(name, final_code, t)
                    #explained[name] = final_code

                if (final_code is not None):
                    print(final_code)
                    reimplemented_assembly = read_assembly(name)

    # Print results
    #print("Functions that do not call other functions:")
    #if no_call_funcs:
    #    for func in no_call_funcs:
    #        print(f"- {func}")
    #else:
    #    print("None found")


if __name__ == "__main__":
    main()

