#!/usr/bin/env bash

kubectl --context oeol -n service-backup create secret generic common --dry-run=client --from-env-file=./common.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../service-backup/secrets/common.yaml
kubectl --context oeol -n service-backup create secret generic metabase --dry-run=client --from-env-file=./metabase.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../service-backup/secrets/metabase.yaml
kubectl --context oeol -n service-backup create secret generic znuny --dry-run=client --from-env-file=./znuny.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../service-backup/secrets/znuny.yaml
