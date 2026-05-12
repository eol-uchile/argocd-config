#!/usr/bin/env bash
set -e

# dev
kubectl --context oeol -n moodle-ing create secret generic moodle-dev-config --from-file=moodle.php=./moodle-dev.php --dry-run=client -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../moodle-virtuallabx-oeol/secrets/moodle-dev-config.yaml
kubectl --context oeol -n moodle-ing create secret generic postgres --from-env-file=./postgres.env  --dry-run=client -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../moodle-virtuallabx-oeol/secrets/postgres.yaml
kubectl --context oeol -n moodle-ing create secret generic redis --from-file=redis.conf=./redis.conf --dry-run=client -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../moodle-virtuallabx-oeol/secrets/redis.yaml
# prod
kubectl --context oeol -n moodle-ing create secret generic moodle-config --from-file=moodle.php=./moodle.php --dry-run=client -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../moodle-virtuallabx/secrets/moodle-config.yaml
kubectl --context oeol -n moodle-ing create secret generic postgres --from-env-file=./postgres.env  --dry-run=client -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../moodle-virtuallabx/secrets/postgres.yaml
kubectl --context oeol -n moodle-ing create secret generic redis --from-file=redis.conf=./redis.conf --dry-run=client -o yaml | kubeseal --context oeol --controller-namespace sealed-secrets -o yaml > ../../moodle-virtuallabx/secrets/redis.yaml
