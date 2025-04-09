#include <dos.h>

#define MK_FP(seg, off) ((char far *) (((unsigned long)(seg) << 16) | (unsigned long)(off)))

#define DATA_SEGMENT 0x1111

void sub_3446(int p1, int p2, char far *p3, int p4) {}
int sub_A307(int p1, char far *p2, int p3) { return 0; }
void sub_3DE1() {}
void sub_7571() {}
void sub_A864(char far *p1) {}
void sub_DD1(char far *p1) {}
void sub_7A6D() {}
void sub_4533(int p1, int p2, int p3, int p4, int p5) {}
void sub_4418(int p1) {}
void sub_5588(int p1, int p2) {}
void sub_7AF6() {}
void sub_3A1D(int p1) {}
void sub_49E7() {}

#define word_F8AA_ptr ((unsigned int far *) MK_FP(DATA_SEGMENT, 0xF8AA))
#define seg_F8AC_ptr  ((unsigned int far *) MK_FP(DATA_SEGMENT, 0xF8AC))
#define byte_F8A2_ptr ((unsigned char far *) MK_FP(DATA_SEGMENT, 0xF8A2))
#define byte_1491A_ptr ((unsigned char far *) MK_FP(0x152F, 0x491A))
#define byte_1478A_ptr ((unsigned char far *) MK_FP(0x1516, 0x1478A))


int sub_B23(int arg_0) {
    int local_var_2;

    if (arg_0 != 0) {
        sub_3446(0, 0x15, MK_FP(DATA_SEGMENT, 0x5B23), 1);
    }

    if (sub_A307(4, MK_FP(DATA_SEGMENT, 0x1018), 0x43B) != 0) {
        if (arg_0 != 0) {
            sub_3DE1();
            sub_3446(0, 0x16, MK_FP(DATA_SEGMENT, 0x5B3F), 1);
            sub_7571();
        }
        *byte_1491A_ptr = 0;
        sub_A864( MK_FP(DATA_SEGMENT, 0x5B4B) );
        return 0;
    } else {
        *byte_1491A_ptr = 0;
        sub_DD1( MK_FP(DATA_SEGMENT, 0x1018) );

        if (arg_0 != 0) {
            sub_3446(0, 0x16, MK_FP(DATA_SEGMENT, 0x5B2F), 1);
            sub_7571();
        }

        for (local_var_2 = 0; local_var_2 < 7; local_var_2++) {
             *( (unsigned char far *) MK_FP(0x1516, local_var_2 + 0x24C6) ) = 'c';
        }

        sub_7A6D();

        *word_F8AA_ptr = 0xE968;
        *seg_F8AC_ptr = DATA_SEGMENT;

        sub_4533(*byte_F8A2_ptr, 7, 0x0F, 0, *byte_1478A_ptr);
        sub_4418(*byte_F8A2_ptr);
        sub_5588(*byte_1478A_ptr, 0x0C);
        sub_7AF6();
        sub_3A1D(*byte_F8A2_ptr);
        sub_49E7();

        return 1;
    }
}

int main() {
    sub_B23(0);
    return 0;
}
