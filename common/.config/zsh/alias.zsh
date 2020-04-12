abbrev-alias -g G='| grep'
abbrev-alias -g F='| fzf'

abbrev-alias vi="nvim"
abbrev-alias rm="rmtrash"

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    abbrev-alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    abbrev-alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    abbrev-alias -g C='| putclip'
fi
