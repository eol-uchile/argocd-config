#!/usr/bin/env bash

kubectl -n weblate create secret generic weblate --dry-run=client --from-env-file=./weblate.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../weblate/secrets/weblate.yaml
kubectl -n weblate create secret generic pg-env --dry-run=client --from-env-file=./postgres.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../weblate/secrets/postgres-env.yaml
kubectl -n weblate create secret generic redis-env --dry-run=client --from-env-file=./redis.env -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../weblate/secrets/redis-env.yaml
kubectl -n weblate create secret generic pg-pass-file --dry-run=client --from-file=postgres-password=./postgres-password -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../weblate/secrets/postgres-file.yaml
kubectl -n weblate create secret generic redis-pass-file --dry-run=client --from-file=redis-password=./redis-password -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../weblate/secrets/redis-file.yaml
