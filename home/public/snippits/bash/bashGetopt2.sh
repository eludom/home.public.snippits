#! /bin/bash
# This is here as an example of doing getopt in bash without getopt

# Do a quick status (git branch -vv) on one or more git repos
#
# Usage: gitstat [-f|-s] dir [dir...]
#
# -f - Fetch first
# -s - Short Status

set -e;  set -u
ARGV=("$@")
ARGC=("$#")
#ARGV=("${ARGV[@]:1}") # shift ARGV
#ARGC=${#ARGV[@]} # get count

# Helper functions
PROG=`basename "$0" | tr -d '\n'`

function info()  { echo `date +%c` ${PROG}\: info: "$@" 1>&2; }
function warn()  { echo `date +%c` ${PROG}\: warning: "$@" 1>&2; }
function error() { echo `date +%c` ${PROG}\: error: "$@" 1>&2; }
function debug() { [[ -v DEBUG ]] && echo `date +%c` ${PROG}\: debug: "$@" 1>&2 || true ; }
function die()   { echo `date +%c` ${PROG}\: fatal: "$@" 1>&2 && exit 1; }


function usage() {
    debug "in ${FUNCNAME[0]}"

    if [[ "$#" -gt 0 ]]; then
        warn $@
    fi

    cat <<END 1>&2
Usage: PROG [options] [args]

   arguments
     arg1               describe arg1

   options

    Group 1

    -a|--abc            what does --abc do?

    Other

    -d|--debug         debug output
    -h|--help          print usage
    -v|--verbose       verbose output
END
    exit 1
}

fetch=false
status=false

function show_usage() {
    echo Usage: gitstat [-f] [-s] [dir[dir...]]
    exit 1
}

while [ "$ARGC" != "0" ];do
   case "${ARGV[0]}" in
        -h|--help)
          show_usage
          ;;
        -f|--fetch)
          fetch="true"
          ;;
        -s|--sleep)
          status="true"
          ;;
        *)
            if [[ "$1" =~ ^- ]]; then
                echo unknown flag $1
                show_usage
            else
                break
            fi
   esac
ARGV=("${ARGV[@]:1}") # shift ARGV
done

ARGC=$#

if [ "$ARGC" == "0" ]; then
    set -- `pwd` "$@" # add pwd if no args
fi

for i in $* ; do

    if [ "$i" == "-f" ]; then
        fetch=true
        continue
    fi

    if [ "$i" == "-s" ]; then
        status=true
        continue
    fi

    if [ "$fetch" == "true" ]; then
        git fetch
    fi

    \pushd $i > /dev/null;
    echo $i;

    if [ "$status" == "true" ]; then
        git status -s
    else
        git branch -vv;
    fi
    echo;
    \popd > /dev/null;
done
