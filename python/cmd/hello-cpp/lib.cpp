#include <iostream>

int add(int i, int j) {
    int out = i + j;

    std::cout << 
    "i=" << i << 
    " j=" << j <<
    "; output: " << out << 
    std::endl;

    std::cout << "output: " << out << std::endl;

    return out;
}
