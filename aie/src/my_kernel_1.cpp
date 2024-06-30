#include "my_kernel_1.h"
#include "common.h"
#include "aie_api/aie.hpp"
#include "aie_api/aie_adf.hpp"
#include "aie_api/utils.hpp"


#define HISTO_ROWS 32
#define HISTO_COL 256
#define TARGET 128
#define START 0
#define END 256
#define LEN 8
#define IMM_SIZE 512
#define NUM_INPUT 2
#define SKIP -1000
#define FINISH -1234

//API REFERENCE for STREAM: 
// https://docs.amd.com/r/ehttps://docs.amd.com/r/en-US/ug1079-ai-engine-kernel-coding/Reading-and-Advancing-an-Input-Streamn-US/ug1079-ai-engine-kernel-coding/Reading-and-Advancing-an-Input-Stream

void my_kernel_function (input_stream<uint8>* restrict input, input_stream<uint8>* restrict input2, output_stream<int>* restrict output)
{
    // read from one stream and write to another
    int i, j, k, values, acc;
    int red = 0, val = 0, hist; 
    aie::vector<int, 4> print_marginal;
    print_marginal.set( SKIP, 2 );
    print_marginal.set( SKIP, 3 );
    print_marginal.set( SKIP, 1 );
    
    aie::vector<uint8, TARGET> x1 = readincr_v<TARGET>(input);
    aie::vector<uint8, TARGET> x2 = readincr_v<TARGET>(input2);
    int size = (x1.get(0)+1) * (x1.get(1)+1) * IMM_SIZE;
    print_marginal.set( size, 0 );
    writeincr( output, print_marginal );

    //aie vectors with ones
    aie::vector<uint8, TARGET> ones = aie::broadcast<uint8, TARGET>(1);

    //masks for comparison
    aie::mask<TARGET> mask_y1, mask_y2; //, mask_y3, mask_y4; //, mask_y5, mask_y6, mask_y7, mask_y8;
    aie::mask<TARGET> mask1, mask2; //, mask3, mask4; //, mask5, mask6, mask7, mask8;

    aie::vector<uint8, TARGET> compare_y = aie::zeros<uint8, TARGET>(); //resetting compare_y to 0    
    
    aie::vector<int, 4> print;


    int maskc1, maskc2, maskc3, maskc4; //, maskc5, maskc6, maskc7, maskc8 ;
    int loop = size/(TARGET*NUM_INPUT);
    for( k=0; k < loop; k++ ){
        aie::vector<uint8, TARGET> x1 = readincr_v<TARGET>(input);
        aie::vector<uint8, TARGET> x2 = readincr_v<TARGET>(input);

        aie::vector<uint8, TARGET> y1 = readincr_v<TARGET>(input2);
        aie::vector<uint8, TARGET> y2 = readincr_v<TARGET>(input2);
        
        //aie vector to compare floating and reference
        aie::vector<uint8, TARGET> compare_x = aie::broadcast<uint8, TARGET>(START);
        
        val = 0, red = 0;
        compare_y = aie::zeros<uint8, TARGET>();
        //IN THE FIRST CICLE I PRINT IN OUT THE MARGINAL HIST, UNTIL I GET NEW VALUES FROM INPUT2
        i = START;
        mask1 = aie::eq(x1, compare_x);
        mask2 = aie::eq(x2, compare_x);

        //at the end i print in output the marginal histogram
        hist = (int)mask1.count() + (int)mask2.count(); // + (int)mask3.count() + (int)mask4.count() ; //+  (int)mask5.count() + (int)mask6.count() + (int)mask7.count() + (int)mask8.count() ;
        if( hist ){
            print_marginal.set( -i-1, 0 );
            print_marginal.set( hist, 1 );
            writeincr( output, print_marginal );
        }

        for( j = 0; j < 256; j++ ){

            mask_y1 = aie::eq(y1, compare_y);
            mask_y2 = aie::eq(y2, compare_y);
            hist = (int)mask_y1.count() + (int)mask_y2.count(); // + (int)mask_y3.count() + (int)mask_y4.count(); // + (int)mask_y5.count() + (int)mask_y6.count() + (int)mask_y7.count() + (int)mask_y8.count();

            mask_y1 = mask1 & mask_y1;
            mask_y2 = mask2 & mask_y2;
            red = (int)mask_y1.count() + (int)mask_y2.count(); // + (int)mask3.count() + (int)mask4.count();// + (int)mask5.count() + (int)mask6.count() + (int)mask7.count() + (int)mask8.count();

            

            val += red;


            if( red || hist ){
                print.set( i, 0 );                
                print.set( j, 1 );
                print.set( red, 2 );
                print.set( hist, 3 );
                writeincr(output, print);
                /*
                writeincr( output, i );
                writeincr( output, j );
                writeincr( output, red );
                writeincr( output, hist );*/
            }
        

            if( val == TARGET*NUM_INPUT ){
                i = 1000;
                j = 1000;
            }
            compare_y = aie::add( compare_y, ones);   
        }
        compare_x = aie::add( compare_x, ones);
        compare_y = aie::zeros<uint8, TARGET>();
        i++;
        val = 0;
        red = 0;
        print.set( 0, 3 );
        for( ; i < END; i++ ){ //i is not reinizilized so that if i exit on VAL == TARGET i dont reenter
            mask1 = aie::eq(x1, compare_x);
            mask2 = aie::eq(x2, compare_x);
            /*mask3 = aie::eq(x3, compare_x);
            mask4 = aie::eq(x4, compare_x);
            mask5 = aie::eq(x5, compare_x);
            mask6 = aie::eq(x6, compare_x);
            mask7 = aie::eq(x7, compare_x);
            mask8 = aie::eq(x8, compare_x);*/

            maskc1 = (int)mask1.count();
            maskc2 = (int)mask2.count();
            /*maskc3 = (int)mask3.count();
            maskc4 = (int)mask4.count();
            maskc5 = (int)mask5.count();
            maskc6 = (int)mask6.count();
            maskc7 = (int)mask7.count();
            maskc8 = (int)mask8.count();*/
    
            //values cointains how many values we have to look for with this input
            values = maskc1 + maskc2; // + maskc3 + maskc4;
            //printf("Values:%d, i:%d, compare:%d, maskc1:%d, maskc2:%d, maskc3:%d, maskc4:%d, x1:%d, x2:%d, x3:%d, x4:%d\n", values, i, compare_x,get(0), maskc1, maskc2, maskc3, maskc4, x1.get(0), x2.get(0), x3.get(0), x4.get(0) );
            if( values ){
                
                print_marginal.set( -i-1, 0 );
                print_marginal.set( values, 1 );
                writeincr( output, print_marginal );
            
                
                for( j = 0; j < 256; j++ ){
                    if( maskc1 ){
                        mask_y1 = aie::eq(y1, compare_y);
                        mask_y1 = mask1 & mask_y1;
                        red += mask_y1.count();
                        //red += acc;
                        //maskc1 -= acc;
                    }
                    if( maskc2 ){
                        mask_y2 = aie::eq(y2, compare_y);
                        mask_y2 = mask2 & mask_y2;
                        red += mask_y2.count();
                        //red += acc;
                        //maskc2 -= acc;
                    }
                    


                    val += red;
                                    
                    if( red ){
                        //printf("Red:%d, hist:%d, i:%d, j:%d\n ", red, hist, i, j);
                        print.set( i, 0 );                
                        print.set( j, 1 );
                        print.set( red, 2 );
                        writeincr(output, print);
                        
                    }



                    if( val == values ){
                        i = 1000;
                        j = 1000;
                    }
                
                    compare_y = aie::add( compare_y, ones);  
                    red = 0;
                }
            }
            compare_x = aie::add( compare_x, ones);
            compare_y = aie::zeros<uint8, TARGET>();
        } 
    }
    print_marginal.set( SKIP, 0 );
    print_marginal.set( SKIP, 1 );
    print_marginal.set( SKIP, 2 );
    print_marginal.set( FINISH, 3 );
    writeincr( output, print_marginal );

}
