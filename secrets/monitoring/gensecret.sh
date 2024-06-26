#!/usr/bin/env bash

kubectl config use-context eol
export EDX_NAMESPACE=monitoring

kubectl create secret generic basic-auth --dry-run=client --from-file=auth=./basic_auth -o yaml | kubeseal --scope cluster-wide --controller-namespace sealed-secrets -o yaml > ../../monitoring/secret.yaml
kubectl -n $EDX_NAMESPACE create secret generic discord --dry-run=client --from-env-file=./discord.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../monitoring/discord-secrets.yaml
