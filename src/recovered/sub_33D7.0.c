int word_F92C;
int word_F92A;

void far unknown_EE14(int p1, int p2, int p3, int p4, int p5, int p6, int p7, int p8);

void far unknown_EE14(int p1, int p2, int p3, int p4, int p5, int p6, int p7, int p8)
{
}

void sub_33D7(int arg0, int arg1, char *arg2, char *arg3, int arg4_offset, int arg5_segment, char *arg6)
{
    char far *local_ptr;
    char local_char;

    if (*arg6 == 1)
    {
        *arg6 = 15;
    }

    if (arg4_offset != 0 || arg5_segment != 0)
    {
        *(unsigned int *)(&local_ptr) = (unsigned int)arg4_offset;
        *(((unsigned int *)(&local_ptr)) + 1) = (unsigned int)arg5_segment;

        while(1)
        {
            local_char = *local_ptr;

            if (local_char == 0) {
                break;
            }

            unknown_EE14(arg0, arg1, (unsigned char)*arg2, (unsigned char)*arg3, local_char, word_F92A, word_F92C, (unsigned char)*arg6);

            local_ptr++;
            arg2++;
        }
    }
}

int main()
{
    sub_33D7(0, 0, (char*)0, (char*)0, 0, 0, (char*)0);
    return 0;
}
