#!/usr/bin/env bash

source $RLPATH/../.config/.env

curl --location $TEAMS_WEBHOOK \
  --header 'Content-Type: application/json' \
  --data-raw '{
  "@type": "MessageCard",
  "@context": "http://schema.org/extensions",
  "themeColor": "0076D7",
  "summary": "New Release Wiki Added",
  "sections": [
    {
      "activityTitle": "New Release Wiki Added",
      "activitySubtitle": "For: Team Release Management",
      "activityImage": "https://i.ibb.co/qp6xSY3/product-release.png",
      "facts": [
        {
          "name": "Assigned to",
          "value": "Unassigned"
        },
        {
          "name": "Due date",
          "value": "Mon Sep 25 2023 17:07:18 ET-0500 (Eastern Standard Time)"
        },
        {
          "name": "Status",
          "value": "Not started"
        }
      ],
      "markdown": true
    }
  ],
  "potentialAction": [
    {
      "@type": "ActionCard",
      "name": "Add a comment",
      "inputs": [
        {
          "@type": "TextInput",
          "id": "comment",
          "isMultiline": false,
          "title": "Add a comment here for this task"
        }
      ],
      "actions": [
        {
          "@type": "HttpPOST",
          "name": "Add comment",
          "target": "https://learn.microsoft.com/outlook/actionable-messages"
        }
      ]
    },
    {
      "@type": "ActionCard",
      "name": "Set due date",
      "inputs": [
        {
          "@type": "DateInput",
          "id": "dueDate",
          "title": "Enter a due date for this task"
        }
      ],
      "actions": [
        {
          "@type": "HttpPOST",
          "name": "Save",
          "target": "https://learn.microsoft.com/outlook/actionable-messages"
        }
      ]
    },
    {
      "@type": "OpenUri",
      "name": "Learn More",
      "targets": [
        {
          "os": "default",
          "uri": "https://learn.microsoft.com/outlook/actionable-messages"
        }
      ]
    },
    {
      "@type": "ActionCard",
      "name": "Change status",
      "inputs": [
        {
          "@type": "MultichoiceInput",
          "id": "list",
          "title": "Select a status",
          "isMultiSelect": "false",
          "choices": [
            {
              "display": "In Progress",
              "value": "1"
            },
            {
              "display": "Active",
              "value": "2"
            },
            {
              "display": "Closed",
              "value": "3"
            }
          ]
        }
      ],
      "actions": [
        {
          "@type": "HttpPOST",
          "name": "Save",
          "target": "https://learn.microsoft.com/outlook/actionable-messages"
        }
      ]
    }
  ]
}
'
