#include <pybind11/pybind11.h>
#include "lib.h"

#define STRINGIFY(x) #x
#define MACRO_STRINGIFY(x) STRINGIFY(x)

// int add(int i, int j) {
//     std::cout << "input: i=" << i << " j=" << j << std::endl;
//     return i + j;
// }

// PYBIND11_MODULE(pybind_module1, m) { m.def("add", &add, "adds two numbers"); }


namespace py = pybind11;

PYBIND11_MODULE(pybind_module1, m) {
    // module doc string
  m.doc() = R"pbdoc(
Pybind11 example plugin
-----------------------
pretty dumb docs

.. currentmodule:: pybind_module1

.. autosummary::
  :toctree: _generate

add
subtract
)pbdoc";

    // --------------------------
    // add
    // --------------------------
    m.def("add", &add, R"pbdoc(
        Add two numbers

        Some other explanation about the add function.
    )pbdoc");

    m.def("subtract", [](int i, int j) { return i - j; }, R"pbdoc(
        Subtract two numbers

        Some other explanation about the subtract function.
    )pbdoc");

    // --------------------------
    // saysomething
    // --------------------------
    m.def("saysomething", &saysomething, "saysomething with an arg");

#ifdef VERSION_INFO
    m.attr("__version__") = MACRO_STRINGIFY(VERSION_INFO);
#else
    m.attr("__version__") = "dev";
#endif
}
