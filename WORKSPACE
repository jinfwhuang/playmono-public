workspace(
    name = "playmono",
    managed_directories = {
        "@npm": ["nodejs/skylib/node_modules"],
        "@npm_hello_react": ["nodejs/react_webpack/node_modules"],
    },
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

###############################
# repositories without deps
###############################

# http_archive(
#     name = "com_google_protobuf",
#     sha256 = "9748c0d90e54ea09e5e75fb7fac16edce15d2028d4356f32211cfa3c0e956564",
#     strip_prefix = "protobuf-3.11.4",
#     urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.11.4.zip"],
# )


###############################
# rules_docker
###############################

# TODO: The release has some bugs with bazel 4.0.0.
# http_archive(
#     # name = "io_bazel_rules_docker",
#     # sha256 = "1698624e878b0607052ae6131aa216d45ebb63871ec497f26c67455b34119c80",
#     # strip_prefix = "rules_docker-0.15.0",
#     # urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.15.0/rules_docker-v0.15.0.tar.gz"],
# )

# https://github.com/dmayle/rules_docker/releases/tag/v0.15.1-alpha
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "a139e494d955fa133acb48bd7adc1a0b803139c0649f690c60b711700a24ec30",
    strip_prefix = "rules_docker-0.15.1-alpha",
    urls = ["https://github.com/dmayle/rules_docker/releases/download/v0.15.1-alpha/rules_docker-v0.15.1-alpha.tar.gz"],
)

# depending repositories: 

# rules_python: https://github.com/bazelbuild/rules_docker/blob/master/repositories/repositories.bzl
# http_archive(
#     name = "rules_python",
#     url = "https://github.com/bazelbuild/rules_python/releases/download/0.1.0/rules_python-0.1.0.tar.gz",
#     sha256 = "b6d46438523a3ec0f3cead544190ee13223a52f6a6765a29eae7b7cc24cc83a0",
# )

# io_bazel_rules_go: https://github.com/bazelbuild/rules_docker/blob/master/repositories/repositories.bzl
# http_archive(
#     name = "io_bazel_rules_go",
#     sha256 = "08c3cd71857d58af3cda759112437d9e63339ac9c6e0042add43f4d94caf632d",
#     urls = [
#         "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/v0.24.2/rules_go-v0.24.2.tar.gz",
#         "https://github.com/bazelbuild/rules_go/releases/download/v0.24.2/rules_go-v0.24.2.tar.gz",
#     ],
# )

# rules_pkg
# http_archive(
#     name = "rules_pkg",
#     sha256 = "aeca78988341a2ee1ba097641056d168320ecc51372ef7ff8e64b139516a4937",
#     urls = ["https://github.com/bazelbuild/rules_pkg/releases/download/0.2.6-1/rules_pkg-0.2.6.tar.gz"],
# )

# bazel gazelle
# http_archive(
#     name = "bazel_gazelle",
#     sha256 = "cdb02a887a7187ea4d5a27452311a75ed8637379a1287d8eeb952138ea485f7d",
#     urls = ["https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.21.1/bazel-gazelle-v0.21.1.tar.gz"],
# )

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)
container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

container_pull(
  name = "java_base",
  registry = "gcr.io",
  repository = "distroless/java",
  # 'tag' is also supported, but digest is encouraged for reproducibility.
  digest = "sha256:deadbeef",
)


load("@io_bazel_rules_docker//go:go.bzl", _GO_DIGESTS = "DIGESTS")

container_pull(
    name = "distroless_busybox",
    digest = _GO_DIGESTS["debug"],
    registry = "gcr.io",
    repository = "distroless/base",
)

container_pull(
    name = "alpine_git",
    digest = "sha256:94e7d5791a8dcd3a4d45ea6d89b03d1004f8ee02c34c6124f1b6d269e8a312e0",
    registry = "docker.io",
    repository = "alpine/git",
    tag = "1.0.4",
)

container_pull(
    name = "alpine_nodejs",
    registry = "docker.io",
    repository = "node",
    # tag = "14.15.5-alpine3.11", # smallest, doesn't seem to work

    tag = "14.15.5-buster-slim", # paired down from full, still pretty big
    digest = "sha256:33e8f8e0e98f1566a9d899c465a43d61ec9ab3b6d13e4a878f44e0cf42b41688",

    # tag = "14.15.5-buster", # full
    # tag = "14.15.5-stretch", # version 9 variation
)

load("@io_bazel_rules_docker//go:image.bzl", _go_image_repos = "repositories")
_go_image_repos()


###############################
# python
###############################
# You could optionally use an in-build, compiled python interpreter as a toolchain,
# and also use it to execute pip.

# # Special logic for building python interpreter with OpenSSL from homebrew.
# # See https://devguide.python.org/setup/#macos-and-os-x
# _py_configure = """
# if [[ "$OSTYPE" == "darwin"* ]]; then
#    ./configure --prefix=$(pwd)/bazel_install --with-openssl=$(brew --prefix openssl)
# else
#    ./configure --prefix=$(pwd)/bazel_install
# fi
# """

# # NOTE: you need to have the SSL headers installed to build with openssl support (and use HTTPS).
# # E.g. on Ubuntu: `sudo apt install libssl-dev`
# http_archive(
#    name = "python_interpreter",
#    build_file_content = """
# exports_files(["python_bin"])
# filegroup(
#    name = "files",
#    srcs = glob(["bazel_install/**"], exclude = ["**/* *"]),
#    visibility = ["//visibility:public"],
# )
# """,
#    patch_cmds = [
#        "mkdir $(pwd)/bazel_install",
#        _py_configure,
#        "make",
#        "make install",
#        "ln -s bazel_install/bin/python3 python_bin",
#    ],
#    sha256 = "dfab5ec723c218082fe3d5d7ae17ecbdebffa9a1aea4d64aa3a2ecdd2e795864",
#    strip_prefix = "Python-3.8.3",
#    urls = ["https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tar.xz"],
# )

