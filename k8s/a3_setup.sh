#!/bin/bash



# kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# add --kubelet-insecure-tls to deployment.spec.containers[].args[]
# kubectl -nkube-system edit deploy/metrics-server
# kubectl -nkube-system rollout restart deploy/metrics-server

kubectl apply -f ./k8s/manifests/backend-metrics-service.yaml
kubectl apply -f ./k8s/manifests/backend-hpa.yaml