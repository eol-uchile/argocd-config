#!/usr/bin/env bash
set -e

kubectl config use-context openuchile
export EDX_NAMESPACE=emi-project

# Static wordpress
kubectl -n $EDX_NAMESPACE get secret emi-wordpress -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > emi-wordpress.env
