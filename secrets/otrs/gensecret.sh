#!/usr/bin/env bash

kubectl --context oeol -n otrs create secret generic otrs --dry-run=client --from-env-file=./otrs.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../otrs/secret.yaml
