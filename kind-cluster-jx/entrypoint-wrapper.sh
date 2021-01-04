#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

# Setting up KIND cluster
/entrypoint-base.sh

echo "Setting up Ingress Controller"
# Setting up Ingress Controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml

echo "Setting up Metric Server"
# Setting up Metric Server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl patch deployment metrics-server -n kube-system -p '{"spec":{"template":{"spec":{"containers":[{"name":"metrics-server","args":["--cert-dir=/tmp", "--secure-port=4443", "--kubelet-insecure-tls","--kubelet-preferred-address-types=InternalIP"]}]}}}}'

exec "$@"
