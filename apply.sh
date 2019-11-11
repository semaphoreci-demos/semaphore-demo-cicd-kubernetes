#!/usr/bin/env bash
# apply a kubernetes manifest

set -e

export deployment=$1
export replicas=$2
export img=$3

manifest=$(mktemp)
cat manifests/deployment.yml | envsubst | tee $manifest
kubectl apply -f $manifest
kubectl rollout status -f $manifest
rm -f $manifest
