kubectl create -f python/dns/py-rc.yaml
kubectl create -f python/dns/py-svc.yaml

To access a service that is deployed in a different namespace than the one you’re accessing it from, use a FQDN in the form $SVC.$NAMESPACE.svc.cluster.local.
