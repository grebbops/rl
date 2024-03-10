#!/usr/bin/env bash

source $LIB/helpers/_colors.sh

jira() {
  "$1.sh"
}

releases() {
  $LIB/jira/$FUNCNAME.sh $2
}
