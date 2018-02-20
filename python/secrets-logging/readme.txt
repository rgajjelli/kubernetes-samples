kubectl create -f python/namespace/secrets-pod.yaml

Secrets are namespaced objects, that is, exist in the context of a namespace
The secret data on nodes is stored in tmpfs volumes
Access them via a volume or an environment variable from a container running in a pod
1 secret size limit to 1MB exists
The API server stores secrets as plaintext in etcd

> echo -n "A19fh68B001j" > ./apikey.txt
> kubectl create secret generic apikey --from-file=./apikey.txt
kubectl describe secrets/apikey

kubectl exec secretfuse -c shell -i -t -- bash
df -h
mount
ls -lrt /tmp/apikey.txt


**** Logging ****
kubectl create -f python/namespace/logging.yaml
kubectl logs --tail=5 log-pod -c gen
kubectl logs -f --since=10s log-pod -c gen
