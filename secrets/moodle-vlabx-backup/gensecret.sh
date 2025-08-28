#!/usr/bin/env bash

kubectl config use-context openuchile
export EDX_NAMESPACE=moodle-backup

kubectl -n $EDX_NAMESPACE create secret generic backup-config --dry-run=client --from-env-file=./moodle-backup.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../moodle-vlabx-backup/secrets/backup.yaml
