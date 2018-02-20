kubectl create -f python/healthcheck/pod-healthcheck.yaml
kubectl describe pod hc


1. Verify if a container in a pod is healthy and ready to serve traffic.
2. Kubernetes provides for a range of health checking mechanisms.
3. Health checks -carried out by the kubelet to determine when to restart a container (for livenessProbe)
and by services to determine if a pod should receive traffic or not (for readinessProbe).

Example:
livenessProbe:
  initialDelaySeconds: 2
  periodSeconds: 5
  httpGet:
    path: /health
    port: 9876

** What is the meaning of the above lines ?
** Kubernetes will start checking /health endpoint in every 5 seconds after waiting 2 seconds for the first check

env:
- name: HEALTH_MIN
  value: "1000"
- name: HEALTH_MAX
  value: "4000"
livenessProbe:
  initialDelaySeconds: 2
  periodSeconds: 5

** What is the meaning of the above lines ?
*** Pod that has a container that randomly (from-> 1 to 4 sec) does not return a 200 code:

 How to signal container to start after after few seconds (Get some DB tables, S3 checks.. etc, after only it should start)?
 readinessProbe that kicks in after 10 seconds

** Let’s create a pod with a readinessProbe that kicks in after 10 seconds:
readinessProbe:
     initialDelaySeconds: 10
     httpGet:
       path: /health
       port: 9876

kubectl describe pod ready-pod
