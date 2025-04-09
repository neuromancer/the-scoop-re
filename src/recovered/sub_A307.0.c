#include <dos.h>
#include <io.h>
#include <stdio.h>

int word_F714;
int word_array_50FC[14]; 
char byte_1491A;

int sub_A2C2(int p1, int p2)
{
    return 0; 
}

void sub_A611(char far* p1) 
{
}

int sub_B364(int p1, int p2, int p3, int p4) 
{ 
    return 1; 
}

void sub_7A6D(void) 
{ 
}

int sub_A307(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8, int arg_A)
{
    long lseek_result; 
    int var_6;         
    int var_2;         

    if (arg_0 == 4) 
    {
        var_6 = word_F714;
    } 
    else 
    {
        var_6 = sub_A2C2(word_array_50FC[arg_0 * 2], word_array_50FC[arg_0 * 2 + 1]);
    }

    if (arg_0 != 4 && arg_0 != 3 && arg_0 != 6)
    {
        while (1)
        {
            lseek_result = lseek(var_6, ( (long)arg_A << 16 ) | (unsigned int)arg_8, SEEK_SET);

            if (lseek_result != -1L) {
                break; 
            }

            if (byte_1491A != 0) {
                close(var_6);
                sub_A611((char far *)0x6EEC);
                return 1;
            } else {
                sub_A611((char far *)0x50DA);
            }
        }
    }

    do
    {
        var_2 = sub_B364(var_6, arg_2, arg_4, arg_6);
        if (var_2 < 1)
        {
            if (byte_1491A != 0)
            {
                close(var_6);
                sub_A611((char far *)0x6F03);
                return 1;
            }
            else
            {
                sub_A611((char far *)0x50DA);
            }
        }
    } while (var_2 < 1);

    if (arg_0 != 4) {
        close(var_6);
        sub_7A6D();
    }

    return 0;
}

int main()
{
    sub_A307(0, 0, 0, 0, 0, 0);
    return 0;
}
