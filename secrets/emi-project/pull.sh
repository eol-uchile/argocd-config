#!/usr/bin/env bash
set -e

# Static wordpress
kubectl --context oeol -n emi-project get secret emi-wordpress -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > emi-wordpress.env
