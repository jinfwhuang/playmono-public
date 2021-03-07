
load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")
load("@pybind11_bazel//:build_defs.bzl", "pybind_extension", "pybind_library")

load("@rules_python//python:defs.bzl", "py_binary")
load("@py_deps//:requirements.bzl", "requirement")



pybind_library(
    name = "pybind_lib1",
    srcs = ["lib.cpp"],
    hdrs = ["lib.h"],
)

pybind_extension(
    name = "pybind_module1",  # pybind_module.so
    srcs = glob([
        "pybind_module1.cpp",
        # "lib.cpp",
        # "lib.h",
    ]),
    # hdrs = ["lib.h"],
    deps = [
        ":pybind_lib1"
    ]
)

py_library(
    name = "pybind_module1",
    visibility = ["//visibility:public"],
    data = [":pybind_module1.so"],
    imports = ["."],
)


cc_library(
    name = "lib1",
    srcs = ["lib.cpp"],
    hdrs = ["lib.h"],
)

cc_binary(
    name = "binary",
    srcs = glob([
        "main.cpp",
        # "lib.cpp",
        # "lib.h",
    ]),
    # hdrs = ["lib.h"],
    deps = [
        ":lib1"
    ]
)
