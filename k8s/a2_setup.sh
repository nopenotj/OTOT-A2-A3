#!/bin/bash

# Setup Kind
kind create cluster --name kind-1 --config k8s/kind/cluster-config.yaml
kind load docker-image a1-node --name kind-1

# Setup kubes
kubectl apply -f k8s/manifests/backend-deployment.yaml
kubectl apply -f k8s/manifests/backend-service.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl -n ingress-nginx get deploy -w
kubectl apply -f k8s/manifests/backend-ingress.yaml

kubectl get all -n default
kubectl get all -n ingress-nginx
echo "App running on : http://localhost"