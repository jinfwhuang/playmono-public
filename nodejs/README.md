
# Bazel Command
```bash
# Run an example nodejs server
bazel run //nodejs/cmd/example-server:binary
# Run an image
bazel run --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64 //nodejs/cmd/example-server:image

# Run an react app
bazel run //nodejs/cmd/hello_react:server

# Run the react app image
bazel run --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64 //nodejs/cmd/hello_react:server
```



#### summary
- No support for yarn workspaces

- Sharing first party libraries must be done through js_library. There is no clear counterpart that could be expressed in pure npm

- Pulling deps from multiple npm install "node_modules" is possible, but it doesn't work well with how they are used within code

- The standard way to share codes in npm is through workspaces. There is no easy way to make sharing codes work well both in npm (yarn workspaces) and in bazel (bazel targets).

- The only scenario that the current toolings work well is that there are very limited code sharing within the entire workspace


