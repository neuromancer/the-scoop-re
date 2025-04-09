#include <dos.h>

union REGS bios_regs;

void sub_34D1(char mode)
{
    bios_regs.h.ah = 0;
    bios_regs.h.al = mode;
    int86(0x10, &bios_regs, &bios_regs);
}

int main()
{
    sub_34D1(0);
    return 0;
}
