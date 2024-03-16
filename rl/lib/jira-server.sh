#!/usr/bin/env bash

jira() {

  NAME=$1
  DESCRIPTION=$2
  RELEASED=false

  if [[ "$JIRA_API_TOKEN" != "" ]]; then
    CREDS="${CONFLUENCE_API_USER}:${JIRA_API_TOKEN}"
    AUTH_TYPE="Basic"
    ENCODED_AUTH=$(echo -n "$CREDS" | base64)
  else
    AUTH_TYPE="Bearer"
    ENCODED_AUTH="$JIRA_BEARER_TOKEN"
  fi

  read -r -d '' DATA <<-EOF
    {
      "archived": false,
      "description": "$DESCRIPTION",
      "name": "$NAME",
      "projectId": "$JIRA_PROJECT_ID",
      "released": "$RELEASED"
    }
EOF

  {
    RESPONSE=$(curl POST -s --location "${JIRA_API_URL}/version" \
      --header 'Accept: application/json' \
      --header 'Content-Type: application/json' \
      --header "Authorization: ${AUTH_TYPE} ${ENCODED_AUTH}" \
      --data "$DATA")

    # Extract the URL of the created version
    RELEASE_ID=$(echo "$RESPONSE" | jq -r '.id')
    URL="$JIRA_URL/projects/$JIRA_PROJECT_KEY/versions/$RELEASE_ID"
  } 2>/dev/null

  echo "Fix Version: $URL"

}

# Example usage:
# jira "Version Name" "Version Description"
