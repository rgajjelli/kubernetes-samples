
A job is a supervisor for pods carrying out batch processes, that is, a process that runs for a certain time to completion

kubectl get pods --show-all
kubectl describe jobs/countdown


kubectl create -f ./cronjob.yaml

OR

kubectl run hello --schedule="*/1 * * * *" --restart=OnFailure --image=busybox -- /bin/sh -c "date; echo Hello from the Kubernetes cluster"

kubectl get cronjob hello

Watch after 1 minute
kubectl get jobs --watch

kubectl get cronjob hello

kubectl delete cronjob hello


** NODE lABEL***
kubectl label nodes 192.168.146.201 shouldrun=here
When you run/execute a POD, always that POD will run from -192.168.146.201 
