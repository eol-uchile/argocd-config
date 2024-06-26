#!/usr/bin/env bash
set -e

kubectl config use-context eol
export EDX_NAMESPACE=monitoring

# configs
kubectl -n $EDX_NAMESPACE get secret basic-auth -o jsonpath="{.data['auth']}" | base64 -d > basic_auth
kubectl -n $EDX_NAMESPACE get secret discord -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > discord.env
