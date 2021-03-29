#include <string>
#include <iostream>
#include "lib.h"


#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#include <emscripten/bind.h>
using namespace emscripten;
#endif

void sayHello() {
    std::cout << "hello" << std::endl;
}

#ifdef __EMSCRIPTEN__
// Symbols are exposed by embind to the Emscripten Module object in javascript
EMSCRIPTEN_BINDINGS(Hello) {
    function("sayHello", &sayHello);
    function("hello", &hello);
    function("saysomething", &saysomething);
    function("add", &add);
}

EMSCRIPTEN_KEEPALIVE void myFunction(int argc, char ** argv) {
    std::cout << "cpp function is called" << std::endl;
}
#endif

int main(int argc, char** argv) {
    std::cout << "---------------------------------------" << std::endl;
    std::cout << "running main function in wasm template" << std::endl;
    std::cout << "---------------------------------------" << std::endl;
}
