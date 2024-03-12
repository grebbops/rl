#!/usr/bin/env

source $LIB/helpers/_colors.sh

function confluence() {
  "$LIB/confluence/$1.sh"
}

function pages() {
  $LIB/confluence/$FUNCNAME.sh $2
}
