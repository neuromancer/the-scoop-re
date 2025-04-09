#define MK_FP(a,off) ((void FAR *) (((unsigned long)(a) << 16) | (unsigned long)(off)))

int sub_386C(int arg)
{
}

int sub_3945(int arg)
{
}

void sub_355A(int arg)
{
}

int sub_16B()
{
    if (sub_386C(0))
    {
        return 1;
    }

    if (sub_3945(0))
    {
        return 1;
    }

    sub_355A(0);
    /* Implicit return 0 */
}

int main()
{
    sub_16B();
    return 0;
}
