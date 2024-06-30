/*
MIT License

Copyright (c) 2023 Paolo Salvatore Galfano, Giuseppe Sorrentino

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

#include <ap_int.h>
#include <hls_stream.h>
#include <hls_math.h>
#include <ap_axi_sdata.h>
#include "../common/common.h"

#define ROWS 256
#define COL 256
#define LEN 8
#define TARGET 128
#define IMM_SIZE 1024
#define SKIP -1000
#define FINISH -1234
extern "C" {
// We need 1 input stream, from AIE
// We need 1 write what the AIE sends to the PL, into memory
// We need 1 input from host

void sink_from_aie(
    hls::stream<int>& input_stream, 
    int* output, 
    long int size)
{

// PRAGMA for stream
#pragma HLS interface axis port=input_stream // there are several options, just look for them :) 
// PRAGMA for memory interation - AXI master-slave
#pragma HLS INTERFACE m_axi port=output depth=100 offset=slave bundle=gmem1
#pragma HLS INTERFACE s_axilite port=output bundle=control
// PRAGMA for AXI-LITE : required to move params from host to PL
#pragma HLS interface s_axilite port=size bundle=control
#pragma HLS interface s_axilite port=return bundle=control


    int value;
    int i, k, j, h, iteration = 0, x, flag; 
    int joint[ROWS][COL];
    int h1[ROWS], h2[COL];
    //krintf("Codice iniziato:, loop:%d, size:%ld\n", loop, size);

    /*for( i = 0; i < size; i++ ){
        //krintf("Value:%d pos:%d\n", input_stream.read(), i);
    }*/

    for( i = 0; i < ROWS; i++ ){
        h1[i] = 0;
        h2[i] = 0;
        for( j = 0; j < COL; j++ ){
            joint[i][j] = 0;
        }
    }
    //processing first aie: the one that has got the hist_y
    flag = 1, i = 0, j = 0;
    while( flag ){
        
        value = input_stream.read();
        //krintf("helo, value:%d\n", value);
        if( value == FINISH  ){
            flag = 0;
            break;
        }
        else if( value >= 0 ){ // normal exec
            i = value;
            j = input_stream.read();
            joint[i][j] += input_stream.read();
            h2[j] += input_stream.read();
            //krintf("joint[%d][%d]:%d, h2[%d]:%d, i:%d, j:%d\n", i, j, joint[i][j], j, h2[j], i,  j);
        }
        else if( value != SKIP  ){//histogram 1

            if(value != -1001){
                i = - value - 1;
            }
            h1[i] += input_stream.read();
            //krintf("Value:%d, h1[%d]:%d, i:%d, j:%d\n", value, i, h1[i],  i, j);
        }


    }
    
    //now we can //kprint h2 since we already have it and we don't need to calculate it anymore
    for( i = 0; i < COL; i++ ){
        output[i] = h1[i];
        //k//krintf("h1[%d]:%d\n", i, h1[i]);    
    }
    for( j = 0; j < COL; j++ ){
        output[j + ROWS] = h2[j];  
        //k//krintf("h2[%d]:%d\n", j, h2[j]);    
    }
    
    //k//krintf("post 2loop, pre joint //kprint\n");
    //now we can //kprint joint 
    for( i = 0; i < ROWS; i++ ){
        for( j = 0; j < COL; j++ ){
            output[COL + ROWS + i*ROWS + j] = joint[i][j];    
            //krintf("joint[%d][%d]:%d\n", i, j, joint[i][j]);        
        }
    }
}
}
