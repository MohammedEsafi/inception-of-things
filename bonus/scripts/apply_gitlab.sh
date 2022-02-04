#!/usr/bin/env bash

kubectl apply -f ../config/gitlab-svc.yml
kubectl apply -f ../config/gitlab-deployment.yml
