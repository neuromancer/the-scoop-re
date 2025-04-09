#include <malloc.h>
#include <dos.h>

void sub_A864(unsigned int arg1, unsigned int arg2)
{
}

void far *sub_1734(unsigned int size)
{
    void far *ptr;

    ptr = _fmalloc(size);

    if (ptr == 0)
    {
        sub_A864(0x5BBE, 0);
    }

    return ptr;
}

int main()
{
    sub_1734(0);
    return 0;
}
