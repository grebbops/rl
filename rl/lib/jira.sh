#!/usr/bin/env bash

jira() {

  NAME=$1
  DESCRIPTION=$2
  RELEASED=false

  CREDS="${JIRA_API_USER}:${JIRA_API_TOKEN}"
  ENCODED_AUTH=$(echo -n "$CREDS" | base64)

  read -r -d '' DATA <<-EOF
    {
      "archived": false,
      "description": "$DESCRIPTION",
      "name": "$NAME",
      "projectId": "$JIRA_PROJECT_ID",
      "released": "$RELEASED"
    }
EOF

  response=$(curl -X POST -i --location "${JIRA_API_URL}/version" \
    --header 'Accept: application/json' \
    --header 'Content-Type: application/json' \
    --header "Authorization: Basic ${ENCODED_AUTH}" \
    --data "$DATA")

  # Extract the URL of the created version
  RELEASE_ID=$(echo "$response" | grep -o '"id": *"[^"]*' | awk -F'"' '{print $4}')
  URL="$JIRA_URL/projects/$JIRA_PROJECT_ID/versions/$RELEASE_ID"

  echo "Take a look: $URL"

}

# Example usage:
# jira "Version Name" "Version Description"
