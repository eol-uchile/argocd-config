#!/usr/bin/env bash
set -e

kubectl config use-context eol
export EDX_NAMESPACE=graylog

# configs
kubectl -n $EDX_NAMESPACE get secret graylog -o json | jq -r '.data | keys[] as $k | "\($k)=\(.[$k] | @base64d)"' > graylog.env

kubectl -n $EDX_NAMESPACE get secret graylog-ca -o jsonpath="{.data['client\.cert']}" | base64 -d > client.cert
kubectl -n $EDX_NAMESPACE get secret graylog-ca -o jsonpath="{.data['server\.cert']}" | base64 -d > server.cert
kubectl -n $EDX_NAMESPACE get secret graylog-ca -o jsonpath="{.data['server\.key']}" | base64 -d > server.key

kubectl -n $EDX_NAMESPACE get secret vector-cert -o jsonpath="{.data['client\.key']}" | base64 -d > client.key
