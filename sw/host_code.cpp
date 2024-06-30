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

#include <iostream>
#include <fstream>
#include <cstdlib>
#include <unistd.h>
#include <sys/stat.h>
#include <string>
#include "experimental/xrt_kernel.h"
#include "experimental/xrt_uuid.h"
#include "../common/common.h"

// For hw emulation, run in sw directory: source ./setup_emu.sh -s on

#define DEVICE_ID 0

#define RANGE 256
#define TARGET 512
#define IMM_SIZE 512
// every top function input that must be passed from the host to the kernel must have a unique index starting from 0

// args indexes for setup_aie kernel
#define arg_setup_aie_size 0
#define arg_setup_aie_input1 1
#define arg_setup_aie_input2 1

// args indexes for sink_from_aie kernel
#define arg_sink_from_aie_output 1 
#define arg_sink_from_aie_size 2

bool get_xclbin_path(std::string& xclbin_file);
std::ostream& bold_on(std::ostream& os);
std::ostream& bold_off(std::ostream& os);

int checkResult(uint8_t* flo, uint8_t* ref, int* output, int size) {
    int joint[RANGE][RANGE];
    int hist_x[RANGE];
    int hist_y[RANGE];
    int val = 0;
    int pos;
    for(int i = 0; i < TARGET; i++){
        printf("i:%d, ref:%d, flo:%d\n", i, ref[i], flo[i]);
    }

    for( pos=0; pos<size; pos++){
        printf("Pos:%d, output:%d\n", pos, output[pos]);
    } 

    
    for (int i = 0; i < RANGE; i++) {
        for(int j=0; j < RANGE;j++){
            joint[flo[i]][ref[j]]++;
        }
        hist_y[ref[i]]++;
        hist_x[flo[i]]++;
    }


    for (int i = 0; i < RANGE; i++) {
        if( hist_x[i] != output[i] ){
            std::cout << "Error!" << std::endl;
        }
    }
    for(int i=0; i < RANGE; i++){
        if( hist_y[i] != output[i+RANGE] ){
            std::cout << "Error!" << std::endl;
        }
    }

    for (int i = 0; i < RANGE; i++) {
        for(int j=0; j < RANGE;j++){
            if( joint[flo[i]][ref[j]] == output[ 2*RANGE + (i*RANGE) + j ] )
        }
    }

    std::cout << "Test passed!" << std::endl;
    return EXIT_SUCCESS;
}

