#include "AES_Operation.hpp"


void AES::printState(uint8_t state[4][4]){
    for (uint8_t i = 0; i < 4; ++i) {
        for (uint8_t j = 0; j < 4; ++j) {
            std::cout << std::showbase << std::hex << std::setw(4) 
                      << static_cast<int>(state[i][j]) << " ";
        }
        std::cout << std::endl;
    }
}
void AES::subBytes(uint8_t state[4][4]){
    //parallelizable
    for(uint8_t i = 0; i < 4; i++){
        for(uint8_t j = 0; j < 4; j++){
            state[i][j] = AES::sbox[state[i][j]];
        }
    }
}
void AES::shiftRows(uint8_t state[4][4]){
    //parallelizable
    for(int i=1; i < 4; i++){
        rightRotate(state, i);
    }
}

void rightRotate(uint8_t state[4][4], int offset){
    uint8_t tmp[4];
    for(int i = 0; i < 4; i++)
        tmp[i] = state[offset][i];

    for(int i = 0; i < 4; i++)
        state[offset][i] = tmp[(i+offset) % 4];
    

}