#include <conio.h>

/* Example for cgets */
void example_cgets(void) {
    char buffer[82]; /* Need space for max length byte + string + null */
    buffer[0] = 80;  /* Set maximum length */
    cgets(buffer);
}

/* Example for cprintf */
void example_cprintf(void) {
    int value = 42;
    cprintf("This is a cprintf example with value: %d\r\n", value);
}

/* Example for cputs */
void example_cputs(void) {
    char *str;
    cputs(str);
}

/* Example for cscanf */
void example_cscanf(void) {
    int i;
    float f;
    /* Note: cscanf requires user input, but for compilation, this is sufficient */
    cscanf("%d %f", &i, &f);
}

/* Example for getch */
void example_getch(void) {
    getch();
}

/* Example for getche */
void example_getche(void) {
    getche();
}

/* Example for inp */
void example_inp(void) {
    unsigned int port = 0x378; /* Example port (LPT1 data) */
    inp(port);
}

/* Example for inpw */
void example_inpw(void) {
    unsigned int port = 0x378; /* Example port (LPT1 data) */
    inpw(port);
}

/* Example for kbhit */
void example_kbhit(void) {
    kbhit();
}

/* Example for outp */
void example_outp(void) {
    unsigned int port = 0x378; /* Example port (LPT1 data) */
    int value = 0xAA;
    outp(port, value);
}

/* Example for outpw */
void example_outpw(void) {
    unsigned int port = 0x378; /* Example port (LPT1 data) */
    unsigned int value = 0xAAAA;
    outpw(port, value);
}

/* Example for putch */
void example_putch(void) {
    int character = 'X';
    putch(character);
}

/* Example for ungetch */
void example_ungetch(void) {
    int character = 'Y';
    ungetch(character);
}

/* Main function calling all examples */
int main(void) {
    example_cgets();
    example_cprintf();
    example_cputs();
    example_cscanf();
    example_getch();
    example_getche();
    example_inp();
    example_inpw();
    example_kbhit();
    example_outp();
    example_outpw();
    example_putch();
    example_ungetch();

    return 0;
}
