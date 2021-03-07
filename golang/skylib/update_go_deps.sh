#!/usr/bin/env bash
#
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "$DIR/../.."
# bazel run //:gazelle -- update-repos -from_file=go.mod -to_macro=golang/skylib/go_repositories.bzl%go_repositories -prune=true -build_file_proto_mode=disable_global
# bazel run //:gazelle

# bazel run //golang:gazelle -- update-repos -from_file=golang/go.mod -to_macro=golang/skylib/go_repositories.bzl%go_repositories -prune=true -build_file_proto_mode=disable_global
bazel run //golang/skylib:gazelle -- update-repos -from_file=golang/go.mod -to_macro=golang/skydeps/go_repositories.bzl%go_repositories -prune=true -build_file_proto_mode=disable_global

gazelle update -go_prefix=github.com/jinfwhuang/playmono -repo_root=.