#include <conio.h>

long sub_1ED5(void);
int sub_BD4E(int diff);

long sub_1ED5(void)
{
    return 0L;
}

int sub_BD4E(int diff)
{
    (void)diff;
    return 0;
}

int sub_16C5(int arg_0, int arg_2)
{
    long startTime;

    startTime = sub_1ED5();

    while (1)
    {
        if (sub_BD4E((int)startTime - (int)sub_1ED5()) >= arg_0)
        {
            break;
        }

        if (arg_2 != 0)
        {
            if (kbhit())
            {
                 break;
            }
        }
    }

    if (arg_2 != 0)
    {
        if (kbhit())
        {
            return 5;
        }
    }

    return 0;
}

int main()
{
    sub_16C5(0, 0);
    return 0;
}
