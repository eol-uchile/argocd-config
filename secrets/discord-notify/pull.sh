#!/usr/bin/env bash
set -e

# configs
kubectl --context oeol -n ing-utils get secret discord-webhook -o jsonpath="{.data['WEBHOOK_URL']}" | base64 -d > discord_webhook
