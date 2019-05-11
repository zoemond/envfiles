bindkey -e

# Ctrl+Dでログアウトしてしまうことを防ぐ
setopt IGNOREEOF


# ビープ音を鳴らさないようにする
setopt no_beep

# 区切り文字を指定
autoload -Uz select-word-style
select-word-style default 
zstyle ':zle:*' word-chars ' /=;@:{}[]()<>,|.'
zstyle ':zle:*' word-style unspecified 

dir=$(cd $(dirname $0); pwd) 
for zshfile_path in $(find $dir -type f -name '*.zsh')
do
    source "$zshfile_path"
done

# source $dir/alias.zsh
# source $dir/git/alias.zsh
# source $dir/prompt.zsh
# source $dir/completion.zsh 
# source $dir/color.zsh
# source $dir/history.zsh
