/*
 * DOS_API_SIMPLE_FIXED.C
 *
 * Demonstrates minimal, hardcoded calls to individual high-level DOS API
 * functions available in Microsoft C 5.0.
 * Designed strictly for compilation check, not execution.
 * Fixed based on compiler errors.
 *
 * Compile with Microsoft C 5.0: cl dos_api_simple_fixed.c
 */

#include <stdio.h>     /* For printf, SEEK_SET */
#include <stdlib.h>    /* For exit/return */
#include <string.h>    /* For strcpy */
#include <dos.h>       /* Primary header for _dos_ functions, structs */
#include <direct.h>    /* For _dos_getdcwd, _dos_chdir etc. */
#include <fcntl.h>     /* For file access modes (O_RDONLY etc) */
#include <sys\types.h> /* Often needed for sys headers */
#include <sys\stat.h>  /* For file permission modes (_S_IREAD etc - though _A_ are in dos.h) */

/* --- Function Prototypes --- */
void example_dos_open(void);
void example_dos_close(void);
void example_dos_creat(void);
void example_dos_creatnew(void);
void example_dos_read(void);
void example_dos_write(void);
void example_dos_findfirst(void);
void example_dos_findnext(void);
void example_dos_getfileattr(void);
void example_dos_setfileattr(void);
void example_dos_getdiskfree(void);
void example_dos_getdate(void);
void example_dos_setdate(void);
void example_dos_gettime(void);
void example_dos_settime(void);
void example_dos_allocmem(void);
void example_dos_freemem(void);
void example_dos_setblock(void);
void example_dos_getdrive(void);
void example_dos_setdrive(void);
void example_dos_getdcwd(void);
void example_dos_chdir(void);
void example_dos_mkdir(void);
void example_dos_rmdir(void);
void example_dos_keep(void);
void example_dos_getftime(void);
void example_dos_setftime(void);
void example_dos_getverify(void);
void example_dos_setverify(void);
void example_dos_lseek(void); /* Added seek example */

/* --- Main Function --- */
int main(void)
{
    printf("--- Simplified DOS API Calls (Compile Check - Fixed) ---\n");

    example_dos_open();
    example_dos_close();
    example_dos_creat();
    example_dos_creatnew();
    example_dos_read();
    example_dos_write();
    example_dos_findfirst();
    example_dos_findnext();
    example_dos_getfileattr();
    example_dos_setfileattr();
    example_dos_getdiskfree();
    example_dos_getdate();
    example_dos_setdate();
    example_dos_gettime();
    example_dos_settime();
    example_dos_allocmem();
    example_dos_freemem();
    example_dos_setblock();
    example_dos_getdrive();
    example_dos_setdrive();
    example_dos_chdir();
    example_dos_mkdir();
    example_dos_rmdir();
    example_dos_keep();
    example_dos_getftime();
    example_dos_setftime();
    example_dos_lseek();

    printf("\n--- Finished Simple DOS API Examples (Fixed) ---\n");
    return 0;
}

/* --- Example Function Implementations (Minimal Calls - Fixed) --- */

void example_dos_open(void) {
    unsigned dummy_handle_out; /* Variable to hold output param address */
    printf("* example_dos_open\n");
    /* Use O_RDONLY instead of _O_RDONLY */
    _dos_open("DUMMY.FIL", O_RDONLY, &dummy_handle_out);
}

void example_dos_close(void) {
    unsigned dummy_handle_in = 1; /* Hardcoded input handle */
    printf("* example_dos_close\n");
    _dos_close(dummy_handle_in);
}

void example_dos_creat(void) {
     unsigned dummy_handle_out; /* Variable to hold output param address */
     printf("* example_dos_creat\n");
    /* _A_NORMAL should be defined in dos.h */
    _dos_creat("DUMMY.NEW", _A_NORMAL, &dummy_handle_out);
}

