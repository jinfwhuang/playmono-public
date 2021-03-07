load("@com_adobe_rules_gitops//gitops:defs.bzl", "k8s_deploy")


SERVICE_NAME = "helloworld"

CLUSTER = "kind-kind"

USER = "kind-kind"

# REGISTRY = "localhost:5000"

# REGISTRY = "hub.docker.com"
# REGISTRY = "docker.io/jinfwhuang"
REGISTRY = "jinplaymono.jfrog.io/playmono"

"""
# docker only allow one sub path
TAGNAME=docker.io/jinfwhuang/path1/path2:latest
TAGNAME=registry.gitlab.com/jinfwhuang/image:latest

# gitlab only allows two subpaths
TAGNAME=registry.gitlab.com/jinfwhuang/playmono/path1/path3/path4
TAGNAME=registry-1.docker.io/playmono/aaa

TAGNAME=jinplaymono.jfrog.io/playmono/hello-world/path1/path2/path3
docker tag hello-world $TAGNAME && docker push $TAGNAME

docker login jinplaymono.jfrog.io
"""

[k8s_deploy(
    name = SERVICE_NAME + "-" + ENV if NAMESPACE != "{BUILD_USER}" else ENV,
    cluster = CLUSTER,
    image_registry = REGISTRY,  # override the default registry host for developent
    images = {
        "helloworld-image": "//golang/cmd/helloworld:image",
    },
    manifests = glob([
        "manifests/*.yaml",
        "manifests/" + ENV + "/*.yaml",
    ]),
    patches = glob([
        "overlays/" + ENV + "/*.yaml",
    ]),

    namespace = NAMESPACE,
    user = USER,
) for ENV, NAMESPACE in [
    ("mynamespace", "{BUILD_USER}"),
    ("namespace1", "namespace1"),
    ("namespace2", "namespace2"),
]]

### setup docker registry
"""
docker login jinplaymono.jfrog.io

"""

### setup namespace

"""
kubectl create namespace namespace1

kubectl create secret docker-registry docker-registry-image-pull \
--docker-server=jinplaymono.jfrog.io \
--docker-username="huangjinf@gmail.com" \
--docker-password="5Cu&#AY9TIz" \
--docker-email=huangjinf@gmail.com


kubectl patch serviceaccount default -p '{"imagePullSecrets": [{"name": "docker-registry-image-pull"}]}'
"""

