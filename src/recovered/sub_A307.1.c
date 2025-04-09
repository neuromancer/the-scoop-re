#include <dos.h>

#define MK_FP(a,off) ((void far *) (((unsigned long)(a) << 16) | (unsigned long)(off)))

int sub_A2C2(int p1, int p2);
long sub_B13A(int p1, int p2, int p3, int p4);
void sub_B11A(int p1);
void sub_A611(int p1, unsigned int p2);
int sub_B364(int p1, int p2, int p3, int p4);
void sub_7A6D(void);

char * near byte_1491A_ptr = (char *)0x1491A;
int * near array_50FC = (int *)0x50FC;


int sub_A307(int arg0, int arg2, int arg4, int arg6, int arg8, int argA) {

    int var2;
    int var6;
    int var8;
    int varA;

    long result_b13a;
    struct SREGS segregs;


    if (arg0 == 4) {
        var6 = *(int far *)MK_FP(0x166E, 0xF714);
    } else {
        var6 = sub_A2C2(array_50FC[arg0 * 2], array_50FC[arg0 * 2 + 1]);
    }


    if (arg0 != 4 && arg0 != 3 && arg0 != 6) {
        do {
            result_b13a = sub_B13A(var6, arg8, argA, 0);
            varA = (int)result_b13a;
            var8 = (int)(result_b13a >> 16);

            if (varA == -1 && var8 == -1) {
                 segread(&segregs);
                 if (*byte_1491A_ptr != 0) {
                    sub_B11A(var6);
                    sub_A611(0x6EEC, segregs.ds);
                    return 1;
                 } else {
                    sub_A611(0x50DA, segregs.ds);
                 }
            }

        } while (varA == -1 && var8 == -1);
    }


    do {
        var2 = sub_B364(var6, arg2, arg4, arg6);

        if (var2 < 1) {
             segread(&segregs);
             if (*byte_1491A_ptr != 0) {
                sub_B11A(var6);
                sub_A611(0x6F03, segregs.ds);
                return 1;
            } else {
                sub_A611(0x50DA, segregs.ds);
            }
        }

    } while (var2 < 1);


    if (arg0 != 4) {
         sub_B11A(var6);
         sub_7A6D();
    }


    return 0;
}


int sub_A2C2(int p1, int p2) { return 0; }
long sub_B13A(int p1, int p2, int p3, int p4) { return 0L; }
void sub_B11A(int p1) { }
void sub_A611(int p1, unsigned int p2) { }
int sub_B364(int p1, int p2, int p3, int p4) { return 0; }
void sub_7A6D(void) { }


int main() {
    sub_A307(0, 0, 0, 0, 0, 0);
    return 0;
}
