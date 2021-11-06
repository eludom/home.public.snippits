#! /bin/bash
# Wrapper to find.  Case-insensitive match on substring of path.
#
# Usage: f NAME [other-find-args]

# make sure we hvae a debug function
debug is defined  2>/dev/null || function debug() { [[ -v DEBUG ]] && >&2 echo $*; }

function f() {
  NAME=$1
  shift
  REST=($*)

  debug COMMAND find . -ipath '*'"${NAME}"'*' ${REST[*]}

  find . -ipath '*'"${NAME}"'*' ${REST[*]}
}
