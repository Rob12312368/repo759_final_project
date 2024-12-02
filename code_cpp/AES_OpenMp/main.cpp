#include <iostream>
#include <string>
#include <cstring>
#include <ctime>   
#include <chrono>
#include <fstream>
#include "AES.h"
using std::chrono::high_resolution_clock;
using std::chrono::duration;

int main(){
    unsigned char* message = readFile();
    unsigned char key[16] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};

    AES aes(key);

    
    int originalLen = strlen((const char*)message);
    int lenOfPaddingMessage = originalLen;
    if(lenOfPaddingMessage % 16 != 0)
        lenOfPaddingMessage = (lenOfPaddingMessage / 16 + 1) * 16;

    unsigned char* paddedMessage = new unsigned char[lenOfPaddingMessage];
    for(int i = 0; i < lenOfPaddingMessage; i++){
        if(i >= originalLen)
            paddedMessage[i] = 0;
        else
            paddedMessage[i] = message[i];
    }


    high_resolution_clock::time_point start;
    high_resolution_clock::time_point end;
    duration<double, std::milli> duration_sec;
    start = high_resolution_clock::now();

    #pragma omp parallel for schedule(static)
    for(int i = 0; i < lenOfPaddingMessage; i+=16)
        aes.Encrypt(paddedMessage+i, key);
    end = high_resolution_clock::now();
    duration_sec = std::chrono::duration_cast<duration<double, std::milli> >(end - start);
    std::cout << "time: " << duration_sec.count() << "ms\n";

    for(int i=0; i < lenOfPaddingMessage; i++){
        printHex(paddedMessage[i]);
        std::cout << " ";
    }


    #pragma omp parallel for schedule(static)
    for(int i = 0; i < lenOfPaddingMessage; i+=16)
        aes.Decrypt(paddedMessage+i, key);
    end = high_resolution_clock::now();
    duration_sec = std::chrono::duration_cast<duration<double, std::milli> >(end - start);
    std::cout << "time: " << duration_sec.count() << "ms\n";

    for(int i=0; i < lenOfPaddingMessage; i++){
        std::cout << paddedMessage[i];
        std::cout << " ";
    }

    delete [] paddedMessage;

    
    return 0;
}