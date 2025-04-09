#include <dos.h>

union REGS bios_regs;

int sub_34F7(void)
{
    bios_regs.h.ah = 0x0F;
    int86(0x10, &bios_regs, &bios_regs);
    return bios_regs.h.al;
}

int main()
{
    sub_34F7();
    return 0;
}
