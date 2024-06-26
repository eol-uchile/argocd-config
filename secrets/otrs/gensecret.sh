#!/usr/bin/env bash

kubectl config use-context eol
export EDX_NAMESPACE=otrs

kubectl -n $EDX_NAMESPACE create secret generic otrs --dry-run=client --from-env-file=./otrs.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../otrs/secret.yaml
