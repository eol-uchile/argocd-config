#!/usr/bin/env bash

kubectl --context oeol -n metabase create secret generic metabase --dry-run=client --from-env-file=/home/vicente/Documentos/repo/argocd-config/metabase.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > /home/vicente/Documentos/repo/argocd-config/metabase/secrets.yaml
kubectl --context oeol -n metabase create secret generic basic-auth --dry-run=client --from-file=auth=/home/vicente/Documentos/repo/argocd-config/basic_auth -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > /home/vicente/Documentos/repo/argocd-config/metabase/access.yaml
