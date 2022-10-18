# include my helper funcs or define simple versions inline
if [ -f $HOME/lib/bash/bashutils.sh ]; then
    source $HOME/lib/bash/bashutils.sh
else
    function info()  { echo `date +%c` \: info: "$@" 1>&2; }
    function warn()  { echo `date +%c` \: warning: "$@" 1>&2; }
    function error() { echo `date +%c` \: error: "$@" 1>&2; }
    function debug() { [[ -v DEBUG ]] && echo `date +%c` \: debug: "$@" 1>&2 || true ; }
    function die()   { echo `date +%c` \: fatal: "$@" 1>&2 && exit 1; }
fi
