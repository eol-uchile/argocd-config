#!/usr/bin/env bash
set -e

kubectl config use-context openuchile
export MOODLE_NAMESPACE=moodle-ing

kubectl -n $MOODLE_NAMESPACE create secret generic moodle-config --from-file=moodle.php=./moodle.php --dry-run=client -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../moodle-virtuallabx/secrets/moodle-config.yaml
kubectl -n $MOODLE_NAMESPACE create secret generic moodle4-config --from-file=moodle.php=./moodle4.php --dry-run=client -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../moodle-virtuallabx/secrets/moodle4-config.yaml
kubectl -n $MOODLE_NAMESPACE create secret generic postgres --from-env-file=./postgres.env  --dry-run=client -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../moodle-virtuallabx/secrets/postgres.yaml
kubectl -n $MOODLE_NAMESPACE create secret generic redis --from-file=redis.conf=./redis.conf --dry-run=client -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../moodle-virtuallabx/secrets/redis.yaml
