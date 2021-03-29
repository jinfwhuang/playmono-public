## A shared cpp lib: lib.cpp
The code in `lib.cpp` is compiled to cpp, go, and python


#### cpp
```
bazel run //cpp/lib1:cpp_binary
```

#### go
```
bazel run //cpp/lib1:go_binary
```

#### python
```
bazel run //cpp/lib1:py_binary
```

#### WASM
```
bazel run --config=wasm //cpp/lib1:embind_binary

bazel run //cpp/lib1:embind_wasm
```