#ifndef AES_HEADER
#define AES_HEADER


unsigned char* readFile();
void printHex(unsigned char x);
class AES {
public:
    // Make the constructor and destructor private to avoid instantiation if the class is fully static
    AES() = delete;  // Prevent instantiation
    ~AES() = delete; // Prevent destruction

    static void KeyExpansionCore(unsigned char* in, unsigned char i);
    static void KeyExpansion(unsigned char* inputKey, unsigned char* expandedKeys);
    static void SubBytes(unsigned char* state);
    static void ShiftRows(unsigned char* state);
    static void MixColumns(unsigned char* state);
    static void AddRoundKey(unsigned char* state, unsigned char* roundKey);
    static void Encrypt(unsigned char* message, unsigned char* key);
};
#endif