#include <dos.h>

char byte_495E;
char far byte_C62D;
char far byte_C637;

void sub_DD1(char far *ptr);

void sub_DD1(char far *ptr)
{
}

void sub_1710()
{
    sub_DD1(&byte_495E);
    byte_C62D = 'c';
    byte_C637 = 'c';
}

int main()
{
    sub_1710();
    return 0;
}
