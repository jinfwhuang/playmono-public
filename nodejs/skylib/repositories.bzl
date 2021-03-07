load("@build_bazel_rules_nodejs//:index.bzl", "yarn_install")

def repositories():
    yarn_install(
        name = "npm_skylib",
        package_json = "//nodejs/skylib:package.json",
        yarn_lock = "//nodejs/skylib:yarn.lock",
        package_path = "",

        # symlink_node_modules = False,
        # package_path = "nodejs/skylib",
    )

    yarn_install(
        name = "npm_hello_lib",
        package_json = "//nodejs/pkg/hello-lib:package.json",
        yarn_lock = "//nodejs/pkg/hello-lib:yarn.lock",
        package_path = "nodejs/pkg/hello-lib",

        symlink_node_modules = False,
    )

    yarn_install(
        name = "npm_hello_dep",
        package_json = "//nodejs/cmd/hello-dep:package.json",
        yarn_lock = "//nodejs/cmd/hello-dep:yarn.lock",
        package_path = "nodejs/cmd/hello-dep",
        symlink_node_modules = False,
    )
