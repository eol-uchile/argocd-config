#!/usr/bin/env bash

kubectl config use-context eol
export EDX_NAMESPACE=graylog

kubectl -n $EDX_NAMESPACE create secret generic graylog --dry-run=client --from-env-file=./graylog.env -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../secrets/graylog/graylog.yaml
kubectl -n $EDX_NAMESPACE create secret generic graylog-ca --dry-run=client --from-file=client.cert=./client.cert --from-file=server.cert=./server.cert --from-file=server.key=./server.key -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../graylog/secrets/graylog-ca.yaml
kubectl -n $EDX_NAMESPACE create secret generic vector-cert --dry-run=client --from-file=client.cert=./client.cert --from-file=server.cert=./server.cert --from-file=client.key=./client.key -o yaml | kubeseal --controller-namespace sealed-secrets -o yaml > ../../graylog/secrets/vector-cert.yaml