int main(int argc, char *argv[]) {
    
    int size = TARGET;

    uint8_t flo[TARGET+128];
    uint8_t ref[TARGET];
    for(int i=0; i < 128; i++){
        flo[i] = (uint8_t) 0;
        ref[i] = (uint8_t) 0;
    }
    std::cout << "Pizza" << std::flush;
    for(int i=128; i < 512; i++){
        flo[i] = (uint8_t) 10;
        ref[i] = (uint8_t) 12;
    }


//------------------------------------------------LOADING XCLBIN------------------------------------------    
    
    std::string xclbin_file;
    if (!get_xclbin_path(xclbin_file))
        return EXIT_FAILURE;

    // Load xclbin
    std::cout << "1. Loading bitstream (" << xclbin_file << ")... ";
    xrt::device device = xrt::device(DEVICE_ID);
    xrt::uuid xclbin_uuid = device.load_xclbin(xclbin_file);
    std::cout << "Done" << std::endl;
//----------------------------------------------INITIALIZING THE BOARD------------------------------------------

    // create kernel objects
    xrt::kernel krnl_setup_aie_0 = xrt::kernel(device, xclbin_uuid, "setup_aie:{setup_aie_0}");
    xrt::kernel krnl_setup_aie_1 = xrt::kernel(device, xclbin_uuid, "setup_aie:{setup_aie_1}");
    xrt::kernel krnl_sink_from_aie = xrt::kernel(device, xclbin_uuid, "sink_from_aie:{sink_from_aie_0}");

    // get memory bank groups for device buffer - required for axi master input/output
    xrtMemoryGroup bank_output = krnl_sink_from_aie.group_id(arg_sink_from_aie_output);
    xrtMemoryGroup bank_input_0 = krnl_setup_aie_0.group_id(arg_setup_aie_input1);
    xrtMemoryGroup bank_input_1 = krnl_setup_aie_1.group_id(arg_setup_aie_input2);

    // create device buffers
    xrt::bo buffer_setup_aie_0 = xrt::bo(device, (128+IMM_SIZE )* sizeof(u_int8_t), xrt::bo::flags::normal, bank_input_0); 
    xrt::bo buffer_setup_aie_1 = xrt::bo(device, IMM_SIZE * sizeof(u_int8_t), xrt::bo::flags::normal, bank_input_1); 
    xrt::bo buffer_sink_from_aie = xrt::bo(device, 256*256 + 512 , xrt::bo::flags::normal, bank_output); 

    // create runner instances
    xrt::run run_setup_aie_0 = xrt::run(krnl_setup_aie_0);
    xrt::run run_setup_aie_1 = xrt::run(krnl_setup_aie_1);
    xrt::run run_sink_from_aie = xrt::run(krnl_sink_from_aie);

    // set setup_aie kernel arguments
    run_setup_aie_0.set_arg(arg_setup_aie_size, TARGET);
    run_setup_aie_0.set_arg(arg_setup_aie_input1, buffer_setup_aie_0);

    run_setup_aie_1.set_arg(arg_setup_aie_size, TARGET);
    run_setup_aie_1.set_arg(arg_setup_aie_input2, buffer_setup_aie_1);

    // set sink_from_aie kernel arguments
    run_sink_from_aie.set_arg(arg_sink_from_aie_output, buffer_sink_from_aie);
    run_sink_from_aie.set_arg(arg_sink_from_aie_size, size);

    // write data into the input buffers
    buffer_setup_aie_0.write(flo);
    buffer_setup_aie_0.sync(XCL_BO_SYNC_BO_TO_DEVICE);

    buffer_setup_aie_1.write(ref);
    buffer_setup_aie_1.sync(XCL_BO_SYNC_BO_TO_DEVICE);

    // run the kernels
    run_setup_aie_0.start();
    run_setup_aie_1.start();
    run_sink_from_aie.start();

    // wait for the kernels to finish
    run_setup_aie_0.wait();
    run_setup_aie_1.wait();
    run_sink_from_aie.wait();

    // read the output buffer
    buffer_sink_from_aie.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
    int output_buffer[256*256+512];
    /*for( int i=0; i<256*256; i++ ){
        output_buffer[i] = 0;
    }*/
    buffer_sink_from_aie.read(output_buffer);

    // ---------------------------------CONFRONTO PER VERIFICARE L'ERRORE--------------------------------------
        
    // Here there should be a code for checking correctness of your application, like a software application

    return checkResult(flo, ref, output_buffer, size);
    }


bool get_xclbin_path(std::string& xclbin_file) {
    // Judge emulation mode accoring to env variable
    char *env_emu;
    if (env_emu = getenv("XCL_EMULATION_MODE")) {
        std::string mode(env_emu);
        if (mode == "hw_emu")
        {
            std::cout << "Program running in hardware emulation mode" << std::endl;
            xclbin_file = "overlay_hw_emu.xclbin";
        }
        else
        {
            std::cout << "[ERROR] Unsupported Emulation Mode: " << mode << std::endl;
            return false;
        }
    }
    else {
        std::cout << bold_on << "Program running in hardware mode" << bold_off << std::endl;
        xclbin_file = "overlay_hw.xclbin";
    }

    std::cout << std::endl << std::endl;
    return true;
}

std::ostream& bold_on(std::ostream& os)
{
    return os << "\e[1m";
}

std::ostream& bold_off(std::ostream& os)
{
    return os << "\e[0m";
}

