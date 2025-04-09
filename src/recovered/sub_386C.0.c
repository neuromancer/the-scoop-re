#include <stdio.h>

unsigned char g_array_at_10E[256];
unsigned char g_array_at_E9D6[256];

struct TargetData {
    unsigned char byte0;
    unsigned char byte1;
    unsigned char padding1[2];
    unsigned char byte4;
    unsigned char padding2[5];
};

struct TargetData g_array_at_C5A4[256];

int sub_5876(int p1, int p2) {
    
    return 0; 
}

void sub_45CB(int p1, int p2, int p3) {
    
}

void sub_498C(int p1) {
    
}

void sub_9876(int p1) {
    
}


int sub_386C(unsigned char arg_0) {
    struct TargetData *var_4; 
    int var_6;           
    int var_8;           
    int var_A;           
    unsigned char var_C; 

    int temp_index_signed = (int)(signed char)arg_0;
    var_C = g_array_at_10E[temp_index_signed];

    if (var_C != 0 && var_C < 3) {
        
        var_A = (int)g_array_at_E9D6[temp_index_signed]; 

        var_4 = &g_array_at_C5A4[var_A];

        var_6 = (int)var_4->byte0 + 1;

        var_8 = (int)var_4->byte1;

        var_4->byte4 = 3;

        if ((sub_5876(var_6 + 2, var_8 + 6) & 0x08) == 0) {
            
            if (g_array_at_10E[temp_index_signed] == 4) {
                
                var_8++;
            }

            
            g_array_at_10E[temp_index_signed] = 0;

            
            sub_45CB(var_A, var_6, var_8);

            
            sub_9876(var_6);

            
            return 1;

        } else {
            
            g_array_at_10E[temp_index_signed] = 0;

            
            sub_45CB(var_A, var_6 - 1, var_8);

            
            sub_498C(temp_index_signed); 

            
            return 1;
        }

    } else {
        
        return 0;
    }

    
}

int main() {
    
    sub_386C(0);
    return 0; 
}
