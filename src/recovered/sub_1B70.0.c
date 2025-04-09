#include <conio.h>
#include <setjmp.h>

int word_F8B0;
char byte_F8A2;
char byte_1478A;
int word_F8AE;
jmp_buf jmpbuf_2C06;
int word_F8B6;
char array_4886[1]; 


void sub_3DE1() {}
void sub_4798(int p1) {}
void sub_1710() {}
void sub_5588(int p1, int p2) {}
void sub_16C5(int p1, int p2) {}
void sub_1475() {}


int sub_1B70() {
    int var_6;
    int var_8;
    int var_A;


    if (word_F8B0 != 0) {
        if (kbhit() != 0) {
            getch(); 
            sub_3DE1();
            sub_4798((unsigned char)byte_F8A2); 
            var_8 = (unsigned char)byte_1478A;
            sub_1710();
            byte_1478A = (char)var_8;
            sub_5588(12, 5); 
            word_F8B0 = 0;
            *((char*)&word_F8AE) = 0;
            longjmp(jmpbuf_2C06, 0x2C06); 

        } else {
            var_A = (unsigned char)array_4886[word_F8B6];
            word_F8B6++;
            
            if (var_A == 10) { 
                sub_16C5(1000, 1); 
                sub_1475();
                var_A = (unsigned char)array_4886[word_F8B6];
                word_F8B6++;
            }

            sub_16C5(40, 1); 

            if (var_A == 7) {
                sub_16C5(1200, 1); 
                var_A = (unsigned char)array_4886[word_F8B6];
                word_F8B6++;
            } else if (var_A == 0) {
                sub_16C5(50, 1); 
                var_A = (unsigned char)array_4886[word_F8B6];
                word_F8B6++;
            }

            return var_A;
        }
    } else {
        var_6 = getch(); 
        if (var_6 == 0) {
            var_6 = getch(); 
            if (var_6 == 0x4B) { /* K */
                return 1; 
            } else if (var_6 == 0x4D) { /* M */
                return 2; 
            } else if (var_6 == 0x48) { /* H */
                return 3; 
            } else if (var_6 == 0x50) { /* P */
                return 4; 
            } else {
                return 0; 
            }
        } else if (var_6 == 0x0D || var_6 == 0x20) {
            return 5;
        } else {
            return var_6;
        }
    }
}


int main() {
    sub_1B70();
    return 0;
}
