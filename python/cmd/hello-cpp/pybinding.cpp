#include <pybind11/pybind11.h>
#include "./lib.cpp"

#define STRINGIFY(x) #x
#define MACRO_STRINGIFY(x) STRINGIFY(x)

// int add(int i, int j) {
//     std::cout << "input: i=" << i << " j=" << j << std::endl;
//     return i + j;
// }

namespace py = pybind11;

PYBIND11_MODULE(pybindcmake, m) {
    m.doc() = R"pbdoc(
Pybind11 example plugin
-----------------------
pretty dumb docs

.. currentmodule:: pybindcmake

.. autosummary::
    :toctree: _generate

add
subtract
)pbdoc";

    m.def("add", &add, R"pbdoc(
        Add two numbers

        Some other explanation about the add function.
    )pbdoc");

    m.def("subtract", [](int i, int j) { return i - j; }, R"pbdoc(
        Subtract two numbers

        Some other explanation about the subtract function.
    )pbdoc");

#ifdef VERSION_INFO
    m.attr("__version__") = MACRO_STRINGIFY(VERSION_INFO);
#else
    m.attr("__version__") = "dev";
#endif
}
