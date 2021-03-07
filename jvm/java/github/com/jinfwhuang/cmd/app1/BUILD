load("@rules_java//java:defs.bzl", "java_binary", "java_library")

package(default_visibility = ["//visibility:public"])

java_binary(
    name = "app1",
    srcs = glob([
        "*.java",
    ]),
    main_class = "github.com.jinfwhuang.cmd.App1",
    deps = [
        "@maven//:com_beust_jcommander",
        "@maven//:org_slf4j_slf4j_api",
        "@maven//:com_fasterxml_jackson_core_jackson_annotations",
        "//jvm/java/github/com/jinfwhuang/common/unsorted:lib",
    ],
)
