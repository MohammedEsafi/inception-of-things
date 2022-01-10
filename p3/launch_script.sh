#!/bin/bash

echo "===> creating cluster"
k3d cluster create p3 -p 80:80@loadbalancer

echo "===> waiting for treafik jobs to finish"
kubectl -n kube-system wait --for=condition=complete --timeout=-1s jobs/helm-install-traefik-crd
kubectl -n kube-system wait --for=condition=complete --timeout=-1s jobs/helm-install-traefik

echo "===> creating agrocd namespace"
kubectl create namespace argocd

echo "===> creating dev namespace"
kubectl create namespace dev

echo "===> installing argocd"
kubectl apply -n argocd -f argocd.yaml

echo "===> waiting for server to load"
for deploy in $(kubectl -n argocd get deployments | tail -n +2 | cut -d ' ' -f 1); do
  kubectl -n argocd rollout status deployments/$deploy
done

# echo "===> expose argocd server"
# kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

echo "===> apply ingress to expose argocd and the app"
kubectl apply -f ingress.yaml

echo "===> apply the application"
kubectl apply -f application.yaml

echo "===> password to connect to the argocd platform"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo


#resources
    # https://tanzu.vmware.com/developer/guides/argocd-gs/

