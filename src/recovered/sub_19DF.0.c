#include <malloc.h>
#include <dos.h>

void far *ptr_C514;
void far *ptr_C518;
void far *ptr_C51C;
void far *ptr_C520;
void far *ptr_C524;
void far *ptr_F168;
void far *ptr_F14C;


void sub_19DF(void)
{
    _ffree(ptr_C514);
    _ffree(ptr_C518);
    _ffree(ptr_C51C);
    _ffree(ptr_C520);
    _ffree(ptr_C524);
    _ffree(ptr_F168);
    if (ptr_F14C != 0)
    {
        _ffree(ptr_F14C);
    }
}

int main()
{
    sub_19DF();
    return 0;
}
