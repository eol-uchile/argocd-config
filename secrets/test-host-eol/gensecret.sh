#!/usr/bin/env bash

kubectl config use-context eol
export TEST_NAMESPACE=test-eol

kubectl -n $TEST_NAMESPACE create secret generic s3-config --dry-run=client --from-env-file=./s3-settings.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../test-host-eol/secrets/s3-settings.yaml
