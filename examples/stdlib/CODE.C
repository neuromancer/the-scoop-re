#include <stdlib.h>

/* Dummy function for atexit */
void _CDECL dummy_atexit_func(void) {
    /* Do nothing */
}

/* Dummy function for onexit */
int _CDECL dummy_onexit_func(void) {
    return 0; /* Return value as per onexit_t */
}

/* Dummy comparison function for bsearch and qsort */
int _CDECL dummy_compare_func(const void *elem1, const void *elem2) {
    int i1 = *(int*)elem1;
    int i2 = *(int*)elem2;
    if (i1 < i2) return -1;
    if (i1 > i2) return 1;
    return 0;
}

/* Data for bsearch and qsort */
int search_data[] = { 10, 20, 30, 40, 50 };
int sort_data[] = { 55, 22, 88, 11, 33 };

void example_abort(void) {
    abort(); /* This would terminate, so commented out for main to continue */
}

void example_abs(void) {
    int result;
    result = abs(-10);
}

void example_atexit(void) {
    int result;
    result = atexit(dummy_atexit_func);
}

void example_atof(void) {
    double result;
    result = atof("123.45");
}

void example_atoi(void) {
    int result;
    result = atoi("12345");
}

void example_atol(void) {
    long result;
    result = atol("123456789");
}

void example_bsearch(void) {
    void *result;
    int key = 30;
    result = bsearch(&key, search_data, 5, sizeof(int), dummy_compare_func);
}

void example_calloc(void) {
    void *ptr;
    ptr = calloc(10, sizeof(int));
    /* In real code, should check ptr and eventually free it */
}

void example_div(void) {
    div_t result;
    result = div(10, 3);
}

void example_ecvt(void) {
    char *result;
    int decpt, sign;
    result = ecvt(123.4567, 5, &decpt, &sign);
}

void example_exit(void) {
    exit(0); /* This would terminate, so commented out for main to continue */
}

void example__exit(void) {
    /* _exit(0); */ /* This would terminate, so commented out for main to continue */
}

void example_fcvt(void) {
    char *result;
    int decpt, sign;
    result = fcvt(-987.65, 4, &decpt, &sign);
}

void example_free(void) {
    free(0); /* Freeing NULL is safe */
}

void example_gcvt(void) {
    char buffer[50];
    char *result;
    result = gcvt(123.456, 6, buffer);
}

void example_getenv(void) {
    char *value;
    value = getenv("PATH");
}

void example_itoa(void) {
    char buffer[20];
    char *result;
    result = itoa(12345, buffer, 10); /* Base 10 */
}

void example_labs(void) {
    long result;
    result = labs(-1234567L);
}

void example_ldiv(void) {
    ldiv_t result;
    result = ldiv(1000000L, 7);
}

void example__lrotl(void) {
    unsigned long result;
    result = _lrotl(0x12345678UL, 4);
}

void example__lrotr(void) {
    unsigned long result;
    result = _lrotr(0x12345678UL, 4);
}

void example_ltoa(void) {
    char buffer[35]; /* Enough for 32 bits binary + sign + null */
    char *result;
    result = ltoa(1234567L, buffer, 16); /* Base 16 */
}

void example__makepath(void) {
    char path_buffer[_MAX_PATH];
    _makepath(path_buffer, "c", "\\msdev\\include", "stdlib", "h");
}

void example_malloc(void) {
    void *ptr;
    ptr = malloc(100);
    /* In real code, should check ptr and eventually free it */
}

void example_onexit(void) {
    onexit_t result;
    result = onexit(dummy_onexit_func);
}

void example_perror(void) {
    /* Usually called after an error occurs, sets errno */
    perror("Error opening file");
}

void example_putenv(void) {
    int result;
    /* String must be modifiable and persistent if needed by environment */
    static char env_var[10];
    result = putenv(env_var);
    /* Using a literal might work for compilation but is risky: */
    /* result = putenv("TEMP_VAR=TempValue"); */
}

void example_qsort(void) {
    qsort(sort_data, 5, sizeof(int), dummy_compare_func);
}

void example__rotl(void) {
    unsigned int result;
    result = _rotl(0x1234, 2);
}

void example__rotr(void) {
    unsigned int result;
    result = _rotr(0x1234, 2);
}

void example_rand(void) {
    int result;
    result = rand();
}

void example_realloc(void) {
    realloc(0, 50);
}

void example__searchenv(void) {
    char result_path[_MAX_PATH];
    /* Search for "cl.exe" in paths specified by the "PATH" environment variable */
    _searchenv("cl.exe", "PATH", result_path);
}

void example__splitpath(void) {
    char full_path[10];
    char drive[_MAX_DRIVE];
    char dir[_MAX_DIR];
    char fname[_MAX_FNAME];
    char ext[_MAX_EXT];
    _splitpath(full_path, drive, dir, fname, ext);
}

void example_srand(void) {
    srand(12345); /* Seed the random number generator */
}

void example_strtod(void) {
    double result;
    char *endptr;
    result = strtod("  -123.45e-2junk", &endptr);
}

void example_strtol(void) {
    long result;
    char *endptr;
    result = strtol(" \t-0xABCjunk", &endptr, 0); /* Base 0 detects 0x */
}

void example_strtoul(void) {
    unsigned long result;
    char *endptr;
    result = strtoul("  12345junk", &endptr, 10); /* Base 10 */
}

void example_swab(void) {
    char source[8]; /* Must have even length */
    char dest[7];
    swab(source, dest, 6);
}

void example_system(void) {
    int result;
    /* Check if command processor exists */
    result = system(0);
    /* Execute a command (e.g., "dir" on DOS/Windows) */
    /* result = system("dir"); */ /* Commented out to avoid execution */
}

void example_ultoa(void) {
    char buffer[35];
    char *result;
    result = ultoa(987654321UL, buffer, 8); /* Base 8 */
}

/* These might be macros in standard C via ctype.h, */
/* but stdlib.h provides function versions if macros are undefined */
#undef tolower
#undef toupper

void example_tolower(void) {
    int result;
    result = tolower('X');
}

void example_toupper(void) {
    int result;
    result = toupper('y');
}


int main(void) {
    example_abort();
    example_abs();
    example_atexit();
    example_atof();
    example_atoi();
    example_atol();
    example_bsearch();
    example_calloc();
    example_div();
    example_ecvt();
    example_exit();
    example__exit();
    example_fcvt();
    example_free();
    example_gcvt();
    example_getenv();
    example_itoa();
    example_labs();
    example_ldiv();
    example__lrotl();
    example__lrotr();
    example_ltoa();
    example__makepath();
    example_malloc();
    example_onexit();
    example_perror();
    example_putenv();
    example_qsort();
    example__rotl();
    example__rotr();
    example_rand();
    example_realloc();
    example__searchenv();
    example__splitpath();
    example_srand();
    example_strtod();
    example_strtol();
    example_strtoul();
    example_swab();
    example_system();
    example_ultoa();
    example_tolower();
    example_toupper();

    /* Access some external variables (optional, not functions) */
    /* int e = errno; */
    /* char * first_env = *environ; */
    /* unsigned int p = _psp; */

    return 0;
}
