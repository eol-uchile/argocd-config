#!/usr/bin/env bash

kubectl config use-context eol
export EDX_NAMESPACE=edx-backup

kubectl -n $EDX_NAMESPACE create secret generic common-config --dry-run=client --from-env-file=./common.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/common.yaml
kubectl -n $EDX_NAMESPACE create secret generic eol-config --dry-run=client --from-env-file=./eol-config.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/eol.yaml
kubectl -n $EDX_NAMESPACE create secret generic redfid-config --dry-run=client --from-env-file=./norteamericano-config.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/redfid.yaml
kubectl -n $EDX_NAMESPACE create secret generic openuchile-config --dry-run=client --from-env-file=./openuchile-config.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/openuchile.yaml
kubectl -n $EDX_NAMESPACE create secret generic virtuallabx-config --dry-run=client --from-env-file=./virtuallabx-config.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/virtuallabx.yaml

# OEOL
kubectl config use-context oeol
kubectl -n $EDX_NAMESPACE create secret generic common-config --dry-run=client --from-env-file=./oeol-common.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../edx-backup-oeol/secrets/common.yaml
kubectl -n $EDX_NAMESPACE create secret generic umce-config --dry-run=client --from-env-file=./umce-config.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../edx-backup-oeol/secrets/umce.yaml
