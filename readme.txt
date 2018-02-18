kubectl run devmynginx --image=nginx --replicas=1
==> Deployment Type =[mynginx]
                ==>  A POD  = [mynginx-1358273036]   ---->  minion1/192.168.146.201
                      ==> Containers     [172.30.12.2]

kubectl run devmynginx --image=nginx --replicas=1
kubectl autoscale deployment devmynginx --min=1 --max=10
kubectl scale --current-replicas=2 --replicas=3 deployment/devmynginx
kubectl exec -it devmynginx /bin/bash
MINION-1  => 172.30.12.0 => FLANNEL
                                  ==>  172.30.12.1  ==> DOCKER0
                                                              ==> 172.30.12.2 P1
                                                              ==> 172.30.12.3 P2
MINION-1  => 172.30.70.0 => FLANNEL
                                  ==>  172.30.70.1  ==> DOCKER0
                                                             ==> 172.30.70.2 P3

******Day 2********

LABELS:
-------
kubectl get pods --show-labels
kubectl get pods --selector app=dev-nginx
kubectl label pods nginx1 user=raj  => added another label to the container
kubectl get pods -l app=dev-nginx

DEPLOYMENTS:
------------
kubectl apply -f ex4-nginx-deployment.yaml
kubectl get deployments
kubectl get deployment nginx-deployment-dev -o yaml
kubect get pods
kubectl get pods -o wide
kubectl apply -f ex5-nginx-deployment-rollout.yaml
kubectl get pods -o wide
cp ex5-nginx-deployment-rollout.yaml ex5-nginx-deployment-rollout-191.yaml
kubectl get pods -o wide
kubect rollout history deployment/nginx-deployment-dev
kubectl rollout history deployment/nginx-deployment-dev
vi ex5-nginx-deployment-rollout-191.yaml
kubectl apply -f ex5-nginx-deployment-rollout-191.yaml
kubectl get pods -o wide
kubectl rollout history deployment/nginx-deployment-dev --revision=1
kubectl rollout history deployment/nginx-deployment-dev --revision=2
kubectl rollout history deployment/nginx-deployment-dev --revision=3
kubectl get pods -o wide
kubectl describe deployment nginx-deployment-dev
kubectl describe pods nginx-deployment-dev-2538522855-2w374
kubectl rollout history deployment/nginx-deployment-dev
kubectl rollout history deployment/nginx-deployment-dev --revision=3
kubectl rollout undo deployment/nginx-deployment-dev --to-revision=2

kubectl rollout history deployment/nginx-deployment-dev
kubectl get pods -o wide
kubectl describe pods nginx-deployment-dev-2989017223-pnt0x
kubectl describe deployment nginx-deployment-dev
