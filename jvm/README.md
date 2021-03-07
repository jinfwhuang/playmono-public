

#### Updating maven_install.json
```
bazel run @unpinned_maven//:pin
```

#### Bazel commands
```
bazel run //jvm/java/github/com/jinfwhuang/cmd/helloserver:binary

bazel run //jvm/java/github/com/jinfwhuang/cmd/app1:binary -- --sleep=10000
```