# # Optional:
# # Register the toolchain with the same python interpreter we used for pip in pip_install().
# # register_toolchains("//:my_py_toolchain")
# register_toolchains("//python/skylib:my_py_toolchain")


load("//python/skylib:repositories.bzl", python_repositories = "repositories")
python_repositories()

# # python2
# load("@io_bazel_rules_docker//python:image.bzl", _py_image_repos = "repositories")
# _py_image_repos()

load("@io_bazel_rules_docker//python3:image.bzl", _py3_image_repos = "repositories")
_py3_image_repos()




# Python image version must match the python interpreter version in
# @python_interpreter http_archive in order for dependencies imported by
# pip_import to have the right version.
container_pull(
    name = "python3.8.3_slim_buster",
    registry = "docker.io",
    repository = "library/python",
    digest = "sha256:bad43dc620ed7f3bc085782b63c6cc0f307819af41b0ebfecb8457c82abc7f99",  # 3.8.3-slim-buster
)

###############################
# Golang
###############################
# Deps: https://github.com/bazelbuild/rules_go/blob/master/WORKSPACE

# @com_google_protobuf
# http_archive(
#     name = "com_google_protobuf",
#     sha256 = "a79d19dcdf9139fa4b81206e318e33d245c4c9da1ffed21c87288ed4380426f9",
#     strip_prefix = "protobuf-3.11.4",
#     # latest, as of 2020-02-21
#     urls = [
#         "https://mirror.bazel.build/github.com/protocolbuffers/protobuf/archive/v3.11.4.tar.gz",
#         "https://github.com/protocolbuffers/protobuf/archive/v3.11.4.tar.gz",
#     ],
# )

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
go_rules_dependencies()
go_register_toolchains()

# For rules_go v0.25.0
# go_register_toolchains(version = "1.15.5")

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
gazelle_dependencies()

load("//:golang/skydeps/go_repositories.bzl", "go_repositories")
go_repositories()


################################ 
# build_bazel_rules_nodejs
################################ 
http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "fcc6dccb39ca88d481224536eb8f9fa754619676c6163f87aa6af94059b02b12",
    urls = [
        "https://github.com/bazelbuild/rules_nodejs/releases/download/3.2.0/rules_nodejs-3.2.0.tar.gz"
    ],
)

# load("//:nodejs/skydep/repositories.bzl", nodejs_repositories = "repositories")
load("//nodejs/skylib:repositories.bzl", nodejs_repositories = "repositories")
nodejs_repositories()

load(
    "@io_bazel_rules_docker//nodejs:image.bzl",
    _nodejs_image_repos = "repositories",
)
_nodejs_image_repos()


###############################
# Java
###############################
load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_import_external")

RULES_JVM_EXTERNAL_TAG = "4.0"
RULES_JVM_EXTERNAL_SHA = "31701ad93dbfe544d597dbe62c9a1fdd76d81d8a9150c2bf1ecf928ecdf97169"

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    sha256 = RULES_JVM_EXTERNAL_SHA,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("//jvm/skylib:repositories.bzl", mvn_repositories = "mvn_repositories")
mvn_repositories()

load("@maven//:defs.bzl", "pinned_maven_install")
pinned_maven_install()

load(
    "@io_bazel_rules_docker//java:image.bzl",
    _java_image_repos = "repositories",
)
_java_image_repos()



###############################
# rules_gitops
###############################
# dependencies: https://github.com/adobe/rules_gitops/blob/master/gitops/deps.bzl
# - io_bazel_rules_go
# - bazel_gazelle
# - com_google_protobuf
# - bazel_skylib
rules_gitops_version = "b5facc8c55a0c50873b4e00a08c6066166bf2c62"
http_archive(
    name = "com_adobe_rules_gitops",
    sha256 = "5b133e9a6a5de4e6a2d117b9b22412ed8d92569d35b623d6cd8119379f84cbdc",
    strip_prefix = "rules_gitops-%s" % rules_gitops_version,
    urls = [
        # This is the main fork, hosted in github
        "https://github.com/adobe/rules_gitops/archive/%s.zip" % rules_gitops_version,
    ],
)

load("@com_adobe_rules_gitops//gitops:deps.bzl", "rules_gitops_dependencies")
rules_gitops_dependencies()

load("@com_adobe_rules_gitops//gitops:repositories.bzl", "rules_gitops_repositories")
rules_gitops_repositories()



################################ 
# pybind
################################ 
http_archive(
  name = "pybind11_bazel",
  strip_prefix = "pybind11_bazel-34206c29f891dbd5f6f5face7b91664c2ff7185c",
  urls = ["https://github.com/pybind/pybind11_bazel/archive/34206c29f891dbd5f6f5face7b91664c2ff7185c.zip"],
  sha256 = "8d0b776ea5b67891f8585989d54aa34869fc12f14bf33f1dc7459458dd222e95",
)

http_archive(
  name = "pybind11",
  build_file = "@pybind11_bazel//:pybind11.BUILD",
  strip_prefix = "pybind11-a54eab92d265337996b8e4b4149d9176c2d428a6",
  urls = ["https://github.com/pybind/pybind11/archive/a54eab92d265337996b8e4b4149d9176c2d428a6.tar.gz"],
  sha256 = "c9375b7453bef1ba0106849c83881e6b6882d892c9fae5b2572a2192100ffb8a",
)

load("@pybind11_bazel//:python_configure.bzl", "python_configure")
python_configure(name = "local_config_python")
# TODO: This needs to be able to take a python tool chain to be useful


