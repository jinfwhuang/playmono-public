load("@build_bazel_rules_nodejs//:index.bzl", "nodejs_binary")
load("@io_bazel_rules_docker//nodejs:image.bzl", "nodejs_image")

nodejs_binary(
    name = "binary",
    data = [
        "@npm_hello_dep//color",
        "@npm_hello_dep//colors",
        "@npm_hello_dep//chalk",
        "//nodejs/pkg/hello-lib:lib",
    ],
    entry_point = ":main.js",
)

nodejs_image(
    name = "image",
    binary = ":binary",
)
