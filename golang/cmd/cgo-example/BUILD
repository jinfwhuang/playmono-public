load("@io_bazel_rules_docker//go:image.bzl", "go_image")
load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library", "go_test")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")

package(default_visibility = ["//visibility:public"])

go_library(
    name = "lib",
    srcs = glob([
        "*.go",
        "lib_cgo.h",
        # "lib.h",
        "*.cpp",
    ]),
    importpath = "github.com/jinfwhuang/playmono/cmd/cgoexample",
    cgo = True,
    # gc_goopts = [
    #     "-DCGO=1",
    # ]
    cppopts = [
        "-DCGO=1",
    ]
)

go_binary(
    name = "binary",
    embed = [":lib"],
    visibility = ["//visibility:public"],
)


# cgo_library(
#     name = "cgo",
#     srcs = glob([
#         "*.go",
#         "lib_cgo.h",
#         # "lib.h",
#         "*.cpp",
#     ]),

#     # srcs = ["cgo-enabled.go", "foo.cc", "bar.S", "baz.a"],
# )