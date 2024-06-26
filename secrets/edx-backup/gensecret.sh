#!/usr/bin/env bash

kubectl config use-context eol
export EDX_NAMESPACE=edx-backup

kubectl -n $EDX_NAMESPACE create secret generic common-config --dry-run=client --from-env-file=./common.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/common.yaml
kubectl -n $EDX_NAMESPACE create secret generic eol-config --dry-run=client --from-env-file=./eol-config.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/eol.yaml
kubectl -n $EDX_NAMESPACE create secret generic norteamericano-config --dry-run=client --from-env-file=./norteamericano-config.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/norteamericano.yaml
kubectl -n $EDX_NAMESPACE create secret generic openuchile-config --dry-run=client --from-env-file=./openuchile-config.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/openuchile.yaml
kubectl -n $EDX_NAMESPACE create secret generic uabierta-config --dry-run=client --from-env-file=./uabierta-config.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/uabierta.yaml
kubectl -n $EDX_NAMESPACE create secret generic virtuallabx-config --dry-run=client --from-env-file=./virtuallabx-config.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/virtuallabx.yaml
