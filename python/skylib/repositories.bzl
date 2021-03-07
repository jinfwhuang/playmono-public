load("@rules_python//python:pip.bzl", "pip_install")

def repositories():
    pip_install(
        name = "py_deps",
        requirements = "//python/skylib:requirements.txt",
        # python_interpreter_target = "@python_interpreter//:python_bin",
    )
