#! /bin/bash
# ARGC and ARGV handling without $1 to make set -u happy
set -u; set -e
ARGV=("$@")
ARGC=("$#")
echo ARGC $ARGC
# show all args
echo ARGV ${ARGV[*]}
# show first arg
echo ONE ${ARGV[0]}
# shift argv
ARGV=("${ARGV[@]:1}")
# show new first arg
echo ONE ${ARGV[0]}
