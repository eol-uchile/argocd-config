#!/usr/bin/env bash
set -e

kubectl config use-context oeol
export EDX_NAMESPACE=argocd

# configs
kubectl -n $EDX_NAMESPACE get secret basic-auth -o jsonpath="{.data['auth']}" | base64 -d > basic_auth
