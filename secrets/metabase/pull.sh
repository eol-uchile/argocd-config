#!/usr/bin/env bash
set -e

# configs
kubectl --context oeol -n metabase get secret metabase -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > metabase.env
kubectl --context oeol -n metabase get secret basic-auth -o jsonpath="{.data['auth']}" | base64 -d > basic_auth