void example_dos_creatnew(void) {
     unsigned dummy_handle_out; /* Variable to hold output param address */
     printf("* example_dos_creatnew\n");
     /* _A_HIDDEN should be defined in dos.h */
     _dos_creatnew("DUMMY.NWR", _A_HIDDEN, &dummy_handle_out);
}

void example_dos_read(void) {
    unsigned dummy_handle_in = 1;
    char dummy_buffer[10];
    unsigned dummy_bytes_to_read = 10;
    unsigned dummy_bytes_read_out; /* Variable to hold output param address */
    printf("* example_dos_read\n");
    _dos_read(dummy_handle_in, dummy_buffer, dummy_bytes_to_read, &dummy_bytes_read_out);
}

void example_dos_write(void) {
    unsigned dummy_handle_in = 1;
    /* Declare array, then initialize using strcpy */
    char dummy_buffer[10];
    unsigned dummy_bytes_to_write = 8;
    unsigned dummy_bytes_written_out; /* Variable to hold output param address */
    printf("* example_dos_write\n");
    strcpy(dummy_buffer, "TestData"); /* Initialize using strcpy */
    _dos_write(dummy_handle_in, dummy_buffer, dummy_bytes_to_write, &dummy_bytes_written_out);
}

void example_dos_findfirst(void) {
    /* Use struct find_t instead of struct _find_t */
    struct find_t dummy_fileinfo; /* Variable to hold output param address */
    printf("* example_dos_findfirst\n");
    /* Attributes like _A_SUBDIR, _A_RDONLY are in dos.h */
    _dos_findfirst("*.*", _A_SUBDIR | _A_RDONLY, &dummy_fileinfo);
}

void example_dos_findnext(void) {
     /* Use struct find_t instead of struct _find_t */
     struct find_t dummy_fileinfo; /* Variable to hold output/input param */
     printf("* example_dos_findnext\n");
    _dos_findnext(&dummy_fileinfo);
}

void example_dos_getfileattr(void) {
    unsigned dummy_attribute_out; /* Variable to hold output param address */
    printf("* example_dos_getfileattr\n");
    _dos_getfileattr("DUMMY.ATR", &dummy_attribute_out);
}

void example_dos_setfileattr(void) {
    unsigned dummy_attribute_in = _A_ARCH; /* Hardcoded input attribute */
    printf("* example_dos_setfileattr\n");
    _dos_setfileattr("DUMMY.ATR", dummy_attribute_in);
}

void example_dos_getdiskfree(void) {
    unsigned dummy_drive = 0; /* 0 = default */
    /* Use struct diskfree_t instead of struct _diskfree_t */
    struct diskfree_t dummy_diskinfo; /* Variable to hold output param address */
    printf("* example_dos_getdiskfree\n");
    _dos_getdiskfree(dummy_drive, &dummy_diskinfo);
}

void example_dos_getdate(void) {
    /* Use struct dosdate_t instead of struct _dosdate_t */
    struct dosdate_t dummy_dateinfo; /* Variable to hold output param address */
    printf("* example_dos_getdate\n");
    _dos_getdate(&dummy_dateinfo);
}

void example_dos_setdate(void) {
    /* Use struct dosdate_t instead of struct _dosdate_t */
    struct dosdate_t dummy_dateinfo; /* Input structure */
    printf("* example_dos_setdate\n");
    dummy_dateinfo.year = 1999;
    dummy_dateinfo.month = 12;
    dummy_dateinfo.day = 31;
    /* dayofweek is ignored by setdate */
    _dos_setdate(&dummy_dateinfo);
}

void example_dos_gettime(void) {
    /* Use struct dostime_t instead of struct _dostime_t */
    struct dostime_t dummy_timeinfo; /* Variable to hold output param address */
    printf("* example_dos_gettime\n");
    _dos_gettime(&dummy_timeinfo);
}

void example_dos_settime(void) {
    /* Use struct dostime_t instead of struct _dostime_t */
    struct dostime_t dummy_timeinfo; /* Input structure */
    printf("* example_dos_settime\n");
    dummy_timeinfo.hour = 10;
    dummy_timeinfo.minute = 30;
    dummy_timeinfo.second = 0;
    dummy_timeinfo.hsecond = 0;
    _dos_settime(&dummy_timeinfo);
}

