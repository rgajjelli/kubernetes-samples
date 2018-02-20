kubectl create -f python/namespace/ukns-namespace-create.yaml
kubectl create -f python/namespace/ukns-rc.yaml
kubectl create -f python/namespace/ukns-svc.yaml


kubectl describe ns default
kubectl describe ns UK

vi yourpod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: yourpod
spec:
  containers:
  - name: sise
    image: gajjelli/simpleservice
    ports:
    - containerPort: 9876

kubectl create --namespace=UK -f yourpod.yaml
==> This POD will get creates under UK namespace

NOTE:
-----
*** To access a service that is deployed in a different namespace than the one you’re accessing it from,
use a FQDN in the form $SVC.$NAMESPACE.svc.cluster.local. ***
