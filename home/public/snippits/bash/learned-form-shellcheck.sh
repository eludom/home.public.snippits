#! /bin/bash
# Examples of fixing problems ponted out by shellcheck


# These are things learned from running shellcheck on my bash
# https://github.com/koalaman/shellcheck

# https://www.shellcheck.net/wiki/Directive

# Principals:
#   - Favor readability (e.g. over POSIX compliance)
#   - Don't define anything when a built-in works
#   - Use any automathic type/variable/safety/syntax check availabe

# Favor readability over POSIX compliance
#
#   shellcheck disable=SC3046 # "source" is more readable than "."
#   shellcheck disable=SC2112 # "function" is more readable than "()"

# This is bash, be safe
set -u
set -e

# BAD, old
# source ~/lib/bash/bashutils.sh || `: # Use my library if available`\
#     `: fall back to echo`
#     alias info=echo && \
#     alias warn=echo && \
#     alias error=echo
#
# GOOD, new, fixed
# shellcheck disable=SC1090  # Clean up seperatly
source ~/lib/bash/bashutils.sh || : Use my library if available \
    : else fall back to echo && \
    function info() { echo "$@"; } && \
    function warn() { echo "$@"; } && \
    function error() { echo "$@"; } && \
    function announce() { echo "$@"; }

announce defined alternatives
