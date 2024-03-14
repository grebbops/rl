# #!/usr/bin/env bash

# # {
# JIRA_PROJECT_KEY_RESPONSE=$(curl \
#   --location "$JIRA_API_URL/project/$JIRA_PROJECT_KEY" \
#   --header 'Accept: application/json' \
#   --header 'Content-Type: application/json' \
#   --header "Authorization: Basic $JIRA_API_TOKEN")

# echo "$JIRA_PROJECT_KEY_RESPONSE"

# NAME="${JIRA_PROJECT_KEY}-${JIRA_VERSION_IDENTIFIER}"
# DESCRIPTION=$JIRA_VERSION_DESCRIPTION
# RELEASED=$JIRA_VERSION_RELEASED
# JIRA_PROJECT_ID=$(echo "$JIRA_PROJECT_KEY_RESPONSE" | jq '.id')
# # } 2>/dev/null

# echo "-------------------------------- logs"
# echo "$JIRA_PROJECT_ID"

# # {
# RESPONSE=$(curl \
#   POST -i --location "$JIRA_API_URL/version" \
#   --header 'Accept: application/json' \
#   --header 'Content-Type: application/json' \
#   --header "Authorization: Basic $JIRA_API_TOKEN" \
#   --json {
#       "archived": false,
#       "description": "$DESCRIPTION",
#       "name": "$NAME",
#       "projectId": "$JIRA_PROJECT_ID",
#       "released": "$RELEASED"
#     })

# # Extract the URL of the created version
# # RELEASE_ID=$(echo "$RESPONSE" | grep -o '"id": *"[^"]*' | awk -F'"' '{print $4}')
# # } 2>/dev/null

# echo "$RESPONSE"

# # URL="$JIRA_URL/projects/$JIRA_PROJECT_ID/versions/$RELEASE_ID"

# # echo "# Fix Version Details" >>$GITHUB_SUMMARY
# # echo "## [$NAME]($URL)" >>$GITHUB_SUMMARY
# # echo "$DESCRIPTION" >>$GITHUB_SUMMARY
