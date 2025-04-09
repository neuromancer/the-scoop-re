#include <string.h>

/* Define size_t if string.h didn't (older compilers might need this explicitly) */
#ifndef _SIZE_T_DEFINED
typedef unsigned int size_t;
#define _SIZE_T_DEFINED
#endif

void example_memccpy() {
    char src_memccpy[20];
    char dest_memccpy[20];
    memccpy(dest_memccpy, src_memccpy, ' ', 15);
}

void example_memchr() {
    char buffer_memchr[30];
    memchr(buffer_memchr, 'c', 20);
}

void example_memcmp() {
    char buf1_memcmp[10];
    char buf2_memcmp[10];
    memcmp(buf1_memcmp, buf2_memcmp, 6);
}

void example_memicmp() {
    char buf1_memicmp[10];
    char buf2_memicmp[10];
    memicmp(buf1_memicmp, buf2_memicmp, 6);
}

void example_memcpy() {
    char src_memcpy[20];
    char dest_memcpy[20];
    memcpy(dest_memcpy, src_memcpy, 13);
}

void example_memmove() {
    char buffer_memmove[30];
    memmove(buffer_memmove + 5, buffer_memmove, 15);
}

void example_memset() {
    char buffer_memset[20];
    memset(buffer_memset, 'A', 19);
}

void example_movedata() {
    unsigned int src_seg = 0xB800;
    unsigned int src_off = 0;
    unsigned int dest_seg = 0xA000;
    unsigned int dest_off = 0;
    unsigned int count = 100;
    movedata(src_seg, src_off, dest_seg, dest_off, count);
}

void example_strcat() {
    char dest_strcat[50];
    char src_strcat[20];
    /* dest_strcat should be a valid null-terminated string for strcat */
    /* But per instructions, leaving uninitialized */
    strcat(dest_strcat, src_strcat);
}

void example_strchr() {
    char str_strchr[20];
    strchr(str_strchr, 'x');
}

void example_strcmp() {
    char str1_strcmp[15];
    char str2_strcmp[15];
    strcmp(str1_strcmp, str2_strcmp);
}

void example_strcmpi() {
    char str1_strcmpi[15];
    char str2_strcmpi[15];
    strcmpi(str1_strcmpi, str2_strcmpi);
}

void example_stricmp() {
    char str1_stricmp[15];
    char str2_stricmp[15];
    stricmp(str1_stricmp, str2_stricmp);
}

void example_strcpy() {
    char src_strcpy[20];
    char dest_strcpy[30];
    strcpy(dest_strcpy, src_strcpy);
}

void example_strcspn() {
    char str_strcspn[15];
    char reject_strcspn[11];
    strcspn(str_strcspn, reject_strcspn);
}

void example_strdup() {
    char str_strdup[30];
    strdup(str_strdup);
}

void example__strerror() {
    _strerror(0);
}

void example_strerror() {
    strerror(2);
}

void example_strlen() {
    char str_strlen[20];
    strlen(str_strlen);
}

void example_strlwr() {
    char str_strlwr[20];
    strlwr(str_strlwr);
}

void example_strncat() {
    char dest_strncat[50];
    char src_strncat[20];
    /* dest_strncat should be a valid null-terminated string for strncat */
    /* But per instructions, leaving uninitialized */
    strncat(dest_strncat, src_strncat, 9);
}

void example_strncmp() {
    char str1_strncmp[20];
    char str2_strncmp[20];
    strncmp(str1_strncmp, str2_strncmp, 13);
}

void example_strnicmp() {
    char str1_strnicmp[20];
    char str2_strnicmp[20];
    strnicmp(str1_strnicmp, str2_strnicmp, 13);
}

void example_strncpy() {
    char src_strncpy[30];
    char dest_strncpy[15];
    strncpy(dest_strncpy, src_strncpy, 14);
    /* strncpy may not null-terminate if count is reached */
}

void example_strnset() {
    char str_strnset[20];
    strnset(str_strnset, '*', 5);
}

void example_strpbrk() {
    char str_strpbrk[25];
    char accept_strpbrk[11];
    strpbrk(str_strpbrk, accept_strpbrk);
}

void example_strrchr() {
    char str_strrchr[30];
    strrchr(str_strrchr, 'o');
}

void example_strrev() {
    char str_strrev[25];
    strrev(str_strrev);
}

void example_strset() {
    char str_strset[20];
    strset(str_strset, '#');
}

void example_strspn() {
    char str_strspn[15];
    char accept_strspn[11];
    strspn(str_strspn, accept_strspn);
}

void example_strstr() {
    char haystack_strstr[40];
    char needle_strstr[10];
    strstr(haystack_strstr, needle_strstr);
}

void example_strtok() {
    char str_strtok[25];
    char delim_strtok[2];
    strtok(str_strtok, delim_strtok);
}

void example_strupr() {
    char str_strupr[25];
    strupr(str_strupr);
}


int main() {
    example_memccpy();
    example_memchr();
    example_memcmp();
    example_memicmp();
    example_memcpy();
    example_memmove();
    example_memset();
    example_movedata();
    example_strcat();
    example_strchr();
    example_strcmp();
    example_strcmpi();
    example_stricmp();
    example_strcpy();
    example_strcspn();
    example_strdup();
    example__strerror();
    example_strerror();
    example_strlen();
    example_strlwr();
    example_strncat();
    example_strncmp();
    example_strnicmp();
    example_strncpy();
    example_strnset();
    example_strpbrk();
    example_strrchr();
    example_strrev();
    example_strset();
    example_strspn();
    example_strstr();
    example_strtok();
    example_strupr();

    return 0;
}
