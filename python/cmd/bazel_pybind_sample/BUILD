load("@pybind11_bazel//:build_defs.bzl", "pybind_extension")
load("@rules_python//python:defs.bzl", "py_binary")
# load("@io_bazel_rules_docker//python:image.bzl", "py_image", "py3_image")
load("@io_bazel_rules_docker//python3:image.bzl", "py3_image")
load("@py_deps//:requirements.bzl", "requirement")


# pybind_extension(
#     name = "cpp_lib1",  # This name is not actually created!
#     srcs = ["my_pb_mod.cc"],
# )

# py_library(
#     name = "cpp_lib1",
#     data = [":cpp_lib1.so"],
#     imports = ["."],
# )

# pybind_module

py_binary(
    name = "main2",
    visibility = ["//visibility:public"],
    main = "main2.py",
    srcs = ["main2.py"],
    deps = [
        "//python/bazel/cmd/bazel_pybind_sample/cpp_lib1:pybind_module1",
        requirement("requests"),
        # "//python/bazel/pkg/hellolib:lib",
    ],
)

# TODO: This is built correctly only if we use local python
pybind_extension(
    name = "my_pb_mod",  # This name is not actually created!
    srcs = ["my_pb_mod.cc"],
)

py_library(
    name = "my_pb_mod",
    data = [":my_pb_mod.so"],
    imports = ["."],
)

py_test(
    name = "example_test",
    srcs = ["example_test.py"],
    deps = [
        ":my_pb_mod"
    ],
)

py_binary(
    name = "binary",
    visibility = ["//visibility:public"],
    main = "main.py",
    srcs = ["main.py"],
    deps = [
        "//python/bazel/cmd/bazel_pybind_sample/cpp_lib1:pybind_module1",
        ":my_pb_mod",
        requirement("requests"),
        # "//python/bazel/pkg/hellolib:lib",
    ],
)
