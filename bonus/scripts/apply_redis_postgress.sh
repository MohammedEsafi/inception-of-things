#!/usr/bin/env bash

kubectl apply -f ../config/redis-svc.yml
kubectl apply -f ../config/redis-deployment.yml

kubectl apply -f ../config/postgresql-svc.yml
kubectl apply -f ../config/postgresql-deployment.yml
