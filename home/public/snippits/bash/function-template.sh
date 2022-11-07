# This is my bash function template.
#
# Usage:
#   source THISFILE

#   example		# print help
#   example --help      # print help
#   example foo         # run with one arg
#   example foo bar     # run with two args

source $HOME/lib/bash/bashutils.sh  # error,warning,...
# source my log functions or use echo
source ~/lib/bash/bashutils.sh || \
    alias info=echo && \
    alias warn=echo && \
    alias error=echo


ARGV=("$@")
ARGC=("$#")


function example() ( # function in subshell, own namespece.

    ARG1="${1:-NONE}"
    ARG2="${2:-NONE}"

    function usage ()  {

        message=${1:-""}

        cat <<EOF 1>&2
Usage: $0 [options] ARG1 [ARG2]

EXAMPLE does this..

-h| --help           print help text

ARG1                 This argument (required) does..
ARG2                 This argument (optional) does...

Examples:
  example thing1
  example thing1 thing2
  example --help
EOF


        if [[ "${message}" != "" ]]; then
           echo 2>&1
           error "${message}"
        fi
    }

    case $ARG1 in
        NONE)		usage "Missing ARG1" && return 1;;
        -d|--debug)	DEBUG=1 && shift;;
        -h|--help)	usage && return 1;;
    esac


    if [ "$ARG2" == "NONE" ]; then
       info "ARG2 not defined"
    else
        echo # do something with ARG2
    fi

    cmd="echo $ARG1 $ARG2"
    debug "command: ${cmd}" # export DEBUG=1 for debugging

    [[ -v DEBUG ]] && set -x

    echo args are $* || warn "something went wrong"

)
