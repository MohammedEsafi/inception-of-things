#!/usr/bin/env bash

apt update && apt upgrade -y &>/dev/null;

echo \# installing k3s
curl -sfL https://get.k3s.io | sh -;
echo alias k=kubectl >> ~/.bashrc
echo export KUBECONFIG=/etc/rancher/k3s/k3s.yaml >> ~/.bashrc
