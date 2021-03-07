#include <iostream>
#include "lib.h"

int main (int argc, char *argv[]) {
    std::cout << "starting main" << std::endl;

    std::cout << "----------------" << std::endl;
    hello();

    std::cout << "----------------" << std::endl;
    add(5, 11);

    std::cout << "----------------" << std::endl;
    saysomething("|CPP STRING|");
    std::cout << "----------------" << std::endl;

    return 0;
}
