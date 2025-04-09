#include <math.h>
#include <stdlib.h> /* Included for labs, though declared in the provided math.h */
#include <stdio.h> /* Included for NULL, potentially needed by some compiler versions for const char* */

/* Forward declarations for example functions */
void example_abs(void);
void example_acos(void);
void example_asin(void);
void example_atan(void);
void example_atan2(void);
void example_atof(void);
void example_cabs(void);
void example_ceil(void);
void example_cos(void);
void example_cosh(void);
void example_dieeetomsbin(void);
void example_dmsbintoieee(void);
void example_exp(void);
void example_fabs(void);
void example_fieeetomsbin(void);
void example_floor(void);
void example_fmod(void);
void example_fmsbintoieee(void);
void example_frexp(void);
void example_hypot(void);
void example_j0(void);
void example_j1(void);
void example_jn(void);
void example_labs(void);
void example_ldexp(void);
void example_log(void);
void example_log10(void);
void example_matherr(void);
void example_modf(void);
void example_pow(void);
void example_sin(void);
void example_sinh(void);
void example_sqrt(void);
void example_tan(void);
void example_tanh(void);
void example_y0(void);
void example_y1(void);
void example_yn(void);

/* Example function implementations */

void example_abs(void) {
    int i = -10;
    abs(i);
}

void example_acos(void) {
    double d = 0.5;
    acos(d);
}

void example_asin(void) {
    double d = 0.5;
    asin(d);
}

void example_atan(void) {
    double d = 1.0;
    atan(d);
}

void example_atan2(void) {
    double y = 1.0;
    double x = 1.0;
    atan2(y, x);
}

void example_atof(void) {
    const char *s = "3.14159";
    atof(s);
}

void example_cabs(void) {
    struct complex c;
    c.x = 3.0;
    c.y = 4.0;
    cabs(c);
}

void example_ceil(void) {
    double d = 2.718;
    ceil(d);
}

void example_cos(void) {
    double d = 1.0;
    cos(d);
}

void example_cosh(void) {
    double d = 1.0;
    cosh(d);
}

void example_dieeetomsbin(void) {
    double ieee_val = 1.0;
    double msbin_val;
    dieeetomsbin(&ieee_val, &msbin_val);
}

void example_dmsbintoieee(void) {
    double msbin_val = 1.0; /* Example value */
    double ieee_val;
    dmsbintoieee(&msbin_val, &ieee_val);
}

void example_exp(void) {
    double d = 1.0;
    exp(d);
}

void example_fabs(void) {
    double d = -3.14;
    fabs(d);
}

void example_fieeetomsbin(void) {
    float ieee_val = 1.0f;
    float msbin_val;
    fieeetomsbin(&ieee_val, &msbin_val);
}

void example_floor(void) {
    double d = 2.718;
    floor(d);
}

void example_fmod(void) {
    double x = 5.3;
    double y = 2.1;
    fmod(x, y);
}

void example_fmsbintoieee(void) {
    float msbin_val = 1.0f; /* Example value */
    float ieee_val;
    fmsbintoieee(&msbin_val, &ieee_val);
}

void example_frexp(void) {
    double d = 16.0;
    int exp_val;
    frexp(d, &exp_val);
}

void example_hypot(void) {
    double x = 3.0;
    double y = 4.0;
    hypot(x, y);
}

void example_j0(void) {
    double d = 1.0;
    j0(d);
}

void example_j1(void) {
    double d = 1.0;
    j1(d);
}

void example_jn(void) {
    int n = 2;
    double d = 1.0;
    jn(n, d);
}

void example_labs(void) {
    long l = -123456L;
    labs(l);
}

void example_ldexp(void) {
    double d = 0.5;
    int exp_val = 3;
    ldexp(d, exp_val);
}

void example_log(void) {
    double d = 10.0;
    log(d);
}

void example_log10(void) {
    double d = 100.0;
    log10(d);
}

void example_matherr(void) {
    struct exception ex;
    ex.type = DOMAIN;
    ex.name = "example_func";
    ex.arg1 = -1.0;
    ex.arg2 = 0.0;
    ex.retval = 0.0;
    matherr(&ex); /* Note: This is usually called *by* the library */
}

void example_modf(void) {
    double d = 3.14159;
    double intpart;
    modf(d, &intpart);
}

void example_pow(void) {
    double base = 2.0;
    double exponent = 3.0;
    pow(base, exponent);
}

void example_sin(void) {
    double d = 1.57;
    sin(d);
}

void example_sinh(void) {
    double d = 1.0;
    sinh(d);
}

void example_sqrt(void) {
    double d = 9.0;
    sqrt(d);
}

void example_tan(void) {
    double d = 0.785;
    tan(d);
}

void example_tanh(void) {
    double d = 1.0;
    tanh(d);
}

void example_y0(void) {
    double d = 1.0;
    y0(d);
}

void example_y1(void) {
    double d = 1.0;
    y1(d);
}

void example_yn(void) {
    int n = 2;
    double d = 1.0;
    yn(n, d);
}

/* Main function calling all example functions */
int main(void) {
    example_abs();
    example_acos();
    example_asin();
    example_atan();
    example_atan2();
    example_atof();
    example_cabs();
    example_ceil();
    example_cos();
    example_cosh();
    example_dieeetomsbin();
    example_dmsbintoieee();
    example_exp();
    example_fabs();
    example_fieeetomsbin();
    example_floor();
    example_fmod();
    example_fmsbintoieee();
    example_frexp();
    example_hypot();
    example_j0();
    example_j1();
    example_jn();
    example_labs();
    example_ldexp();
    example_log();
    example_log10();
    example_matherr();
    example_modf();
    example_pow();
    example_sin();
    example_sinh();
    example_sqrt();
    example_tan();
    example_tanh();
    example_y0();
    example_y1();
    example_yn();

    return 0;
}
