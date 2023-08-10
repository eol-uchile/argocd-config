#!/usr/bin/env bash
set -e

kubectl config use-context eol
export TEST_NAMESPACE=test-eol

# configs
kubectl -n $TEST_NAMESPACE get secret s3-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > s3-settings.env
