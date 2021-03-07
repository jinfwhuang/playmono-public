load("@io_bazel_rules_docker//go:image.bzl", "go_image")
load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library", "go_test")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")

container_image(
    name = "base",
    base = "@go_image_base//image",
    docker_run_flags = "-i --publish=8080:8080",
)

go_image(
    name = "image",
    base = ":base",
    # List of Go libraries whose sources should be compiled together with this library's sources.
    # Labels listed here must name go_tool_library targets.
    # Embedded libraries must have the same importpath as the embedding library.
    # See Embedding for more information.
    embed = [":helloworld_lib"],
    goarch = "amd64",
    goos = "linux",
    visibility = ["//visibility:public"],
)

go_library(
    name = "helloworld_lib",
    srcs = ["helloworld.go"],
    importpath = "github.com/jinfwhuang/playmono/cmd/helloworld",
    visibility = ["//visibility:private"],
    deps = ["//golang/pkg/utils"],
)

go_binary(
    name = "helloworld",
    embed = [":helloworld_lib"],
    visibility = ["//visibility:public"],
)

go_test(
    name = "helloworld_test",
    srcs = ["helloworld_test.go"],
    embed = [":helloworld_lib"],
)
