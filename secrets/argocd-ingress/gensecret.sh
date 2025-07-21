#!/usr/bin/env bash

kubectl config use-context oeol

kubectl create secret generic basic-auth --dry-run=client --from-file=auth=./basic_auth -o yaml | kubeseal --scope cluster-wide --controller-namespace sealed-secrets -o yaml > ../../argocd-ingress/secret.yaml
