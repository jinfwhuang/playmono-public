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

#<!-- https://mvnrepository.com/artifact/commons-io/commons-io -->
#<dependency>
#    <groupId>commons-io</groupId>
#    <artifactId>commons-io</artifactId>
#    <version>2.6</version>
#</dependency>

            "commons-io:commons-io:2.6",
#            "org.apache.commons:commons-collections4:4.1",
#            "org.apache.commons:commons-compress:1.18",
#            "org.apache.commons:commons-crypto:1.0.0",
#            "org.apache.commons:commons-csv:1.4",
#            "org.apache.commons:commons-dbcp2:2.0.1",
#            "org.apache.commons:commons-exec:1.3",
            "org.apache.commons:commons-lang3:3.5",
            "org.apache.commons:commons-math3:3.6",
            "org.apache.commons:commons-math:2.1",
#            "org.apache.commons:commons-pool2:2.2",
#            "org.apache.commons:commons-text:1.9",

#            "ch.qos.logback:logback-access:1.2.3",
            "ch.qos.logback:logback-classic:1.2.3",
            "ch.qos.logback:logback-core:1.2.3",

            # "org.slf4j:jcl-over-slf4j:1.7.30",
            # "org.slf4j:jul-to-slf4j:1.7.30",
            # "org.slf4j:log4j-over-slf4j:1.7.30",
            "org.slf4j:slf4j-api:1.7.30",
            "org.slf4j:slf4j-ext:1.7.30",
            "org.slf4j:slf4j-simple:1.7.30",

            "com.fasterxml.jackson.core:jackson-annotations:2.12.2",
            "com.fasterxml.jackson.core:jackson-core:2.12.2",
            "com.fasterxml.jackson.core:jackson-databind:2.12.2",
            "com.fasterxml.jackson.dataformat:jackson-dataformat-xml:2.12.2",
            "com.fasterxml.jackson.dataformat:jackson-dataformat-yaml:2.12.2",

#             <!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-annotations -->
# <dependency>
#     <groupId>com.fasterxml.jackson.core</groupId>
#     <artifactId>jackson-annotations</artifactId>
#     <version>2.12.2</version>
# </dependency>


            # "com.fasterxml.jackson.dataformat:jackson-dataformat-cbor:2.9.1",
            # "com.fasterxml.jackson.dataformat:jackson-dataformat-smile:2.9.1",
            # "com.fasterxml.jackson.dataformat:jackson-dataformat-xml:2.9.1",
            # "com.fasterxml.jackson.dataformat:jackson-dataformat-yaml:2.9.1",
            # "com.fasterxml.jackson.datatype:jackson-datatype-guava:2.9.1",
            # "com.fasterxml.jackson.datatype:jackson-datatype-jdk8:2.9.1",
            # "com.fasterxml.jackson.datatype:jackson-datatype-joda:2.9.1",
            # "com.fasterxml.jackson.datatype:jackson-datatype-jsr310:2.9.1",
            # "com.fasterxml.jackson.jaxrs:jackson-jaxrs-base:2.9.1",
            # "com.fasterxml.jackson.jaxrs:jackson-jaxrs-json-provider:2.9.1",
            # "com.fasterxml.jackson.jaxrs:jackson-jaxrs-smile-provider:2.6.7",
            # "com.fasterxml.jackson.module:jackson-module-afterburner:2.9.1",
            # "com.fasterxml.jackson.module:jackson-module-guice:2.6.7",
            # "com.fasterxml.jackson.module:jackson-module-jaxb-annotations:2.9.1",
            # "com.fasterxml.jackson.module:jackson-module-parameter-names:2.9.5",
            # "com.fasterxml.jackson.module:jackson-module-paranamer:2.9.1",
            # "com.fasterxml.jackson.module:jackson-module-scala_2.11:2.9.1",


        ],
        excluded_artifacts = [],


    )


