

int sub_A2C2(int p1, int p2);
long sub_B13A(int p1, int p2, int p3, int p4);
void sub_B11A(int p1);
void sub_A611(int p1, unsigned int p2);
int sub_B364(int p1, int p2, int p3, int p4);
void sub_7A6D(void);


int sub_A307(int arg0, int arg2, int arg4, int arg6, int arg8, int argA) {

    int varA;
    int var8;
    int var6;
    int var2;

    long result_b13a;


    if (arg0 == 4) {
        var6 = *(int *)0xF714;
    } else {
        var6 = sub_A2C2(
            *(int *)((long)arg0*4 + 0x50FC),
            *(int *)((long)arg0*4 + 0x50FE)
        );
    }


    if (arg0 != 4 && arg0 != 3 && arg0 != 6) {
        do {
            result_b13a = sub_B13A(var6, arg8, argA, 0);
            varA = (int)result_b13a;
            var8 = (int)(result_b13a >> 16);

            if (varA == -1 && var8 == -1) {
                 if (*(char *)0x1491A != 0) {
                    sub_B11A(var6);
                    sub_A611(0x6EEC, 0);
                    return 1;
                 } else {
                    sub_A611(0x50DA, 0);
                 }
            }

        } while (varA == -1 && var8 == -1);
    }


    do {
        var2 = sub_B364(var6, arg2, arg4, arg6);

        if (var2 < 1) {
             if (*(char *)0x1491A != 0) {
                sub_B11A(var6);
                sub_A611(0x6F03, 0);
                return 1;
            } else {
                sub_A611(0x50DA, 0);
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
