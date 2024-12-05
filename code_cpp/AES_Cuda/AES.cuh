#ifndef AES_HEADER
#define AES_HEADER

#include <cuda.h>

__host__ unsigned char* readFile();
__host__ void printHex(unsigned char x);

__host__ void AES_CUDA(unsigned char* message, unsigned char* key, int n, int thread_num);
__global__ void AES_Kernel(unsigned char* message, unsigned char* key, int n);

class AES {
public:
    // Make the constructor and destructor private to avoid instantiation if the class is fully static
    AES() = delete;  // Prevent instantiation
    ~AES() = delete; // Prevent destruction

    __device__ static void KeyExpansionCore(unsigned char* in, unsigned char i);
    __device__ static void KeyExpansion(unsigned char* inputKey, unsigned char* expandedKeys);
    __device__ static void SubBytes(unsigned char* state);
    __device__ static void ShiftRows(unsigned char* state);
    __device__ static void MixColumns(unsigned char* state);
    __device__ static void AddRoundKey(unsigned char* state, unsigned char* roundKey);
    __device__ static void Encrypt(unsigned char* message, unsigned char* key);
};
#endif