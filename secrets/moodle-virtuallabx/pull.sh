#!/usr/bin/env bash
set -e

# Moodle configuration
kubectl --context openuchile -n moodle-ing get secret moodle4-config -o jsonpath="{.data['moodle\.php']}" | base64 -d > moodle4.php

# Moodle dev configuration
kubectl --context openuchile -n moodle-ing get secret moodle4-dev-config -o jsonpath="{.data['moodle\.php']}" | base64 -d > moodle4-dev.php

# Postgres config
kubectl --context openuchile -n moodle-ing get secret postgres -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > postgres.env

# Redis config
kubectl --context openuchile -n moodle-ing get secret redis -o jsonpath="{.data['redis\.conf']}" | base64 -d > redis.conf
