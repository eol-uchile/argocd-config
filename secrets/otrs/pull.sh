#!/usr/bin/env bash
set -e

kubectl config use-context eol
export EDX_NAMESPACE=otrs

# configs
kubectl -n $EDX_NAMESPACE get secret otrs -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > otrs.env
