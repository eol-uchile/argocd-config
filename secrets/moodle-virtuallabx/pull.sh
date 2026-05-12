#!/usr/bin/env bash
set -e

# Production
# Moodle configuration
kubectl --context oeol -n moodle-ing get secret moodle-config -o jsonpath="{.data['moodle\.php']}" | base64 -d > moodle.php

# Development
# Moodle dev configuration
kubectl --context oeol -n moodle-ing get secret moodle-dev-config -o jsonpath="{.data['moodle\.php']}" | base64 -d > moodle-dev.php

# Common
# Postgres config
kubectl --context oeol -n moodle-ing get secret postgres -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > postgres.env

# Redis config
kubectl --context oeol -n moodle-ing get secret redis -o jsonpath="{.data['redis\.conf']}" | base64 -d > redis.conf
