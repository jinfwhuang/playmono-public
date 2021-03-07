package(default_visibility = ["//visibility:public"])

load(
    # "@io_bazel_rules_python//python:python.bzl",
    "@rules_python//python:defs.bzl",
    "py_binary",
    "py_library",
    "py_test",
)

load("@py_deps//:requirements.bzl", "requirement")

py_library(
    name = "lib",
    srcs = glob([
        "*.py",
    ]), 
    deps = [
        requirement("termcolor"),
    ],
    # This is important
    # It exposes the correct import path to the consumer of this library
    imports = [
        "."
    ],
)

py_binary(
    name = "binary",
    main = "main.py",
    srcs = ["main.py"],
    deps = [
        ":lib"
    ],
)



