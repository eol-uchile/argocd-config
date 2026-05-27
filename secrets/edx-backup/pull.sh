#!/usr/bin/env bash
set -e

# eol-c
kubectl --context eol -n edx-backup get secret common-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > common.env
kubectl --context eol -n edx-backup get secret virtuallabx-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > virtuallabx-config.env

# oeol-c
kubectl --context oeol -n edx-backup get secret openuchile-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > openuchile-config.env
kubectl --context oeol -n edx-backup get secret eol-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > eol-config.env
kubectl --context oeol -n edx-backup get secret common-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > oeol-common.env
kubectl --context oeol -n edx-backup get secret umce-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > umce-config.env
kubectl --context oeol -n edx-backup get secret redfid-config -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > redfid-config.env
