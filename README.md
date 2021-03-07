
## Playgound Monorepo Template
See my [blog post](https://jinsnotes.com/2020-12-29-playground-monorepo) for more information on how I use my playground monorepo. This is a template and examples.

I use a playground monorepo for all of my personal projects. The reason to use a monorepo for my personal project is similar in many ways to why a software company would want migrate to a single repo. I use different languages depending on the hobby and question I am tackling. I do not want to spend time opening and closing all the editor windows. I want to share codes among different projects. I want to centralize my documentations. I want to have a familiar editor homepage for all my codes and writings. A playground monorepo has been a huge success for my personal productivity for many years.

Here is a template that I extracted out from my playground monorepo.

## Features
- Support multiple languages: c++, go, java, python, javascript
- Cross compilation between languages
- Building libraries, binaries, and docker images all in Bazel
- Centralized documentations and research notes


## Examples

Bazel has varying degree of support different languages. One of the best example is go. It allows us to maintain almost all of the features of the native go build tool in the form of the `go` cli. However, not all languages have a native build tool. In the example of Java, building with Bazel is far better than the other tools, such as Maven or Ant.

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

See [python examples](jvm/README.md). All python third party dependencies are listed in a [requirements.txt](python/skylib/requirements.txt) file.


### javascript and typescript
The biggest challenge of using Bazel to build javascript projects is doing so would break the npm/yarn tooling. This is serious shortcoming compared to how Bazel and go tooling work interchangebly. In python and Java, however, Bazel tooling by itsel feels sufficient. But in javascript, all the debugging and IDE support only work well if the package.json file and node_modules folder structure are in place.

The obvious solution is to add npm/yarn workspace support to rules_nodejs. See an open [issue](https://github.com/bazelbuild/rules_nodejs/issues/266).

See [nodejs examples](nodjes/README.md). In theory, all third party dependencies could be put in a single [package.json](nodejs/skylib/package.json) file. In practice, if I want to maintain the ability to continue using npm/yarn tooling, I would create a separate package.json for a particular package; see the project [hello-dep](nodejs/cmd/hello-dep).


## Docker Images and Deloyment Manifests
Bazel [rules_docker](https://github.com/bazelbuild/rules_docker) makes the transition from building binaries to images rather seamless. When a binary is already built by Bazel, creating an equivalent [distroless](https://github.com/GoogleContainerTools/distroless) image is too easy. Furthermore [rule_gitops](https://github.com/adobe/rules_gitops) is used to connect docker images and deployment files. See an [example](deployment/helloworld/README.md) of deployment.

While this feature is not used very often in my personal playground, I do use it to deploy personal projects. I keep a tiny k8s cluster up running in AWS, costing me about $30-$50 a month. I previously had some long running services that I ran in EC2, converting them into k8s deployment covered my operating costs. Now that is setup, instead of having to deal with terraform to deploy some toy projects, I deploy to my personal k8s cluster by one bazel command. It is a ton of fun to write and deploy without having to think about infra.

<a name="k8s_deploy"></a>
## Fun Next Steps:
- Create an example where a browser app uses the c code in `cpp/lib1/lib.cpp` through wasm.
- Create an example where java also uses the c code in `cpp/lib1/lib.cpp`.
- Create a sample structure of how I keep track of my local MacOs setup for multiple computers. See [infra/setup_dawin/README.md](infra/setup_darwin/README.md)
- Set up some examples of how I use cloud infra. See [infra dir](infra/project1/terraform)
