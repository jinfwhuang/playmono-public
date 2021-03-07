

# deployment

```bash

bazel query ///deployment/helloworld:*

bazel run //deployment/helloworld:helloworld-namespace1.show

bazel run //deployment/helloworld:helloworld-namespace1.apply
```



# deploy to local kind cluster
```bash
bazel run //deployment/helloworld:helloworld-namespace1.gitops

kubectl apply -f /Users/jin/code/playmono/cloud/namespace1/kind-kind/helloworld-namespace1.yaml


bazel run //deployment/helloworld:helloworld-namespace1.gitops|tail -n 1| xargs -I {} kubectl apply --validate=false -f {}

kubectl port-forward helloworld-578dc44f54-gxf9w 8080

```