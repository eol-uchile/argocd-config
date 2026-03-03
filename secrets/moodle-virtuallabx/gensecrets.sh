#!/usr/bin/env bash
set -e

kubectl --context openuchile -n moodle-ing create secret generic moodle4-dev-config --from-file=moodle.php=./moodle4-dev.php --dry-run=client -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../moodle-virtuallabx/secrets/moodle4-dev-config.yaml
kubectl --context openuchile -n moodle-ing create secret generic moodle4-config --from-file=moodle.php=./moodle4.php --dry-run=client -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../moodle-virtuallabx/secrets/moodle4-config.yaml
kubectl --context openuchile -n moodle-ing create secret generic postgres --from-env-file=./postgres.env  --dry-run=client -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../moodle-virtuallabx/secrets/postgres.yaml
kubectl --context openuchile -n moodle-ing create secret generic redis --from-file=redis.conf=./redis.conf --dry-run=client -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../moodle-virtuallabx/secrets/redis.yaml
