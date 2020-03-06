#!/usr/bin/env bash
set -e

kubectl apply -f metrics-server/
kubectl apply -f prometheus/
kubectl apply -f kube-state-metrics/

