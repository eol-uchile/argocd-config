#!/usr/bin/env bash
set -e

kubectl --context oeol -n test-eol get secret s3-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > s3-settings.env
