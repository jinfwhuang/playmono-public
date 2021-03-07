
# local development files
package.json
yarn.lock


# bazel command
```bash
bazel build //nodejs/example-server:bundle
bazel run //nodejs/example-server:server
bazel run //nodejs/example-server:image


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