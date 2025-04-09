#include <dos.h>

union REGS word_16A5C;
char seg001[768];
int word_F692;
int word_E9D4;
int word_EE14;
int word_E966;
int word_EA10;
int word_EA06;
int word_F16C;
int word_F128;
int word_F12A;
char byte_F6E6;

void sub_3518(int index, int count, char far* data);

void sub_3518(int index, int count, char far* data) {
    (void)index;
    (void)count;
    (void)data;
}

int sub_30C2(void) {
    word_16A5C.x.ax = 0x1A00;
    int86(0x10, &word_16A5C, &word_16A5C);

    if (word_16A5C.h.al == 0x1A) {
        word_16A5C.h.ah = 0;
        word_16A5C.h.al = 0x13;
        int86(0x10, &word_16A5C, &word_16A5C);

        sub_3518(0, 0xFF, (char far*)seg001);

        word_F692 = 0x2F26;
        word_E9D4 = 0x22D5;
        word_EE14 = 0x21C5;
        word_E966 = 0x2230;
        word_EA10 = 0x22EA;
        word_EA06 = 0x233A;
        word_F16C = 0;
        word_F128 = 0;
        word_F12A = 0xA000;
        byte_F6E6 = 0;

        return 1;
    } else {
        return 0;
    }
}

int main() {
    sub_30C2();
    return 0;
}
