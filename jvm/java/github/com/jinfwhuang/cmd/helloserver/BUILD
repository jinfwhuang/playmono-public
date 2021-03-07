load("@rules_java//java:defs.bzl", "java_binary", "java_library")
load("@io_bazel_rules_docker//java:image.bzl", "java_image")

package(default_visibility = ["//visibility:public"])

java_library(
    name = "lib",
    srcs = glob(["*.java"]),
    deps = [
        "//jvm/java/github/com/jinfwhuang/common/unsorted:lib",
    ],
)

java_binary(
    name = "binary",
    main_class = "github.com.jinfwhuang.cmd.helloserver.HelloServer",
    runtime_deps = [
        ":lib",
    ],
)

java_image(
    name = "image",
    main_class = "github.com.jinfwhuang.cmd.helloserver.HelloServer",
    jvm_flags = [
        "-XX:+UseG1GC",
    ],
    runtime_deps = [
        ":lib",
    ],
)
