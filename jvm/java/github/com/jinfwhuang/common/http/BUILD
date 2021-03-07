load("@rules_java//java:defs.bzl", "java_library")

package(default_visibility = ["//visibility:public"])

java_library(
    name = "lib",
    srcs = glob([
        "*.java",
    ]),
    deps = [
        "@maven//:ch_qos_logback_logback_classic",
        "@maven//:ch_qos_logback_logback_core",
        "@maven//:org_glassfish_jersey_core_jersey_client",
        "@maven//:org_glassfish_jersey_core_jersey_common",
        "@maven//:org_slf4j_slf4j_api",
    ],
)
