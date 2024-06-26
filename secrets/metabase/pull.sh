#!/usr/bin/env bash
set -e

kubectl config use-context eol
export EDX_NAMESPACE=metabase

# configs
kubectl -n $EDX_NAMESPACE get secret metabase -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > metabase.env
