#!/usr/bin/env bash
set -e

kubectl config use-context eol
export EDX_NAMESPACE=edx-backup

# configs
kubectl -n $EDX_NAMESPACE get secret common-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > common.env
kubectl -n $EDX_NAMESPACE get secret eol-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > eol-config.env
kubectl -n $EDX_NAMESPACE get secret norteamericano-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > norteamericano-config.env
kubectl -n $EDX_NAMESPACE get secret openuchile-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > openuchile-config.env
kubectl -n $EDX_NAMESPACE get secret uabierta-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > uabierta-config.env
kubectl -n $EDX_NAMESPACE get secret virtuallabx-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > virtuallabx-config.env
