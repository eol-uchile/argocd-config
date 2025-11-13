#!/usr/bin/env bash
set -e

kubectl config use-context eol
export EDX_NAMESPACE=service-backup

# configs
kubectl -n $EDX_NAMESPACE get secret common -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > common.env
kubectl -n $EDX_NAMESPACE get secret metabase -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > metabase.env
kubectl -n $EDX_NAMESPACE get secret otrs -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > otrs.env
