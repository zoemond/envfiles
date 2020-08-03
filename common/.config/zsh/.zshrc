export PATH=/usr/local/bin/:$PATH
bindkey -e

export EDITOR='nvim'

# Ctrl+Dでログアウトしてしまうことを防ぐ
setopt IGNOREEOF 

# ビープ音を鳴らさないようにする
setopt no_beep

# 区切り文字を指定
autoload -Uz select-word-style
select-word-style default 
zstyle ':zle:*' word-chars ' /=;@:{}[]()<>,|.'
zstyle ':zle:*' word-style unspecified 

bindkey "^z" undo
bindkey "^y" redo
# alacrittyで単語単位のcaret移動ができるように
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# 別ファイルの設定をsource
dir=$(cd $(dirname $0); pwd)
source $dir/plugin/install.zsh
# findコマンドが"/"付きで実行されないので'/'をつける
for zshfile_path in $(find $dir'/' -type f -name '*.zsh' -not -name 'plugin.zsh')
# でもecho $zshfile_pathすると'/'は二重になる.why
do
    source $zshfile_path
done 

