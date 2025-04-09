#include <dos.h>

unsigned char byte_F8A2;
unsigned char data_at_154E2[3000];

unsigned char sub_5876(int arg1, int arg2);
void sub_5913(void);
void sub_99FE(void);

unsigned char sub_5876(int arg1, int arg2) {
    return 0;
}

void sub_5913(void) {
}

void sub_99FE(void) {
}

void sub_3B69(void) {
    unsigned char var_2;
    register unsigned int index_si;

    index_si = (unsigned int)byte_F8A2 * 10;

    var_2 = sub_5876(
        (int)(signed char)data_at_154E2[index_si + 0x94] + 2,
        (int)(signed char)data_at_154E2[index_si + 0x95] + 4
    );

    if (var_2 & 4) {
        sub_5913();
    }

    sub_99FE();
}

int main() {
    sub_3B69();
    return 0;
}
