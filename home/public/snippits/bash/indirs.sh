#! /bin/bash


source $HOME/lib/bash/bashutils.sh  # error,warning,...

indirs ()
# return "true" if there is a directory in the stack that contains "$1"
(
    
    CONTAINS="${1:-NONE}"

    if [ "$CONTAINS" == "NONE" ]; then
        warn "no directory name given for indirs"
        return $FALSE
    fi
    
    for d in `dirs`;
    do
        if [[ "$d" == *"${CONTAINS}"* ]]; then
            return $TRUE
        fi
    done

    info ${CONTAINS} not found in dirs
    return $FALSE
)

p2 ()
# pop to (p2) a directory in the directory stack that contains P2THIS
{
    
    P2THIS="${1:-NONE}"

    if [ "$P2THIS" == "NONE" ]; then
        warn "no directory name given for p2"
        return $FALSE
    fi

    if indirs $P2THIS; then

        # pop until $PWD ends with $P2THIS
        while true;
        do
            if [[ "$PWD" == *"${P2THIS}"* ]]; then
                dirs
                return $TRUE
            else
                popd 1> /dev/null || return $FALSE
            fi
        done

    else
        echo $INDIRS not found in `dirs`
    fi
}

