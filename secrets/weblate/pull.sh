#!/usr/bin/env bash
set -e

# configs
kubectl --context oeol -n weblate get secret weblate -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > weblate.env
kubectl --context oeol -n weblate get secret pg-env -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > postgres.env
kubectl --context oeol -n weblate get secret redis-env -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > redis.env
kubectl --context oeol -n weblate get secret pg-pass-file -o jsonpath="{.data['postgres-password']}" | base64 -d > postgres-password
kubectl --context oeol -n weblate get secret redis-pass-file -o jsonpath="{.data['redis-password']}" | base64 -d > redis-password
