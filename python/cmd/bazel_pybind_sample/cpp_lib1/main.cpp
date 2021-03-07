#include <iostream>
#include "lib.h"

int main (int argc, char *argv[]) {
    std::cout << "starting main" << std::endl;

    add(5, 11);

    saysomething("from cpp main");

    std::cout << "done" << std::endl;
    return 0;
}
