#!/usr/bin/env bash
source $RLPATH/../.config/.env

curl --location "$CONFLUENCE_API_URL/wiki/api/v2/pages?space-id=$CONFLUENCE_SPACE_ID" \
  --header 'Accept: application/json' \
  --header "Authorization: Basic $CONFLUENCE_API_TOKEN"
