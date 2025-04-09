#include <string.h>

char byte_C59E;
char *string_5C5E = "";
char *string_5C78 = "";
char *string_5C7D = "";
char *string_5C84 = "";
char *string_5C89 = "";

int sub_34F7(void) {

}

int sub_30C2(void) {

}

int sub_3188(void) {

}

int sub_3259(void) {

}

int sub_3326(void) {

}

void sub_A864(char *p) {

}

int sub_3020(char *arg_0, char *arg_2) {
    char *ptr_to_use;

    byte_C59E = (char)sub_34F7();

    if (arg_0 == 0 && arg_2 == 0) {
        if (sub_30C2()) {
            return 1;
        }
        if (sub_3188()) {
            return 1;
        }
        if (sub_3259()) {
            return 1;
        }
        if (sub_3326()) {
            return 1;
        }
        ptr_to_use = string_5C5E;
    } else {
        if (strcmp(arg_0, string_5C78) == 0) {
             if (sub_3188()) {
                 return 1;
             }
             ptr_to_use = string_5C78;
        } else if (strcmp(arg_0, string_5C7D) == 0) {
             if (sub_3259()) {
                 return 1;
             }
             ptr_to_use = string_5C7D;
        } else if (strcmp(arg_0, string_5C84) == 0) {
             if (sub_3326()) {
                 return 1;
             }
             ptr_to_use = string_5C84;
        } else {
             ptr_to_use = string_5C89;
        }
    }

    sub_A864(ptr_to_use);

}

int main() {
    sub_3020(0, 0);
    return 0;
}
