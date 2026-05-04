#!/usr/bin/env bash

# eol-c
kubectl --context eol -n edx-backup create secret generic common-config --dry-run=client --from-env-file=./common.env -o yaml | kubeseal --context eol --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/common.yaml
kubectl --context eol -n edx-backup create secret generic eol-config --dry-run=client --from-env-file=./eol-config.env -o yaml | kubeseal --context eol --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/eol.yaml
kubectl --context eol -n edx-backup create secret generic openuchile-config --dry-run=client --from-env-file=./openuchile-config.env -o yaml | kubeseal --context eol --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/openuchile.yaml
kubectl --context eol -n edx-backup create secret generic virtuallabx-config --dry-run=client --from-env-file=./virtuallabx-config.env -o yaml | kubeseal --context eol --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/virtuallabx.yaml
kubectl --context eol -n edx-backup create secret generic redfid-config --dry-run=client --from-env-file=./redfid-config.env -o yaml | kubeseal --context eol --controller-namespace sealed-secrets -o yaml > ../../edx-backup/secrets/redfid.yaml

# oeol-c
kubectl --context oeol -n edx-backup create secret generic common-config --dry-run=client --from-env-file=./oeol-common.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../edx-backup-oeol/secrets/common.yaml
kubectl --context oeol -n edx-backup create secret generic umce-config --dry-run=client --from-env-file=./umce-config.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../edx-backup-oeol/secrets/umce.yaml
