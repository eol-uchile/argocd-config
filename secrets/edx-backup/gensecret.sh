#!/usr/bin/env bash

kubectl --context oeol -n edx-backup create secret generic virtuallabx-config --dry-run=client --from-env-file=./virtuallabx-config.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../edx-backup-oeol/secrets/virtuallabx.yaml
kubectl --context oeol -n edx-backup create secret generic openuchile-config --dry-run=client --from-env-file=./openuchile-config.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../edx-backup-oeol/secrets/openuchile.yaml
kubectl --context oeol -n edx-backup create secret generic eol-config --dry-run=client --from-env-file=./eol-config.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../edx-backup-oeol/secrets/eol.yaml
kubectl --context oeol -n edx-backup create secret generic common-config --dry-run=client --from-env-file=./oeol-common.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../edx-backup-oeol/secrets/common.yaml
kubectl --context oeol -n edx-backup create secret generic umce-config --dry-run=client --from-env-file=./umce-config.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../edx-backup-oeol/secrets/umce.yaml
kubectl --context oeol -n edx-backup create secret generic redfid-config --dry-run=client --from-env-file=./redfid-config.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../edx-backup-oeol/secrets/redfid.yaml
