

## Features
- Support multiple languages
- Support building for multiple platforms
- Cross compilation between languages
- Building libraries, binaries, and docker images
- All in Bazel


## Examples

Bazel has varying degree of support different languages. One of the best example is go. It allows us to maintain almost all of the features of the native go build tool in the form of the `go` cli. However, not all languages have a native build tool. In the example of Java, building with Bazel is far better than the other tools.

For each language setup in this repo, I attempt to setup such that each language
- Has a single place to define third party libaries. All external dependencies have a single version in the monorepo.
- Be able to define and reuse first party libraries easily.
- A transparent path to build library, binary, and docker images purely on Bazel.


### c++
Bazel offers great support building c++ codes. I only provide some examples about how to use c codes in other languages. See [cpp readme](cpp/lib1/README.md).

It is weirdly satisfying to be able to reuse codes across multiple languages. In a project where multiple language is required, the ability to do so eliminates the need for duplicate code, e.g. ser/deser libraries, processing logic, API adapters. 


### go
The best part of using go in Bazel is that go tooling remains more or less intact. The `golang` directory setup is the same as any other go project. The advantages of using Bazel instead of go build tool are still many: incremental builds, exact control of what goes into libraries, and docker images building.

See [golang readme](golang/README.md).

### java
Bazel offers excellent support for Java. The [maven rule](https://github.com/bazelbuild/rules_jvm_external) has made using Maven dependencies really easy. For any large java project, Bazel offers a far better experience than Maven. Even as my personal playground, setting up Bazel in Java has avoid a lot of versioning and library dependencies issues. All of my java codes have been converted to Bazel builds. Even codes that are more than 10 years work well with new Java codes I am writing. It has been a joy to finally standardize and revive all of codes that are placed in their own isolated corners.

See [java examples](jvm/README.md). All java third party dependencies are listed in a [single location](jvm/skylib/repositories.bzl).


### python
Instead of using virtual envs, Bazel allows us to defind and build python interpreter as part of its toolchain.

See [python examples](jvm/README.md). All python third party dependencies are listed in a [single location](python/skylib/requirements.txt).


### nodejs
TODO


## Docker Images and Deloyment Manifests
Bazel [rules_docker](https://github.com/bazelbuild/rules_docker) makes the transition from building binaries to images rather seamless. When a binary is already built by Bazel, creating an equivalent [distroless](https://github.com/GoogleContainerTools/distroless) image is too easy. Furthermore [rule_gitops](https://github.com/adobe/rules_gitops) is used to connect docker images and deployment files. See an [example](deployment/helloworld/README.md) of deployment.

While this feature is not used very often in my personal playground, I do use it to deploy personal projects. I keep a tiny k8s cluster up running in AWS, costing me about $30-$50 a month. I previously had some long running services that I ran in EC2, converting them into k8s deployment covered my operating costs. Now that is setup, instead of having to deal with terraform to deploy some toy projects, I deploy to my personal k8s cluster by one bazel command. It is a ton of fun to write and deploy without having to think about infra.


## Fun Next Steps:
- Create an example where a browser app uses the c code in `cpp/lib1/lib.cpp` through wasm.
- Create an example where java also uses the c code in `cpp/lib1/lib.cpp`.
- Create a sample structure of how I keep track of my local MacOs setup for multiple computers. See [infra/setup_dawin/README.md](infra/setup_darwin/README.md)
- Set up some examples of how I use cloud infra. See [infra dir](infra/project1/terraform)
