#!/usr/bin/env
curl --location 'https://api.atlassian.com/oauth/token/accessible-resources' \
  --header "Authorization: Basic $JIRA_API_TOKEN"
--header 'Accept: application/json'
