load("@build_bazel_rules_nodejs//:index.bzl", "js_library")

js_library(
    name = "lib",
    visibility = ["//visibility:public"],
    package_name = "@playmono/hello-lib",
    srcs = [
        "package.json",
        "index.js",
    ],
    deps = [
        "@npm_hello_lib//smallest",
    ],
)
