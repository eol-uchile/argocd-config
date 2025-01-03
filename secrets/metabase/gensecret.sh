#!/usr/bin/env bash

kubectl config use-context eol
export EDX_NAMESPACE=metabase

kubectl -n $EDX_NAMESPACE create secret generic metabase --dry-run=client --from-env-file=./metabase.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../metabase/secrets.yaml
kubectl -n $EDX_NAMESPACE create secret generic basic-auth --dry-run=client --from-file=auth=./basic_auth -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../metabase/access.yaml
