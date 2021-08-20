#!/usr/bin/env bash
set -e

export EDX_NAMESPACE=edx-backup

# configs
kubectl -n $EDX_NAMESPACE get secret uabierta-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > uabierta.env
kubectl -n $EDX_NAMESPACE get secret eol-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > eol.env
kubectl -n $EDX_NAMESPACE get secret virtuallabx-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > virtuallabx.env