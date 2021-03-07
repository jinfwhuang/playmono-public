load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "lib1",
    srcs = ["lib.cpp"],
    hdrs = ["lib.h"],
)

cc_binary(
    name = "cpp_binary",
    srcs = glob([
        "main.cpp",
    ]),
    deps = [
        ":lib1"
    ]
)

# ------------------------------
# Compile to go
# ------------------------------
load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library", "go_test")

go_library(
    name = "go_lib",
    srcs = glob([
        "lib1.go",
        "lib_cgo.h",
        "lib.cpp",
    ]),
    importpath = "github.com/jinfwhuang/playmono/cpp/lib1",
    cgo = True,
    cppopts = [
        "-DCGO=1",
    ]
)

go_binary(
    name = "go_binary",
    deps = ["//cpp/lib1:go_lib"],
    srcs = [
        "main.go",
    ],
)

# ------------------------------
# Compile to python
# ------------------------------
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

py_binary(
    name = "py_binary",
    visibility = ["//visibility:public"],
    main = "main.py",
    srcs = ["main.py"],
    deps = [
        ":pybind_module1",
        # ":my_pb_mod",
        requirement("requests"),
        # "//python/bazel/pkg/hellolib:lib",
    ],
)

