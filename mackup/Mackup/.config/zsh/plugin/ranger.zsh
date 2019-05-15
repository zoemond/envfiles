 # rangerの多重起動を避ける 
ranger() { [ -n "$RANGER_LEVEL" ] && exit || LESS="$LESS -+F -+X" command ranger "$@"; }

# 多重起動中はpromptに(RANGER)だす
[ -n "$RANGER_LEVEL" ] && PS1="(RANGER) $PS1" 

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/local/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi  
    rm -f -- "$tempfile"
}

#ranger-cd will fire for Ctrl+O
bindkey -s '^O' 'ranger-cd\n'


