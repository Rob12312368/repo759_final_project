#ifndef AES_HEADER
#define AES_HEADER


unsigned char* readFile();
void printHex(unsigned char x);
class AES{
    private:
        unsigned char* key;
    public:
        AES(unsigned char* key): key(key){};
        ~AES(){};
        void KeyExpansionCore(unsigned char* in , unsigned char i);
        void KeyExpansion(unsigned char* inputKey, unsigned char* expandedKeys);
        void SubBytes(unsigned char* state);
        void SubBytes_Inv(unsigned char* state);
        void ShiftRows(unsigned char* state);
        void ShiftRows_Inv(unsigned char* state);
        void MixColumns(unsigned char* state);
        void MixColumns_Inv(unsigned char* state);
        void AddRoundKey(unsigned char* state, unsigned char* roundKey);
        void Encrypt(unsigned char* message, unsigned char* key);
        void Decrypt(unsigned char* message, unsigned char* key);
};
#endif