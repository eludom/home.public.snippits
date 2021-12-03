function set_xtitle {
    # set X window title
    #
    # Usage:
    #
    #   set_xtitle [name]
    WINDOW_NAME="${1:-`basename $PWD`}"
    PROMPT_COMMAND="echo -ne \"\033]0;${WINDOW_NAME} $USER@$HOSTNAME:$PWD\007\"";
}


export PROMPT_COMMAND="history -a; history -c; history -r; set_xtitle"
