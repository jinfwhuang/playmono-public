#### Update go deps
bazel run //golang/skylib:gazelle -- update-repos -from_file=golang/go.mod -to_macro=golang/skydeps/go_repositories.bzl%go_repositories -prune=true -build_file_proto_mode=disable_global

#### Update go targets in BUILD files
gazelle update -go_prefix=github.com/jinfwhuang/playmono -repo_root=.

Note that the following targets need to be fixed manually
```
deps = ["//pkg/utils"],
-->
```
```
deps = ["//golang/pkg/utils"],

```