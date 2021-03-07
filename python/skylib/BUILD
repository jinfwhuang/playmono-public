load("@rules_python//python:defs.bzl", "py_runtime_pair")
load("@io_bazel_rules_docker//container:image.bzl", "container_image")
load("@io_bazel_rules_docker//docker/util:run.bzl", "container_run_and_commit")

py_runtime(
    name = "python3_runtime",
    files = ["@python_interpreter//:files"],
    interpreter = "@python_interpreter//:python_bin",
    python_version = "PY3",
    visibility = ["//visibility:public"],
)

py_runtime_pair(
    name = "my_py_runtime_pair",
    py2_runtime = None,
    py3_runtime = ":python3_runtime",
)

toolchain(
    name = "my_py_toolchain",
    toolchain = ":my_py_runtime_pair",
    toolchain_type = "@bazel_tools//tools/python:toolchain_type",
)

container_image(
    name = "python3.8.3_base_image",
    base = "@python3.8.3_slim_buster//image",

    # slim-buster image places python3 under /usr/local/bin, but the host
    # toolchain used by py3_image might use /usr/bin instead.
    symlinks = {
        "/usr/bin/python": "/usr/local/bin/python",
        "/usr/bin/python3": "/usr/local/bin/python3",
    },
    stamp = True,
    creation_time = "{BUILD_TIMESTAMP}",
)

# # Use pip to install the dependencies inside the container.
# container_run_and_commit(
#     name = "python3.8.3_base_image_with_deps",
#     image = "python3.8.3_base_image.tar",
#     commands = [
#         "pip3 install --default-timeout=180 -r /etc/requirements.txt",
#     ],
# )