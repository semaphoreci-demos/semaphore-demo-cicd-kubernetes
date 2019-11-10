#!/usr/bin/env bash
# apply a kubernetes manifest

deployment=$1
replicas=$2
image=$3
tag=$4

manifest=$(mktemp)
cat manifest.yml | envsubst | tee $manifest
kubectl apply -f $manifest
