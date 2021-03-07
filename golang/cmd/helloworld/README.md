
https://github.com/bazelbuild/rules_go/blob/master/go/core.rst#go_binary


#### Golang tooling
```
# From //golang
go run cmd/helloworld/helloworld.go
```

#### Bazel tooling
```
# query
bazel query //golang/...

# run
bazel run //golang/cmd/helloworld:helloworld

# run inside docker
bazel run //golang/cmd/helloworld:image

# test
bazel test //golang/helloworld:helloworld_test
bazel test //golang/...
```



