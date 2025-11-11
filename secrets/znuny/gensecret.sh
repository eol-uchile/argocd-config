#!/usr/bin/env bash

kubectl --context oeol -n znuny create secret generic znuny --dry-run=client --from-env-file=./znuny.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../znuny/secret.yaml
