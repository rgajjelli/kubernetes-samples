kubectl create -f python/env-variables/pod-env-var-set.yaml

kubectl describe pod envs | grep IP:

** Check within the cluster with the above generated POD_IP.

curl <POD_IP>:9876/info
This displays => "version": "1.0"

curl <POD_IP>:9876/env | grep SIMPLE_SERVICE_VERSION

kubectl exec envs -- printenv | grep SIMPLE_SERVICE_VERSION
