load("@build_bazel_rules_nodejs//:index.bzl", "nodejs_binary", "pkg_web")
load("@io_bazel_rules_docker//nodejs:image.bzl", "nodejs_image")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")

package(default_visibility = ["//visibility:public"])


nodejs_binary(
    name = "binary",
    entry_point = "app.js",
)

container_image(
    name = "base",
    base = "@nodejs_image_base//image",
    docker_run_flags = "-i --rm --publish=8080:8080",
)

nodejs_image(
    name = "image",
    binary = ":binary",
    base = ":base",
)


