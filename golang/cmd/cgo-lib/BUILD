load("@io_bazel_rules_docker//go:image.bzl", "go_image")
load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library", "go_test")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")

package(default_visibility = ["//visibility:public"])

go_binary(
    name = "binary",
    embed = ["//cpp/lib1:go_lib"],
    deps = ["//cpp/lib1:go_lib"],
    srcs = [
        "main.go",
    ],
)


