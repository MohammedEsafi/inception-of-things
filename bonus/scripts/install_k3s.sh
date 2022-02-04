#!/usr/bin/env bash

apt update &>/dev/null && apt upgrade -y &>/dev/null;

echo \# installing k3s
curl -sfL https://get.k3s.io | sh -;

kubectl delete -f /var/lib/rancher/k3s/server/manifests/traefik.yaml

echo export KUBECONFIG=/etc/rancher/k3s/k3s.yaml >> ~/.bashrc
