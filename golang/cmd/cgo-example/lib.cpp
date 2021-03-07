#include <iostream>

#if defined(CGO)
    // CGO
    #include "lib_cgo.h"
#else
    #include "lib.h"
#endif

// #include "lib_cgo.h"

int hello() {
    #if defined(CGO)
        std::cout << "using: lib_cgo.h" << std::endl;
    #elif defined(FFF)
        std::cout << "using: fff" << std::endl;
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
    std::cout << "say something in cpp: " << s << std::endl;
}
