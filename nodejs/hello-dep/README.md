


```bash
bazel run //nodejs/hello-dep:binary

bazel run --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64  //nodejs/hello-dep:image
```
