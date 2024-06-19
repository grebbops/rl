# release-tools<!-- omit from toc -->

`rl` is a command line utility with various helpers for working with releases and Application Lifecycle Management (ALM) APIs.

- [Installation](#installation)
  - [Requirements](#requirements)
  - [Installation Steps](#installation-steps)
- [`rl` Features](#rl-features)
  - [Atlassian Jira API Helpers](#atlassian-jira-api-helpers)
  - [Broadcom Rally API Helpers](#broadcom-rally-api-helpers)
  - [Atlassian Confluence API Helpers](#atlassian-confluence-api-helpers)
  - [Teams Announcement Generation](#teams-announcement-generation)
  - [GitHub Actions](#github-actions)
  - [Data Manipulation](#data-manipulation)
- [Contributing](#contributing)
  - [Development Requirements](#development-requirements)

# Installation

## Requirements

- `jq`: [Read more](https://jqlang.github.io/jq/)
- `python` and [`python-dateutil`](https://pypi.org/project/python-dateutil/)
- a `bash` flavored shell: Windows users can use [Git Bash](https://www.atlassian.com/git/tutorials/git-bash)
  - also consider [enabling `sudo` for Windows](https://devblogs.microsoft.com/commandline/introducing-sudo-for-windows/)

## Installation Steps

- clone the repo
- `cd release-tools/rl/bin`
- `sudo ln -fs $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/rl /usr/local/bin/rl`
  - note: for Windows users, the `cp` command should be used, with variation in the path: 
  - `cp -s $( cd "$( dirname "$0" )" && pwd -W )/rl /c/Users/<username>/bin/rl`
- reload shell
- test `rl` with no args:

```shell
❯ rl

   /\
  (  )
  (  )
 /|/\|\
/_||||_\

```

Your mileage may vary — check paths and system nuances. Windows and macOS have variations of standard *nix commands, and the Windows filesystem and paths are tricky.

You could also just add this to path via `~/.bashrc`, `~/.bash_profile`, `~/.zshrc`, etc.

- add this line `export PATH="/c/Users/<username>/path/to/repo/rl/bin:$PATH"`
- or this line `export PATH="/path/to/repo/rl/bin:$PATH"`

**GLHF**

# `rl` Features

## Atlassian Jira API Helpers

Release Creation and API Helpers for release notes.

- [ ] Release Creation with Prompts for Inputs

## Broadcom Rally API Helpers

- [ ] Timebox and Release Tag Creation

## Atlassian Confluence API Helpers 

For working with release pages and sourcing content from Atlassian Jira.

- [ ] Fast page creation for ab-hoc release requests
- [ ] Release Calendar event management and creation

## Teams Announcement Generation

Various scripts to output and copy announcment templates with variable-replaced details based on input.

- [ ] Generation of responses to requests for releases

## GitHub Actions

- [ ] Teams Release Announcements
- [ ] Release Creation in Atlassian Jira
- [ ] Release Wiki Creation in Atlassian Confluence

## Data Manipulation

Tools for working with lists of user stories, defects, issues, sub-tasks, etc.

- [ ] Broadcom Rally User Story and Defect Content CRUD
  - [ ] Reading US data and building CSVs for Data Reporting and Spreadsheet Tools
  - [ ] Reading US data and building Release Wikis

# Contributing

## Development Requirements
