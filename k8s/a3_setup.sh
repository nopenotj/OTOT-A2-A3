#!/bin/bash



# kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# add --kubelet-insecure-tls to deployment.spec.containers[].args[]
# kubectl -nkube-system edit deploy/metrics-server
# kubectl -nkube-system rollout restart deploy/metrics-server

# A3.1
kubectl apply -f ./k8s/manifests/backend-metrics-service.yaml
kubectl apply -f ./k8s/manifests/backend-hpa.yaml

# A3.2
kubectl apply -f ./k8s/manifests/ backend-deployment-zone-aware.yaml

# Verify
kubectl get nodes -L topology.kubernetes.io/zone
kubectl get po -lapp=backend-zone-aware -owide --sort-by='.spec.nodeName'