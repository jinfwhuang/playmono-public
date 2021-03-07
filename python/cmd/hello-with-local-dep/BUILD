load("@rules_python//python:defs.bzl", "py_binary")
# load("@io_bazel_rules_docker//python:image.bzl", "py_image", "py3_image")
load("@io_bazel_rules_docker//python3:image.bzl", "py3_image")
load("@py_deps//:requirements.bzl", "requirement")

py_binary(
    name = "binary",
    visibility = ["//visibility:public"],
    main = "main.py",
    srcs = ["main.py"],
    deps = [
        requirement("requests"),
        "//python/bazel/pkg/hellolib:lib",
    ],
    # imports = [
    #     "python/bazel/pkg/hellolib",
    # ]
    # python_version = "PY3",
)



# py3_image(
#     name = "image",
#     main = "withdep.py",
#     srcs = ["withdep.py"],
#     deps = [
#         requirement("requests"),
#     ],

#     base = "//python/skylib:python3.8.3_base_image",
# )


