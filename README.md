


- Multiple languages supports
- Multiple platforms
- Cross compilation between languages
- Building libraries, binaries, and docker images
- All in Bazel


## Language support

Bazel has varying degree of support different languages. One of the best example is go. It allows us to maintain almost all of the features of the native go build tool in the form of the `go` cli. However, not all languages have a native build tool. In the example of Java, building with Bazel is far better than the other tools.

It is not always easy. But for each language setup in this repo, I attempt to setup such that each language
- Has a single place to define third party libaries. All external dependencies have a single version in the monorepo.
- Be able to define and reuse first party libraries easily.
- A transparent path to build library, binary, and docker images purely on Bazel.


#### c++
Bazel offers great support building c++ codes. I only provide some examples about how to use c codes in other languages. See [cpp readme](cpp/lib1/README.md).

It is weirdly satisfying to be able to reuse codes across multiple languages. In a project where multiple language is required, the ability to do so eliminates the need for duplicate code, e.g. ser/deser libraries, processing logic, API adapters. 




## Bonus features
- Use [rule_gitops](https://github.com/adobe/rules_gitops) to connect docker images and deployment files. See an [example](deployment/helloworld/README.md) of deployment.



## Fun next steps to add:
- Make an example where a browser app uses the c code in `cpp/lib1/lib.cpp` through wasm.
- Make an example where java also uses the c code in `cpp/lib1/lib.cpp`.
- Set up some examples of how I use cloud infra. 





