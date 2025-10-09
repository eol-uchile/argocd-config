#!/usr/bin/env bash

kubectl --context oeol -n ing-utils create secret generic discord-webhook --dry-run=client --from-file=WEBHOOK_URL=./discord_webhook -o yaml | kubeseal --context oeol --scope cluster-wide --controller-namespace sealed-secrets -o yaml > ../../discord-notify/secrets/discord-webhook.yaml
