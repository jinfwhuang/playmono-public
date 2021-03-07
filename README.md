


- Multiple languages supports
- Multiple platforms
- Cross compilation between languages
- Building libraries, binaries, and docker images
- All in Bazel


## Examples

Bazel has varying degree of support different languages. One of the best example is go. It allows us to maintain almost all of the features of the native go build tool in the form of the `go` cli. However, not all languages have a native build tool. In the example of Java, building with Bazel is far better than the other tools.

For each language setup in this repo, I attempt to setup such that each language
- Has a single place to define third party libaries. All external dependencies have a single version in the monorepo.
- Be able to define and reuse first party libraries easily.
- A transparent path to build library, binary, and docker images purely on Bazel.


#### c++
Bazel offers great support building c++ codes. I only provide some examples about how to use c codes in other languages. See [cpp readme](cpp/lib1/README.md).

It is weirdly satisfying to be able to reuse codes across multiple languages. In a project where multiple language is required, the ability to do so eliminates the need for duplicate code, e.g. ser/deser libraries, processing logic, API adapters. 


#### go
The best part of using go in Bazel is that go tooling remains more or less intact. The `golang` directory setup is the same as any other go project. The advantages of using Bazel instead of go build tool are still many: incremental builds, exact control of what goes into libraries, and docker images building.

See [golang readme](golang/README.md).


#### java
The best part of using go in Bazel is that go tooling remains more or less intact. The `golang` directory setup is the same as any other go project. The advantages of using Bazel instead of go build tool are still many: incremental builds, exact control of what goes into libraries, and docker images building.

See [golang readme](golang/README.md).


#### python
TODO


#### nodejs
TODO

## Bonus features
- [rule_gitops](https://github.com/adobe/rules_gitops) is used to connect docker images and deployment files. See an [example](deployment/helloworld/README.md) of deployment.


## Fun next steps to add:
- Make an example where a browser app uses the c code in `cpp/lib1/lib.cpp` through wasm.
- Make an example where java also uses the c code in `cpp/lib1/lib.cpp`.
- Creat a sample structure of how I keep track of my local MacOs setup for multiple computers. See [infra/setup_dawin/README.md](infra/setup_darwin/README.md)
- Set up some examples of how I use cloud infra. See [infra dir](infra)





