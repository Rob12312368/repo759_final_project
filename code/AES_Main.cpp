#include "AES_Operation.hpp"


int main(int argc, char *argv[]){

    uint8_t start[4][4] = {{'a', 'b', 'c', 'd'},
    {'a', 'b', 'c', 'd'},
    {'a', 'b', 'c', 'd'},
    {'a', 'b', 'c', 'd'}};

    AES::shiftRows(start);
    AES::printState(start);

}