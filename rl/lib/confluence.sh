#!/usr/bin/env bash

confluence() {

  MARKED=$LIB/node_modules/marked/bin/marked.js
  PAGE_MARKDOWN_SOURCE=$LIB/confluence/release-page-template.md

  TITLE=$1
  if [[ "$2" != "" ]]; then
    # if passing in a markdown file
    # TODO: also allow stdin
    PAGE_MARKDOWN_SOURCE=$2
  fi
  PAGE_BODY="$(cat $PAGE_MARKDOWN_SOURCE | node $MARKED)"
  # --silent when testing complete

  TRIMMED_HTML=$(echo "$PAGE_BODY" | tr -d '\n')

  CREDS="${CONFLUENCE_API_USER}:${CONFLUENCE_API_TOKEN}"
  ENCODED_AUTH=$(echo -n "$CREDS" | base64)

  read -r -d '' DATA <<-EOF
      {
        "type": "page",
        "title": "$TITLE",
        "space": {
            "key": "$CONFLUENCE_SPACE_KEY"
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

  {
    RESPONSE=$(curl -X POST -s --location "${CONFLUENCE_API_URL}/content" \
      --header 'Accept: application/json' \
      --header 'Content-Type: application/json' \
      --header "Authorization: Bearer ${CONFLUENCE_API_TOKEN}" \
      --data "$DATA")

    # Extract the editui link using grep
    PAGE_ID=$(echo "$RESPONSE" | jq -r '.id')
    VIEW_LINK=$(echo "$RESPONSE" | jq -r '._links.webui')
    SHARE_LINK=$(echo "$RESPONSE" | jq -r '._links.tinyui')
  } 2>/dev/null

  echo "Edit page: https://etwiki.sys.comcast.net/pages/editpage.action?pageId=${PAGE_ID}"
  echo "View page: ${CONFLUENCE_URL}${VIEW_LINK}"
  echo "Share page: ${CONFLUENCE_URL}${SHARE_LINK}"

}

# Example usage:
# confluence "Page Title"
