# Some error handling functions

SCRIPTNAME=`echo "$0"|sed 's!.*/!!'`
function info()  { echo `date +%c` "${SCRIPTNAME}"\: info: "$@" 1>&2; }
function warn()  { echo `date +%c` "${SCRIPTNAME}"\: warning: "$@" 1>&2; }
function error() { echo `date +%c` "${SCRIPTNAME}"\: error: "$@" 1>&2; }
# Temporary debug messages
#   DEBUG=1 debug foo
function debug() { [[ -v DEBUG ]] && echo `date +%c` "${SCRIPTNAME}"\: debug: "$@" 1>&2 || true ; }
function die()   {

    exit_code=1
    if [[ -v 2 ]]; then
       exit_code="${1}"
       shift;
    fi

    echo `date +%c` "${SCRIPTNAME}"\: fatal: "$@" 1>&2 && exit "${exit_code}";
}
