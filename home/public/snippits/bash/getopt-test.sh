#! /bin/bash
# getopts test

# https://www.computerhope.com/unix/bash/getopts.htm

while getopts :foo OPT; do
    case $OPT in
        f|+f)
            echo $OPT
            echo $ARGS
            ;;
        o|+o)

            ;;
        o|+o)
            
            ;;
        *)
            echo "usage: `basename $0` [+-foo} [--] ARGS..."
            exit 2
    esac
done
shift `expr $OPTIND - 1`
OPTIND=1

echo ARGS $*
