#include <io.h>

struct file_handle_holder {
    char dummy_byte;
    int handle;
};

struct file_handle_holder word_C59B;
struct file_handle_holder word_D964;
struct file_handle_holder word_F6EC;

void sub_33C0(void)
{
}

void sub_19DF(void)
{
}

void sub_AA2C(int arg1)
{
}

void sub_14FE(void)
{
    sub_33C0();
    sub_19DF();
    close(word_C59B.handle);
    close(word_D964.handle);
    close(word_F6EC.handle);
    sub_AA2C(1);
}

int main()
{
    sub_14FE();
    return 0;
}
