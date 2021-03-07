load("@rules_jvm_external//:defs.bzl", "maven_install")

# Update:
# bazel run @unpinned_maven//:pin
def mvn_repositories():

    maven_install(
        name = "maven",
        fetch_sources = True,
        resolve_timeout = 1800,
        strict_visibility = True,
        use_unsafe_shared_cache = False,
        version_conflict_policy = "pinned",
        repositories = [
            "https://maven.google.com",
            "https://repo1.maven.org/maven2",
            # # Private repositories are supported through HTTP Basic auth
            # "http://username:password@localhost:8081/artifactory/my-repository",
        ],

        maven_install_json = "//jvm/skylib:maven_install.json",

        artifacts = [
            "com.beust:jcommander:1.72",
            "junit:junit:4.12",
            "org.hamcrest:hamcrest-library:1.3",
            "commons-io:commons-io:2.6",
            "org.apache.commons:commons-lang3:3.5",
            "org.apache.commons:commons-math3:3.6",
            "org.apache.commons:commons-math:2.1",
            "ch.qos.logback:logback-classic:1.2.3",
            "ch.qos.logback:logback-core:1.2.3",
            "org.slf4j:slf4j-api:1.7.30",
            "org.slf4j:slf4j-ext:1.7.30",
            "org.slf4j:slf4j-simple:1.7.30",
            "com.fasterxml.jackson.core:jackson-annotations:2.12.2",
            "com.fasterxml.jackson.core:jackson-core:2.12.2",
            "com.fasterxml.jackson.core:jackson-databind:2.12.2",
            "com.fasterxml.jackson.dataformat:jackson-dataformat-xml:2.12.2",
            "com.fasterxml.jackson.dataformat:jackson-dataformat-yaml:2.12.2",
        ],
        excluded_artifacts = [],
    )
