#!/usr/bin/env bash

kubectl config use-context eol
export EDX_NAMESPACE=service-backup

kubectl -n $EDX_NAMESPACE create secret generic common --dry-run=client --from-env-file=./common.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../service-backup/secrets/common.yaml
kubectl -n $EDX_NAMESPACE create secret generic metabase --dry-run=client --from-env-file=./metabase.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../service-backup/secrets/metabase.yaml
kubectl -n $EDX_NAMESPACE create secret generic otrs --dry-run=client --from-env-file=./otrs.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../service-backup/secrets/otrs.yaml
kubectl -n $EDX_NAMESPACE create secret generic graylog --dry-run=client --from-env-file=./graylog.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../service-backup/secrets/graylog.yaml
