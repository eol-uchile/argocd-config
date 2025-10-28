#!/usr/bin/env bash
set -e

# configs
kubectl --context oeol -n otrs get secret otrs -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > otrs.env
