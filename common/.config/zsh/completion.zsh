
# 入力したコマンドが存在しない場合、スペルの似ているものがあれば候補として出す
setopt correct

# optionなどのmanualを出してくれる
# 適当に打ったら適当に補完してくれたり(ちょっとウザい)
# zstyle ':completion:が有効になる
autoload -Uz compinit
compinit

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# 大文字・小文字を区別しない(大文字を入力した場合は区別する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# --prefix=/usr などの = 以降でも補完
setopt magic_equal_subst
