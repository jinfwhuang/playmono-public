#include "lib.h"

int add(int i, int j) {
    int out = i + j;

    std::cout << 
    "i=" << i << 
    " j=" << j <<
    "; output: " << out << 
    std::endl;

    std::cout << "output2: " << out << std::endl;

    return out;
}

void saysomething(std::string s) {
    std::cout << "saysomething special: " << s << std::endl;
}
