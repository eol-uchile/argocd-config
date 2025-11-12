#!/usr/bin/env bash
set -e

# configs
kubectl --context oeol -n service-backup get secret common -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > common.env
kubectl --context oeol -n service-backup get secret metabase -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > metabase.env
kubectl --context oeol -n service-backup get secret znuny -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > znuny.env
