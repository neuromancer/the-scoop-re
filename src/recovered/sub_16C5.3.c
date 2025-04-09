#include <conio.h>

long sub_1ED5(void);
int sub_BD4E(int diff);

long sub_1ED5(void)
{
    /* Function body unknown */
    return 0L;
}

int sub_BD4E(int diff)
{
    /* Function body unknown */
    (void)diff; /* Avoid unused parameter warning */
    return 0;
}

int sub_16C5(int arg_0, int arg_2)
{
    long startTime;
    int result;

    startTime = sub_1ED5();

    while(1)
    {
        result = sub_BD4E((int)startTime - (int)sub_1ED5());

        if (result >= arg_0) {
            break; /* Corresponds to jge loc_16F8 */
        }

        /* If result < arg_0 */
        if (arg_2 == 0) {
            continue; /* Corresponds to jz loc_16D7 */
        }

        /* If result < arg_0 and arg_2 != 0 */
        if (kbhit() == 0) {
            continue; /* Corresponds to jz loc_16D7 */
        }

        /* If result < arg_0 and arg_2 != 0 and kbhit() != 0 */
        break; /* Corresponds to fallthrough to loc_16F8 */
    }

    /* loc_16F8: Post-loop check */
    if (arg_2 != 0)
    {
        if (kbhit()) /* Check kbhit again */
        {
            return 5; /* Corresponds to mov ax, 5 */
        }
    }
    /* loc_170A: */
    return 0; /* Corresponds to sub ax, ax */
}

int main()
{
    sub_16C5(0, 0);
    return 0;
}
