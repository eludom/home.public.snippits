# https://cuddly-octo-palm-tree.com/posts/2021-10-31-better-bash-functions/
f() (
    # code
    var1=${1:-"default value"}

    # Always return numeric status (that's all bash supports)
    #
    # 0 == succuess
    # other == failure

    echo errors and warning messages to stderr 1>&2

    echo "string return value to stdout - var1 is $var1"
    return 1 
)


f
echo

f foo
echo

f bar
echo

