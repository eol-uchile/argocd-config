#!/usr/bin/env bash
set -x

kubectl config use-context openuchile

kubectl -n emi-project create secret generic emi-wordpress --dry-run=client --from-env-file=./emi-wordpress.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../emi-project/secrets/emi-wordpress.yaml
