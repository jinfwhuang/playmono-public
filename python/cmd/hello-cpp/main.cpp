#include <iostream>

// Use a header file instead
#include "./lib.cpp"

int main (int argc, char *argv[]) {
    std::cout << "starting main" << std::endl;

    add(5, 11);
    std::cout << "done" << std::endl;
    return 0;
}
