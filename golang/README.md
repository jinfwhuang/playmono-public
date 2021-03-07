#### bazel commands
```
# Run a web server
bazel run //golang/cmd/helloworld:helloworld

# Run a web server inside docker
bazel run //golang/cmd/helloworld:image

# Run a program that uses c++ code
bazel run //golang/cmd/cgo-lib:binary
```


#### go tooling
```
go run cmd/helloworld/helloworld.go
```
