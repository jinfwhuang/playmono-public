load("@rules_java//java:defs.bzl", "java_library")

package(default_visibility = ["//visibility:public"])

# Use this lib only for dev purpose
# For deployed libs, use jvm arg: -Dlogback.configurationFile
java_library(
    name = "logback_xml_dev",
    # Enable logback files to be accessible through
    # classpath and jar file jar (file:/xxx.jar!/logback.xml)
    resource_strip_prefix = "jvm/java/github/com/jinfwhuang/common/unsorted",
    resources = ["logback.xml"],
    visibility = ["//visibility:public"],
)

java_library(
    name = "lib",
    srcs = glob([
        "*.java",
    ]),
    resource_strip_prefix = "jvm/java/github/com/jinfwhuang/common/unsorted",
    resources = ["logback.xml"],
    visibility = ["//visibility:public"],
    deps = [
        "@maven//:commons_io_commons_io",
        "@maven//:org_apache_commons_commons_lang3",

        "@maven//:com_beust_jcommander",
        "@maven//:ch_qos_logback_logback_classic",
        "@maven//:ch_qos_logback_logback_core",
        "@maven//:org_slf4j_slf4j_simple",
        "@maven//:org_slf4j_slf4j_api",
        "@maven//:com_fasterxml_jackson_core_jackson_annotations",

        "//jvm/java/github/com/jinfwhuang/common/json:lib",

    ],
)


java_library(
    name = "lib_app_config",
    srcs = glob([
        "AppConfig.java",
    ]),
    deps = [
        "//jvm/java/github/com/jinfwhuang/common/json:lib",
#        "@maven//:ch_qos_logback_logback_classic",
        "@maven//:ch_qos_logback_logback_core",
        "@maven//:com_beust_jcommander",
        # "@maven//:net_logstash_logback_logstash_logback_encoder",
        # "@maven//:org_slf4j_jcl_over_slf4j",
        # "@maven//:org_slf4j_jul_to_slf4j",
        # "@maven//:org_slf4j_log4j_over_slf4j",
        "@maven//:org_slf4j_slf4j_api",
        "@maven//:com_fasterxml_jackson_core_jackson_annotations",

    ],
)