void example_dos_allocmem(void) {
    unsigned dummy_size_paras = 64; /* 1KB */
    unsigned dummy_segment_out;    /* Variable to hold output param address */
    printf("* example_dos_allocmem\n");
    _dos_allocmem(dummy_size_paras, &dummy_segment_out);
}

void example_dos_freemem(void) {
    unsigned dummy_segment_in = 0x1000; /* Hardcoded segment */
    printf("* example_dos_freemem\n");
    _dos_freemem(dummy_segment_in);
}

void example_dos_setblock(void) {
    unsigned dummy_new_size_paras = 128; /* 2KB */
    unsigned dummy_segment_in = 0x1000;  /* Hardcoded segment */
    unsigned dummy_max_available_out;   /* Variable to hold output param address */
    printf("* example_dos_setblock\n");
    _dos_setblock(dummy_new_size_paras, dummy_segment_in, &dummy_max_available_out);
}

void example_dos_getdrive(void) {
    unsigned dummy_drive_out; /* Variable to hold output param address */
    printf("* example_dos_getdrive\n");
    _dos_getdrive(&dummy_drive_out);
}

void example_dos_setdrive(void) {
    unsigned dummy_drive_in = 3; /* C: */
    unsigned dummy_total_drives_out; /* Variable to hold output param address */
    printf("* example_dos_setdrive\n");
    _dos_setdrive(dummy_drive_in, &dummy_total_drives_out);
}

void example_dos_chdir(void) {
    /* Declare array, then initialize using strcpy */
    char dummy_path[10];
    printf("* example_dos_chdir\n");
    strcpy(dummy_path, "\\DOS"); /* Initialize using strcpy */
    chdir(dummy_path);
}

void example_dos_mkdir(void) {
    /* Declare array, then initialize using strcpy */
    char dummy_path[10];
    printf("* example_dos_mkdir\n");
    strcpy(dummy_path, "NEWDIR"); /* Initialize using strcpy */
    mkdir(dummy_path);
}

void example_dos_rmdir(void) {
    /* Declare array, then initialize using strcpy */
    char dummy_path[10];
    printf("* example_dos_rmdir\n");
    strcpy(dummy_path, "OLDDIR"); /* Initialize using strcpy */
    rmdir(dummy_path);
}

void example_dos_keep(void) {
    unsigned dummy_status = 0;
    unsigned dummy_memsize_paras = 100; /* Paragraphs to keep resident */
    printf("* example_dos_keep\n");
    /* This call would normally terminate the program */
    _dos_keep(dummy_status, dummy_memsize_paras);
    printf("  (If _dos_keep executed, this line wouldn't print)\n");
}

void example_dos_getftime(void) {
    unsigned dummy_handle_in = 1;
    unsigned dummy_date_out; /* Variable to hold output param address */
    unsigned dummy_time_out; /* Variable to hold output param address */
    printf("* example_dos_getftime\n");
    _dos_getftime(dummy_handle_in, &dummy_date_out, &dummy_time_out);
}

void example_dos_setftime(void) {
    unsigned dummy_handle_in = 1;
    unsigned dummy_date_in = ( (1995-1980) << 9 ) | ( 5 << 5 ) | 15; /* May 15, 1995 */
    unsigned dummy_time_in = ( 14 << 11 ) | ( 30 << 5 ) | ( 0 >> 1) ; /* 14:30:00 */
    printf("* example_dos_setftime\n");
    _dos_setftime(dummy_handle_in, dummy_date_in, dummy_time_in);
}

void example_dos_lseek(void) {
    unsigned dummy_handle_in = 1;
    long dummy_offset = 0L;
    int dummy_origin = SEEK_SET; /* SEEK_SET should be defined in <stdio.h> */
    printf("* example_dos_lseek\n");
    lseek(dummy_handle_in, dummy_offset, dummy_origin);
}
