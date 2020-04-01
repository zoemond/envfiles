 # rangerの多重起動を避ける 
ranger() { [ -n "$RANGER_LEVEL" ] && exit || LESS="$LESS -+F -+X" command ranger "$@"; }

# 多重起動中はpromptに(RANGER)だす
[ -n "$RANGER_LEVEL" ] && PS1="(RANGER) $PS1" 

# https://github.com/ranger/ranger/wiki/Integration-with-other-programs
# > if you want to change the dir on demand after you exit ranger, by the following wrapper function.
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        command cd "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

#ranger-cd will fire for Ctrl+O
bindkey -s '^O' 'ranger\n'


