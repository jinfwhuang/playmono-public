
# local development files
package.json
yarn.lock


# bazel command
```bash
bazel build //nodejs/cmd/hello_react:bundle
bazel run //nodejs/cmd/hello_react:server
bazel run --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64 //nodejs/cmd/hello_react:image
```


# debugging
```

tsc -p tsconfig.json

npx webpack ./coding/frontend/src/index.js --output dist/bundle.js

webpack-cli . 
$(execpath index.js)",
        "--config",
        "$(execpath webpack.config.js)",
        "-o",
        "$@
```