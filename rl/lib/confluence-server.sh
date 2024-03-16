#!/usr/bin/env bash

confluence() {

  MARKED=$LIB/node_modules/marked/bin/marked.js
  WIKI_MARKDOWN_SOURCE=$LIB/confluence/release-wiki-template.md

  TITLE=$1
  if [[ "$2" != "" ]]; then
    # if passing in a markdown file
    # TODO: also allow stdin
    WIKI_MARKDOWN_SOURCE=$2
  fi
  PAGE_BODY="$(cat $WIKI_MARKDOWN_SOURCE | node $MARKED)"
  # --silent when testing complete

  TRIMMED_HTML=$(echo "$PAGE_BODY" | tr -d '\n')

  if [[ "$CONFLUENCE_API_TOKEN" != "" ]]; then
    CREDS="${CONFLUENCE_API_USER}:${CONFLUENCE_API_TOKEN}"
    AUTH_TYPE="Basic"
    ENCODED_AUTH=$(echo -n "$CREDS" | base64)
  else
    AUTH_TYPE="Bearer"
    ENCODED_AUTH="$CONFLUENCE_BEARER_TOKEN"
  fi

  read -r -d '' DATA <<-EOF
      {
        "type": "page",
        "title": "$TITLE",
        "spaceId": "$CONFLUENCE_SPACE_ID",
        "space": {
            "key": "RLM"
        },
        "body": {
            "storage": {
                "value": "$TRIMMED_HTML",
                "representation": "storage"
            }
        },
        "ancestors": [
            {
                "id": "1283555841"
            }
        ]
      }
EOF

  # {
  RESPONSE=$(curl POST -s --location "${CONFLUENCE_API_URL}/content/" \
    --header 'Accept: application/json' \
    --header 'Content-Type: application/json' \
    --header "Authorization: ${AUTH_TYPE} ${ENCODED_AUTH}" \
    --data "$DATA")

  # Extract the editui link using grep

  EDIT_LINK=$(echo "$RESPONSE" | jq -r '._links.edit')
  VIEW_LINK=$(echo "$RESPONSE" | jq -r '._links.webui')
  SHARE_LINK=$(echo "$RESPONSE" | jq -r '._links.tinyui')
  # } 2>/dev/null

  echo "Edit wiki: ${CONFLUENCE_URL}${EDIT_LINK}"
  echo "View wiki: ${CONFLUENCE_URL}${VIEW_LINK}"
  echo "Share wiki: ${CONFLUENCE_URL}${SHARE_LINK}"

}

# Example usage:
# confluence "Page Title"
