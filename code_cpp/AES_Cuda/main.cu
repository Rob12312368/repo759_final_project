#include <iostream>
#include <string>
#include <cstring>
#include <ctime>   
#include <chrono>
#include <fstream>
#include "AES.cuh"
#include <cuda.h>


int main(int argc, char* argv[]){
    int thread_num = std::stoi(argv[1]);

    unsigned char* message = readFile();
    unsigned char key[16] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
    unsigned char* d_key;


    cudaEvent_t startEvent, stopEvent;
    cudaEventCreate(&startEvent);
    cudaEventCreate(&stopEvent);

    int originalLen = strlen((const char*)message);
    int lenOfPaddingMessage = originalLen;
    if(lenOfPaddingMessage % 16 != 0)
        lenOfPaddingMessage = (lenOfPaddingMessage / 16 + 1) * 16;

    unsigned char* paddedMessage = new unsigned char[lenOfPaddingMessage];
    unsigned char* d_paddedMessage;
    for(int i = 0; i < lenOfPaddingMessage; i++){
        if(i >= originalLen)
            paddedMessage[i] = 0;
        else
            paddedMessage[i] = message[i];
    }

    cudaMalloc((void**)&d_key, 16);
    cudaMalloc((void**)&d_paddedMessage, lenOfPaddingMessage);


    cudaMemcpy(d_key, key, 16, cudaMemcpyHostToDevice);
    cudaMemcpy(d_paddedMessage, paddedMessage, lenOfPaddingMessage, cudaMemcpyHostToDevice);

    cudaEventRecord(startEvent, 0);
    AES_CUDA(d_paddedMessage, d_key, lenOfPaddingMessage, thread_num);
    cudaEventRecord(stopEvent, 0);
    cudaEventSynchronize(stopEvent);
    float elapsedTime;
    cudaEventElapsedTime(&elapsedTime, startEvent, stopEvent);

    cudaMemcpy(paddedMessage, d_paddedMessage, lenOfPaddingMessage, cudaMemcpyDeviceToHost);
    std::cout << "time: " << elapsedTime << "\n";
    for(int i=0; i < lenOfPaddingMessage; i++){
        printHex(paddedMessage[i]);
        std::cout << " ";
    }
    std::cout << "\n";
    delete [] paddedMessage;

    
    return 0;
}