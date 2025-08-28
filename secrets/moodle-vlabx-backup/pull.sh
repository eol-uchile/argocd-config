#!/usr/bin/env bash
set -e

kubectl config use-context openuchile
export EDX_NAMESPACE=moodle-backup

# configs
kubectl -n $EDX_NAMESPACE get secret backup-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > moodle-backup.env