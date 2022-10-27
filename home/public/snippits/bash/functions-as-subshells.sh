# https://cuddly-octo-palm-tree.com/posts/2021-10-31-better-bash-functions/
f() (
    # code
    var1=${1:-"default"}

    
    if [ "${var1}" == "default" ]; then
        #echo errors and warning messages to stderr 1>&2
        return 1 # error, outut undefined
    fi

    echo "StirngValueOnSTDOUT"
    return 0 # success, output defined
)


return=`f` && echo SUCCESS return value is $return  || echo FAILURE no return
echo

return=`f FOO` && echo SUCCESS return value is $return  || echo FAILURE no return
echo

if retval=f; then
    echo f with no argument succeeded
else
    echo f with no argument failed
fi

if retval=`f BAR`; then
    echo f with an argument succeeded and retval is $retval
else
    echo f with an argument failed
fi

if f BAR; then
    echo f with an argument succeeded, ignoring retval
else
    echo f with an argument failed
fi
