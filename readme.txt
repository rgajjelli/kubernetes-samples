
COMMAND-LINE
------------
 - This creates a deployment intern creates a ReplicaSet which has a unit of work i.e POD
 - A Deployment owns and manages one or more Replica Sets.
 - A Replica Set manages the basic units in Kubernetes i.e  - Pods

kubectl run devmynginx --image=nginx --replicas=1
kubectl run devmynginx --image=nginx --replicas=1

kubectl autoscale deployment devmynginx --min=1 --max=5
kubectl scale --current-replicas=2 --replicas=3 deployment/devmynginx
kubectl exec -it devmynginx /bin/bash

LABELS:
-------
kubectl get pods --show-labels
kubectl get pods --selector app=dev-nginx
kubectl label pods nginx1 user=raj  => added another label to the container by this COMMAND
kubectl get pods -l app=dev-nginx

DEPLOYMENTS:
------------
kubectl create -f ex4-nginx-deployment.yaml
kubectl get deployments
kubect get rs
kubect get pods
kubectl get pods -o wide
kubectl apply -f ex5-deployment-dev-update.yaml
kubectl get pods -o wide
kubectl get deployment nginx-deployment-dev -o yaml  => Retrives the yaml file

** SET Image**
# format
$ kubectl set image deployment <deployment> <container>=<image> --record
# example
$ kubectl set image deployment nginx nginx=nginx:1.9 --record

kubectl replace -f ex5-deployment-dev-update-1.9.yaml --record

kubect rollout history deployment/nginx-deployment-dev
kubectl rollout history deployment/nginx-deployment-dev

*** ROLLOUT STATUS ***
kubectl rollout status deployment nginx-deployment-dev

*** PAUSE ROLLING UPDATE ***
kubectl rollout pause deployment nginx-deployment-dev
*** RESUME ROLLING UPDATE ***
kubectl rollout resume deployment nginx-deployment-dev

*** ROLLBACK ***

kubectl rollout history deployment/nginx-deployment-dev
kubectl rollout history deployment/nginx-deployment-dev --revision=1
kubectl rollout history deployment/nginx-deployment-dev --revision=2
kubectl rollout history deployment/nginx-deployment-dev --revision=3

kubectl describe deployment nginx-deployment-dev

kubectl rollout undo deployment/nginx-deployment-dev --to-revision=2

kubectl rollout history deployment/nginx-deployment-dev
