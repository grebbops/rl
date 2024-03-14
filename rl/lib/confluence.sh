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

  CREDS="${CONFLUENCE_API_USER}:${CONFLUENCE_API_TOKEN}"
  ENCODED_AUTH=$(echo -n "$CREDS" | base64)

  read -r -d '' DATA <<-EOF
      {
        "type": "long",
        "title": "$TITLE",
        "spaceId": "$CONFLUENCE_SPACE_ID",
        "body": {
            "storage": {
                "value": "$TRIMMED_HTML",
                "representation": "storage"
            }
        }
      }
EOF

  {
    RESPONSE=$(curl -X POST -i --location "${CONFLUENCE_API_URL}/pages" \
      --header 'Accept: application/json' \
      --header 'Content-Type: application/json' \
      --header "Authorization: Basic ${ENCODED_AUTH}" \
      --data "$DATA")

    # Extract the editui link using grep
    EDIT_LINK=$(echo "$RESPONSE" | grep -o '"editui":"/[^"]*"' | awk -F'"' '{print $4}')
    VIEW_LINK=$(echo "$RESPONSE" | grep -o '"webui":"/[^"]*"' | awk -F'"' '{print $4}')
    SHARE_LINK=$(echo "$RESPONSE" | grep -o '"tinyui":"/[^"]*"' | awk -F'"' '{print $4}')
  } 2>/dev/null

  echo "Edit wiki: ${CONFLUENCE_URL}${EDIT_LINK}"
  echo "View wiki: ${CONFLUENCE_URL}${VIEW_LINK}"
  echo "Share wiki: ${CONFLUENCE_URL}${SHARE_LINK}"

}

# Example usage:
# confluence "Page Title"
