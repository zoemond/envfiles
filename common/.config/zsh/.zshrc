if [ "$(expr substr $(uname -s) 1 5)" != 'Linux' ]; then
  # Linuxじゃないとき通ってないパス
  export PATH=/usr/local/bin/:$PATH
  export PATH=~/.local/bin:$PATH
else
  # Linuxのとき
  export BROWSER="google-chrome-stable"
fi


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

## Keybindings section
bindkey -e
bindkey "^z" undo
bindkey "^y" redo

# Ctrl+Backspaceで単語削除ができるようにします。Ctrl+Hでも削除するようになります
bindkey '^H' backward-kill-word

# alacrittyで単語単位のcaret移動ができるように
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #


# 別ファイルの設定をsource
dir=$(cd $(dirname $0); pwd)
source $dir/plugin/install.zsh
# findコマンドが"/"付きで実行されないので'/'をつける
for zshfile_path in $(find $dir'/' -type f -name '*.zsh' -not -name 'install.zsh')
# でもecho $zshfile_pathすると'/'は二重になる.why
do
    source $zshfile_path
done

