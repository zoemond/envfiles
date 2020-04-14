# %an: autor
# %C: 次の要素のみため(<color>, bold, reverseなど)指定
abbrev-alias glo='git log --graph --color=always --format="%C(magenta)%an% C(auto)%h%d %s %C(black)%C(bold)%cr"'

# @see ANSI Escape Code: https://en.wikipedia.org/wiki/ANSI_escape_code
# char: meaning
# ----:--------------------
# x1b : Escape sequence  (27 / hex 0x1B / oct 033)
# [   : CSI(Control Sequence Introduce)
# 0-9 : SGR(Select Graphic Rendition) parameters
# m   : Select Graphic Rendition
REMOVE_COLOR_SEQUENCES='s/\x1b\[[0-9;]*m//g'

function git-log-hash() {
  glo $* | fzy | cut -f 3 -d ' ' | gsed $REMOVE_COLOR_SEQUENCES
}


