#!/bin/bash

apt-get update -y
apt-get upgrade -y

curl https://releases.rancher.com/install-docker/20.10.sh | sh

curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash


curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
touch /etc/apt/sources.list.d/kubernetes.list 
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update -y
apt-get install -y kubectl

bash launch_script.sh