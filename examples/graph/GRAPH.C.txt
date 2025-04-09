#include <graph.h>

/* Structures are defined in graph.h, no need to redefine */

/* Example function declarations */
void example_setvideomode(void);
void example_setactivepage(void);
void example_setvisualpage(void);
void example_getvideoconfig(void);
void example_setlogorg(void);
void example_getlogcoord(void);
void example_getphyscoord(void);
void example_setcliprgn(void);
void example_setviewport(void);
void example_clearscreen(void);
void example_moveto(void);
void example_getcurrentposition(void);
void example_lineto(void);
void example_rectangle(void);
void example_ellipse(void);
void example_arc(void);
void example_pie(void);
void example_setpixel(void);
void example_getpixel(void);
void example_floodfill(void);
void example_setcolor(void);
void example_getcolor(void);
void example_setlinestyle(void);
void example_getlinestyle(void);
void example_setfillmask(void);
void example_getfillmask(void);
void example_setbkcolor(void);
void example_getbkcolor(void);
void example_remappalette(void);
void example_remapallpalette(void);
void example_selectpalette(void);
void example_settextwindow(void);
void example_outtext(void);
void example_wrapon(void);
void example_displaycursor(void);
void example_settextposition(void);
void example_gettextposition(void);
void example_settextcolor(void);
void example_gettextcolor(void);
void example_getimage(void);
void example_putimage(void);
void example_imagesize(void);


/* Example function definitions */

void example_setvideomode(void) {
    _setvideomode(_MRES16COLOR);
}

void example_setactivepage(void) {
    _setactivepage(0);
}

void example_setvisualpage(void) {
    _setvisualpage(0);
}

void example_getvideoconfig(void) {
    struct videoconfig vc;
    _getvideoconfig(&vc);
}

void example_setlogorg(void) {
    _setlogorg(100, 50);
}

void example_getlogcoord(void) {
    _getlogcoord(200, 150);
}

void example_getphyscoord(void) {
    _getphyscoord(50, 25);
}

void example_setcliprgn(void) {
    _setcliprgn(10, 10, 310, 190);
}

void example_setviewport(void) {
    _setviewport(20, 20, 300, 180);
}

void example_clearscreen(void) {
    _clearscreen(_GCLEARSCREEN);
}

void example_moveto(void) {
    _moveto(160, 100);
}

void example_getcurrentposition(void) {
    _getcurrentposition();
}

void example_lineto(void) {
    _lineto(200, 150);
}

void example_rectangle(void) {
    _rectangle(_GBORDER, 50, 50, 150, 150);
}

void example_ellipse(void) {
    _ellipse(_GFILLINTERIOR, 100, 100, 200, 150);
}

void example_arc(void) {
    _arc(160, 100, 260, 150, 200, 50, 100, 150);
}

void example_pie(void) {
    _pie(_GBORDER, 160, 100, 260, 150, 200, 50, 100, 150);
}

void example_setpixel(void) {
    _setpixel(10, 10);
}

void example_getpixel(void) {
    _getpixel(20, 20);
}

void example_floodfill(void) {
    _floodfill(100, 100, 1); /* Fill starting at 100,100 with border color 1 */
}

void example_setcolor(void) {
    _setcolor(4); /* Set color to Red in default palette */
}

void example_getcolor(void) {
    _getcolor();
}

void example_setlinestyle(void) {
    _setlinestyle(0xAAAA); /* Dotted line */
}

void example_getlinestyle(void) {
    _getlinestyle();
}

void example_setfillmask(void) {
    unsigned char fill_pattern[8];
    _setfillmask(fill_pattern);
}

void example_getfillmask(void) {
    unsigned char mask_buffer[8];
    _getfillmask(mask_buffer);
}

void example_setbkcolor(void) {
    _setbkcolor(_BLUE);
}

void example_getbkcolor(void) {
    _getbkcolor();
}

void example_remappalette(void) {
    _remappalette(0, _RED); /* Map palette index 0 to Red */
}

void example_remapallpalette(void) {
    long palette_array[16]; /* Assuming a 16 color mode */
    int i;
    for (i = 0; i < 16; ++i) {
        palette_array[i] = _BLACK; /* Set all to black for example */
    }
    palette_array[1] = _LIGHTBLUE;
    palette_array[2] = _LIGHTGREEN;
    _remapallpalette(palette_array);
}

void example_selectpalette(void) {
    _selectpalette(0); /* Assuming palette 0 exists */
}

void example_settextwindow(void) {
    _settextwindow(2, 2, 24, 79); /* Rows 2-24, Columns 2-79 */
}

void example_outtext(void) {
    _outtext("Hello Graphics World!");
}

void example_wrapon(void) {
    _wrapon(_GWRAPON);
}

void example_displaycursor(void) {
    _displaycursor(_GCURSORON);
}

void example_settextposition(void) {
    _settextposition(5, 10); /* Row 5, Column 10 */
}

void example_gettextposition(void) {
    _gettextposition();
}

void example_settextcolor(void) {
    _settextcolor(14); /* Light Yellow */
}

void example_gettextcolor(void) {
    _gettextcolor();
}

void example_getimage(void) {
    long buffer_size;
    char *image_buffer;
    buffer_size = _imagesize(10, 10, 100, 100);
    /* In a real program, allocate memory: image_buffer = malloc(buffer_size); */
    /* For compilation only, we can just declare a fake buffer pointer */
    image_buffer = (char *)0x1234; /* Fake pointer value */
    if (buffer_size > 0 && buffer_size < 65535L) { /* Basic sanity check */
         /* char local_buffer[1000];  Not safe as size varies hugely */
         /* We just need the call to compile, don't need a real buffer */
        _getimage(10, 10, 100, 100, image_buffer);
    }
}

void example_putimage(void) {
    /* Assume image_buffer contains valid image data from a _getimage call */
    char *image_buffer = (char *)0x5678; /* Fake pointer value */
    _putimage(150, 50, image_buffer, _GPSET);
}

void example_imagesize(void) {
    _imagesize(10, 10, 100, 100);
}


/* Main function calling all examples */
void main(void) {
    example_setvideomode();
    example_setactivepage();
    example_setvisualpage();
    example_getvideoconfig();
    example_setlogorg();
    example_getlogcoord();
    example_getphyscoord();
    example_setcliprgn();
    example_setviewport();
    example_clearscreen();
    example_moveto();
    example_getcurrentposition();
    example_lineto();
    example_rectangle();
    example_ellipse();
    example_arc();
    example_pie();
    example_setpixel();
    example_getpixel();
    example_floodfill();
    example_setcolor();
    example_getcolor();
    example_setlinestyle();
    example_getlinestyle();
    example_setfillmask();
    example_getfillmask();
    example_setbkcolor();
    example_getbkcolor();
    example_remappalette();
    example_remapallpalette();
    example_selectpalette();
    example_settextwindow();
    example_outtext();
    example_wrapon();
    example_displaycursor();
    example_settextposition();
    example_gettextposition();
    example_settextcolor();
    example_gettextcolor();
    example_getimage();
    example_putimage();
    example_imagesize();

    /* Restore default text mode before exiting (good practice, though not required for compile) */
    _setvideomode(_DEFAULTMODE);
}
