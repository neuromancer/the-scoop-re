#include <io.h>
#include <fcntl.h>
#include <sys/locking.h>
#include <share.h>
#include <process.h>

#define MK_FP(a,off) ((void far *) (((unsigned long)(a) << 16) | (unsigned long)(off)))

int remove(char far *filename);

char array1[1024];
char array2[1024];

void example_access(void) {
    access("dummy.txt", 0);
}

void example_chmod(void) {
    chmod("dummy.txt", 0);
}

void example_chsize(void) {
    chsize(1, 1024L);
}

void example_close(void) {
    close(1);
}

void example_creat(void) {
    creat("newfile.txt", 0);
}

void example_dup(void) {
    dup(1);
}

void example_dup2(void) {
    dup2(1, 2);
}

void example_eof(void) {
    eof(1);
}

void example_exit(void) {
    exit(1);
}

void example_abort(void) {
    abort();
}

void example_filelength(void) {
    filelength(1);
}

void example_isatty(void) {
    isatty(1);
}

void example_locking(void) {
    locking(1, 0, 1024L);
}

void example_lseek(void) {
    lseek(1, 0L, 0); /* SEEK_SET = 0 */
}

void example_mktemp(void) {
    char templat[10];
    mktemp(templat);
}

void example_open(void) {
    open("somefile.txt", 0);
}

void example_read(void) {
    char buffer[100];
    read(1, buffer, 100);
}

void example_remove(void) {
    char far *filename = MK_FP(0x1234, 0x5678);
    remove(filename);
}

void example_rename(void) {
    rename("oldname.txt", "newname.txt");
}

void example_setmode(void) {
    setmode(1, 0);
}

void example_sopen(void) {
    sopen("sharedfile.txt", 0, 0);
}

void example_tell(void) {
    tell(1);
}

void example_umask(void) {
    umask(0);
}

void example_write(void) {
    char buffer[10];
    write(1, buffer, 5);
}

int main(void) {
    example_access();
    example_chmod();
    example_chsize();
    example_close();
    example_creat();
    example_dup();
    example_dup2();
    example_eof();
    example_filelength();
    example_isatty();
    example_locking();
    example_lseek();
    example_mktemp();
    example_open();
    example_read();
    example_remove();
    example_rename();
    example_setmode();
    example_sopen();
    example_tell();
    example_umask();
    example_write();
    example_exit();
    example_abort();
    return 0;
}
