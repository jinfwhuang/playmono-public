


#### installation
```
GO111MODULE="on" go get sigs.k8s.io/kind@latest
```

#### commands
```
kind create cluster

kind load docker-image my-app:latest
```


#### namespace setup

```bash
kubectl create namespace namespace1

kubectl create secret docker-registry docker-registry-image-pull \
--docker-server=jinplaymono.jfrog.io \
--docker-username="huangjinf@gmail.com" \
--docker-password="5Cu&#AY9TIz" \
--docker-email=huangjinf@gmail.com

kubectl patch serviceaccount default -p '{"imagePullSecrets": [{"name": "docker-registry-image-pull"}]}'
```

#### Additional references
- configuration https://kind.sigs.k8s.io/docs/user/quick-start/#installation



