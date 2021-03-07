load("@rules_python//python:defs.bzl", "py_binary")
load("@io_bazel_rules_docker//python3:image.bzl", "py3_image")
load("@py_deps//:requirements.bzl", "requirement")


py_binary(
    name = "binary",
    visibility = ["//visibility:public"],
    main = "main.py",
    srcs = ["main.py"],
    deps = [
        "//cpp/lib1:pybind_module1",
    ],
)
