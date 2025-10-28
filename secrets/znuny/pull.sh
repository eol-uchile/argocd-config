#!/usr/bin/env bash
set -e

# configs
kubectl --context oeol -n znuny get secret znuny -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > znuny.env
