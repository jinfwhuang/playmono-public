load("@rules_python//python:defs.bzl", "py_binary")
load("@io_bazel_rules_docker//python3:image.bzl", "py3_image")
load("@py_deps//:requirements.bzl", "requirement")

py_binary(
    name = "binary",
    main = "main.py",
    srcs = ["main.py"],
)

py_binary(
    name = "withdep",
    main = "withdep.py",
    srcs = ["withdep.py"],
    deps = [
        # ":myotherlib",
        requirement("requests"),
    ],
    python_version = "PY3",
)

py3_image(
    name = "image",
    main = "withdep.py",
    srcs = ["withdep.py"],
    deps = [
        requirement("requests"),
    ],
)
