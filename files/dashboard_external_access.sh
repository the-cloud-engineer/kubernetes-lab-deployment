#/bin/bash

kubectl -n kubernetes-dashboard get service  kubernetes-dashboard -o yaml > /root/dashboard-service.yaml
sed -i "s/type: ClusterIP/type: NodePort/g" /root/dashboard-service.yaml
kubectl -n kubernetes-dashboard apply -f /root/dashboard-service.yaml
