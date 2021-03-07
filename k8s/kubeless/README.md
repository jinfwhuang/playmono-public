



# tutorial
https://kubeless.io/docs/quick-start/
https://kubeless.io/docs/runtimes/


# how it works
- The operator controller is `kubeless-controller-manager`.
- Each function is a deployment, created by controller
- The deployment listen to requests and execute them in place.
- Scaling would be about scaling those "deployments"

This is an example of the deployment
```bash
$kubectl -n kubeless get pod
NAME                                           READY     STATUS    RESTARTS   AGE
kubeless-controller-manager-5d9bf7f5c6-kzzgm   3/3       Running   0          34m
$kubectl get pod
NAME                      READY     STATUS    RESTARTS   AGE
hello-764c794dfc-g98qf    1/1       Running   0          23m
testjs-794f6fb89b-nbh57   1/1       Running   0          9m
```


# deploy the function
```bash
# python
kubeless function deploy hello \
--runtime python3.7 \
--from-file test.py \
--handler test.hello

# nodejs
--env NPM_REGISTRY=http://my-registry.com \
--env NPM_SCOPE=@myorg \
--dependencies package.json \

kubeless function deploy testjs --runtime nodejs14 \
--handler test.foo \
--from-file test.js


kubeless function deploy testjs --dry-run --runtime nodejs14 \
--handler test.foo \
--from-file test.js

kubeless function deploy testjs  --runtime nodejs14 --handler test.foo --from-file test.js --dryrun

```

# call the function

```bash
kubeless function ls


kubectl port-forward hello-764c794dfc-g98qf 8080

curl -L --header "Content-Type:application/json" \
--data '{"Another": "Echo"}\n' 
localhost:8080/api/v1/namespaces/default/services/hello:http-function-port/proxy/


curl -L --header "Content-Type:application/json" \
--data '{"nodejs-test": "Echo"}' \
localhost:8080/api/v1/namespaces/default/services/testjs:http-function-port/proxy/

```