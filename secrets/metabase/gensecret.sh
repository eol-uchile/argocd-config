#!/usr/bin/env bash

kubectl --context oeol -n metabase create secret generic metabase --dry-run=client --from-env-file=./metabase.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../metabase/secrets.yaml
kubectl --context oeol -n metabase create secret generic basic-auth --dry-run=client --from-file=auth=./basic_auth -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../metabase/access.yaml
