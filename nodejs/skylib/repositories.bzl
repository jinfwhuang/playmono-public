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
        name = "a_deps",
        package_json = "//nodejs/a:package.json",
        yarn_lock = "//nodejs/a:yarn.lock",
        package_path = "nodejs/a",

        # False + managed -> Same behavior as False + no managed
        # True + Managed -> The behavior is as if  bazel run "yarn install" in the src directory
        # True + no managed -> yarn install must be run manually; bazel will fail otherwise
        # False + no managed -> bazel will install the node_modules in a tmp folder and linked to the src folder
        symlink_node_modules = False,

        # The main reason to choose "False + no managed" is that we don't have to modify WORKSPACE file 
        # frequenty when we are modifying npm projects. Otherwise, "True + Managed" has a slightly
        # more predictable behavior.
    )

    yarn_install(
        name = "b_deps",
        package_json = "//nodejs/b:package.json",
        yarn_lock = "//nodejs/b:yarn.lock",
        package_path = "nodejs/b",
        symlink_node_modules = False,
    )

    yarn_install(
        name = "npm_hello_lib",
        package_json = "//nodejs/hello-lib:package.json",
        yarn_lock = "//nodejs/hello-lib:yarn.lock",
        package_path = "nodejs/hello-lib",

        symlink_node_modules = False,
    )

    yarn_install(
        name = "npm_hello_dep",
        package_json = "//nodejs/hello-dep:package.json",
        yarn_lock = "//nodejs/hello-dep:yarn.lock",
        package_path = "nodejs/hello-dep",
        symlink_node_modules = False,
    )


