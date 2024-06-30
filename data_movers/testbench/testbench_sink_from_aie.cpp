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

#include <unistd.h>
#include <sys/stat.h>
#include <fstream>
#include <ap_axi_sdata.h>
#include "../sink_from_aie.cpp"
#include <cmath>

//#define IMM_RANGE 256*256
#define TARGET 128
#define IMM_SIZE 1024

int main(int argc, char *argv[]) { 
    // This testbech will test the sink_from_aie kernel
    // The kernel will receive a stream of data from the AIE
    // and will write it into memory

    // I will create a stream of data
    hls::stream<int> s;
    long int size, h; // = ( 256*2 + 256*256 ) * ( IMM_RANGE/TARGET ), h;
    int i, j, finish = -1234, finish_aie = -1234;
    // I create the buffer to write into memory
    int buffer[256*256+256*2];

    // I have to read the output of AI Engine from the file. 
    // Otherwise, I have no input for my testbench
    std::ifstream file1, file2, file3, file4, file5, file6, file7, file8;
    file1.open("../../aie/x86simulator_output/data/out_plio_sink_1.txt");/*
    file2.open("../../aie/x86simulator_output/data/out_plio_sink_2.txt");
    file3.open("../../aie/x86simulator_output/data/out_plio_sink_3.txt");
    file4.open("../../aie/x86simulator_output/data/out_plio_sink_4.txt");
    file5.open("../../aie/x86simulator_output/data/out_plio_sink_5.txt");
    file6.open("../../aie/x86simulator_output/data/out_plio_sink_6.txt");
    file7.open("../../aie/x86simulator_output/data/out_plio_sink_7.txt");
    file8.open("../../aie/x86simulator_output/data/out_plio_sink_8.txt");*/
    if (!file1) {
        std::cerr << "Unable to open file1 ../../aie/x86simulator_output/out_plio_sink.txt";
        return 1;
    }/*
    if (!file2) {
        std::cerr << "Unable to open file2 ../../aie/x86simulator_output/out_plio_sink.txt";
        return 1;
    }
    if (!file3) {
        std::cerr << "Unable to open file3 ../../aie/x86simulator_output/out_plio_sink.txt";
        return 1;
    }
    if (!file4) {
        std::cerr << "Unable to open file4 ../../aie/x86simulator_output/out_plio_sink.txt";
        return 1;
    }
    if (!file5) {
        std::cerr << "Unable to open file1 ../../aie/x86simulator_output/out_plio_sink.txt";
        return 1;
    }
    if (!file6) {
        std::cerr << "Unable to open file2 ../../aie/x86simulator_output/out_plio_sink.txt";
        return 1;
    }
    if (!file7) {
        std::cerr << "Unable to open file3 ../../aie/x86simulator_output/out_plio_sink.txt";
        return 1;
    }
    if (!file8) {
        std::cerr << "Unable to open file4 ../../aie/x86simulator_output/out_plio_sink.txt";
        return 1;
    }*/


    file1 >> size;
    file2 >> size;
    file3 >> size;/*
    file4 >> size;
    file5 >> size;
    file6 >> size;
    file7 >> size;*/
    file8 >> size;
    printf("SizeTotal:%ld\n", size);
    size = ( 256*2 + 256*256 ) * ( size/TARGET );
    int x=0;
    while( x != finish_aie ){
        file1 >> x;
        s.write(x);
    }
    x=0;/*
    while( x != finish_aie ){
        file2 >> x;
        s.write(x);
    }
    x=0;
    while( x != finish_aie ){
        file3 >> x;
        s.write(x);
    }
    x=0;
    while( x != finish_aie ){
        file4 >> x;
        s.write(x);
    }
    x=0;
    while( x != finish_aie ){
        file5 >> x;
        s.write(x);
    }
    x=0;
    while( x != finish_aie ){
        file6 >> x;
        s.write(x);
    }
    x=0;
    while( x != finish_aie ){
        file7 >> x;
        s.write(x);
    }
    x=0;
    while( x != finish ){
        file8 >> x;
        s.write(x);
    }*/

    printf("Before\n");
    sink_from_aie(s,buffer,size);

    printf("Testbench\n");
    // if the kernel is correct, it will contains the expected data.
    // I can print them, for example, to check that they are equal to the output of AIE
    //print histogram_marginal
    for( i = 0; i < ROWS; i++ ){
        if(buffer[i])
            printf("hist1[%d]: %d\n", i, buffer[i]);
    }

    //print histogram_marginal
    for( i = 0; i < COL; i++ ){
        if(buffer[i + ROWS])
            printf("hist2[%d]: %d\n", i, buffer[i + ROWS]);
    }

    for( i = 0; i < ROWS; i++ ){
        for( j = 0; j < COL; j++ ){
            if(buffer[ROWS + COL + i*256 + j ])
                printf("Joint[%d][%d]: %d\n", i, j, buffer[ ROWS + COL + i*256 + j ] ); //COL perché abbiamo appena scritto l'histogramma marginale   
        }
    }
    //delete[] &buffer;

    // Note that: you may also have a code that runs the AI Engine from your kernel, and so a testbench
    // that simulates the entire application flow. It is useful, but still I would suggest to use single kernel testbench too.
}
