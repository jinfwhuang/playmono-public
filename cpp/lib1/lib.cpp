#include <iostream>

#if defined(CGO)
    // CGO
    #include "lib_cgo.h"
#else
    #include "lib.h"
#endif

int hello() {
    #if defined(CGO)
        std::cout << "using: lib_cgo.h" << std::endl;
    #else
        std::cout << "using: lib.h" << std::endl;
    #endif

    std::cout << "Hello, World! " << std::endl;
    return 0;
}

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

void saysomething1(char* s) {
    std::cout << "saysomething in shared cpp library cpp/lib1/lib.cpp:: " << s << std::endl;
}

void saysomething(std::string s) {
    std::cout << "saysomething in share cpp library cpp/lib1/lib.cpp: " << s << std::endl;
}

