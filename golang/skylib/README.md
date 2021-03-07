#### Update go deps
```bash
# After modifying go.mod
bazel run //golang/skylib:gazelle -- update-repos -from_file=golang/go.mod -to_macro=golang/skylib/go_repositories.bzl%go_repositories -prune=true -build_file_proto_mode=disable_global
```

#### Update go targets in BUILD files
gazelle update -go_prefix=github.com/jinfwhuang/playmono -repo_root=.

Note that the targets such the following need to be fixed manually.
```
deps = ["//pkg/utils"],
```
-->
```
deps = ["//golang/pkg/utils"],

```