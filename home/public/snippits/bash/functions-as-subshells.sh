# https://cuddly-octo-palm-tree.com/posts/2021-10-31-better-bash-functions/
f() (
    # code
    var1=${1:-"default"}

    
    if [ "${var1}" == "default" ]; then
        echo errors and warning messages to stderr 1>&2
        return 1 # error, outut undefined
    fi

    echo "stirng value to stdout"
    return 0 # success, output defined
)


return=`f` && echo SUCCESS return value is $return  || echo FAILURE no return
echo

return=`f FOO` && echo SUCCESS return value is $return  || echo FAILURE no return
echo


