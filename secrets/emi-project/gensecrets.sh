#!/usr/bin/env bash
set -x

kubectl --context oeol -n emi-project create secret generic emi-wordpress --dry-run=client --from-env-file=./emi-wordpress.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../emi-project/secrets/emi-wordpress.yaml
