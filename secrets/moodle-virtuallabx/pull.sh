#!/usr/bin/env bash
set -e

kubectl config use-context openuchile
export MOODLE_NAMESPACE=moodle-ing

# Moodle configuration
kubectl -n $MOODLE_NAMESPACE get secret moodle4-config -o jsonpath="{.data['moodle\.php']}" | base64 -d > moodle4.php

# Moodle dev configuration
kubectl -n $MOODLE_NAMESPACE get secret moodle-config -o jsonpath="{.data['moodle\.php']}" | base64 -d > moodle.php

# Postgres config
kubectl -n $MOODLE_NAMESPACE get secret postgres -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > postgres.env

# Redis config
kubectl -n $MOODLE_NAMESPACE get secret redis -o jsonpath="{.data['redis\.conf']}" | base64 -d > redis.conf
