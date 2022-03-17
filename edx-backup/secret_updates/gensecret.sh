#!/usr/bin/env bash

kubectl config use-context eol
export EDX_NAMESPACE=edx-backup

kubectl -n $EDX_NAMESPACE create secret generic common-config --dry-run=client --from-env-file=./common.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../secrets/common.yaml
kubectl -n $EDX_NAMESPACE create secret generic uabierta-config --dry-run=client --from-env-file=./uabierta.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../secrets/uabierta.yaml
kubectl -n $EDX_NAMESPACE create secret generic eol-config --dry-run=client --from-env-file=./eol.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../secrets/eol.yaml
kubectl -n $EDX_NAMESPACE create secret generic virtuallabx-config --dry-run=client --from-env-file=./virtuallabx.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../secrets/virtuallabx.yaml
kubectl -n $EDX_NAMESPACE create secret generic norteamericano-config --dry-run=client --from-env-file=./norteamericano.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../secrets/norteamericano.yaml
kubectl -n $EDX_NAMESPACE create secret generic openuchile-config --dry-run=client --from-env-file=./openuchile.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../secrets/openuchile.yaml