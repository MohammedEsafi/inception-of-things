#!/usr/bin/env bash

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

bash create_gitlab_ns.sh
bash apply_redis_postgress.sh
bash apply_gitlab.sh
