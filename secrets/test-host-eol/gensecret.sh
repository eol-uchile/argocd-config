#!/usr/bin/env bash

kubectl --context oeol -n test-eol create secret generic s3-config --dry-run=client --from-env-file=./s3-settings.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../test-host-eol/secrets/s3-settings.yaml
