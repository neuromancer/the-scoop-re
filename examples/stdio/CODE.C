#include <stdio.h>
#include <stdarg.h>

void example_clearerr(void) {
    FILE *fp = stdin;
    clearerr(fp);
}

void example_fclose(void) {
    FILE *fp = stdout;
    fclose(fp);
}

void example_fcloseall(void) {
    fcloseall();
}

void example_fdopen(void) {
    int dummy_handle = 0;
    fdopen(dummy_handle, "r");
}

void example_fflush(void) {
    FILE *fp = stdout;
    fflush(fp);
}

void example_fgetc(void) {
    FILE *fp = stdin;
    fgetc(fp);
}

void example_fgetchar(void) {
    fgetchar();
}

void example_fgets(void) {
    char buffer[100];
    FILE *fp = stdin;
    fgets(buffer, 100, fp);
}

void example_flushall(void) {
    flushall();
}

void example_fopen(void) {
    fopen("dummy_file.txt", "w");
}

void example_fprintf(void) {
    FILE *fp = stdout;
    fprintf(fp, "This is test %d, string %s\n", 1, "hello");
}

void example_fputc(void) {
    FILE *fp = stdout;
    fputc('A', fp);
}

void example_fputchar(void) {
    fputchar('B');
}

void example_fputs(void) {
    FILE *fp = stdout;
    fputs("Hello World\n", fp);
}

void example_fread(void) {
    char buffer[50];
    FILE *fp = stdin;
    fread(buffer, sizeof(char), 50, fp);
}

void example_freopen(void) {
    FILE *fp = stdout;
    freopen("another_dummy.txt", "a", fp);
}

void example_fscanf(void) {
    int i;
    char s[20];
    FILE *fp = stdin;
    fscanf(fp, "%d %19s", &i, s);
}

void example_fsetpos(void) {
    fpos_t new_pos = 0L;
    FILE *fp = stdin;
    fsetpos(fp, &new_pos);
}

void example_fseek(void) {
    FILE *fp = stdin;
    fseek(fp, 0L, SEEK_SET);
}

void example_ftell(void) {
    FILE *fp = stdin;
    ftell(fp);
}

void example_fwrite(void) {
    const char *data = "Some data to write";
    FILE *fp = stdout;
    fwrite(data, sizeof(char), 10, fp);
}

void example_gets(void) {
    char buffer[100];
    gets(buffer);
}

void example_getw(void) {
    FILE *fp = stdin;
    getw(fp);
}

void example_perror(void) {
    perror("An example error occurred");
}

void example_printf(void) {
    printf("Example printf: number %d, string %s\n", 42, "example");
}

void example_puts(void) {
    puts("Example puts string.");
}

void example_putw(void) {
    FILE *fp = stdout;
    putw(12345, fp);
}

void example_remove(void) {
    remove("file_to_delete.tmp");
}

void example_rename(void) {
    rename("old_name.txt", "new_name.txt");
}

void example_rewind(void) {
    FILE *fp = stdin;
    rewind(fp);
}

void example_rmtmp(void) {
    rmtmp();
}

void example_scanf(void) {
    int i;
    float f;
    scanf("%d %f", &i, &f);
}

void example_setbuf(void) {
    static char mybuffer[BUFSIZ];
    FILE *fp = stdout;
    setbuf(fp, mybuffer);
}

void example_setvbuf(void) {
    static char myvbuffer[BUFSIZ];
    FILE *fp = stdout;
    setvbuf(fp, myvbuffer, _IOFBF, BUFSIZ);
}

void example_sprintf(void) {
    char buffer[200];
    sprintf(buffer, "Sprintf example: %d %s", 100, "value");
}

void example_sscanf(void) {
    const char *input = "123 abc";
    int i;
    char s[10];
    sscanf(input, "%d %9s", &i, s);
}

void example_tempnam(void) {
    tempnam("C:\\TEMP", "myapp");
}

void example_tmpfile(void) {
    tmpfile();
}

void example_tmpnam(void) {
    char name_buffer[L_tmpnam];
    tmpnam(name_buffer);
}

void example_ungetc(void) {
    FILE *fp = stdin;
    ungetc('Z', fp);
}

void example_unlink(void) {
    unlink("file_to_unlink.tmp");
}

void example_vfprintf(void) {
    va_list dummy_args;
    char dummy_va_list_area[1];
    FILE *fp = stdout;
    dummy_args = (va_list)dummy_va_list_area;
    vfprintf(fp, "Vfprintf: %d %s\n", dummy_args);
}

void example_vprintf(void) {
    va_list dummy_args;
    char dummy_va_list_area[1];
    dummy_args = (va_list)dummy_va_list_area;
    vprintf("Vprintf: %d %s\n", dummy_args);
}

void example_vsprintf(void) {
    char buffer[200];
    va_list dummy_args;
    char dummy_va_list_area[1];
    dummy_args = (va_list)dummy_va_list_area;
    vsprintf(buffer, "Vsprintf: %d %s", dummy_args);
}

int main(void) {
    example_clearerr();
    example_fclose();
    example_fcloseall();
    example_fdopen();
    example_fflush();
    example_fgetc();
    example_fgetchar();
    example_fgets();
    example_flushall();
    example_fopen();
    example_fprintf();
    example_fputc();
    example_fputchar();
    example_fputs();
    example_fread();
    example_freopen();
    example_fscanf();
    example_fsetpos();
    example_fseek();
    example_ftell();
    example_fwrite();
    example_gets();
    example_getw();
    example_perror();
    example_printf();
    example_puts();
    example_putw();
    example_remove();
    example_rename();
    example_rewind();
    example_rmtmp();
    example_scanf();
    example_setbuf();
    example_setvbuf();
    example_sprintf();
    example_sscanf();
    example_tempnam();
    example_tmpfile();
    example_tmpnam();
    example_ungetc();
    example_unlink();
    example_vfprintf();
    example_vprintf();
    example_vsprintf();

    printf("\nAll stdio example functions called (compilation check).\n");

    return 0;
}
