
kubectl create -f kube-pv/kube-mysql-pv-statefulsets/kube-mysql-volumes.yaml
kubectl create -f kube-pv/kube-mysql-pv-statefulsets/kube-mysql-etcd.yaml
kubectl create -f kube-pv/kube-mysql-pv-statefulsets/kube-mysql-statefulset.yaml
kubectl create -f kube-pv/kube-mysql-pv-statefulsets/kube-mysql-wordpress.yaml
