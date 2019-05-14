# rangerの多重起動を避ける 
ranger() { [ -n "$RANGER_LEVEL" ] && exit || LESS="$LESS -+F -+X" command ranger "$@"; }
[ -n "$RANGER_LEVEL" ] && PS1="(RANGER) $PS1" 

# -----------------------------
# ZPLUG
# -----------------------------

## defer: 読み込み順序を設定する
# 例: "zsh-syntax-highlighting" は compinit の後に読み込まれる必要がある
# zplug "zsh-users/zsh-syntax-highlighting", defer:2 
# （2 以上は compinit 後に読み込まれるようになる）
#####

# zplugが無ければインストール 
if [[ ! -d ~/.zplug ]];then 
  echo 'zplug is not installed. install'
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

# zplugを有効化する
source ~/.zplug/init.zsh 

zplug "zsh-users/zsh-autosuggestions" 

zplug "zsh-users/zsh-syntax-highlighting", defer:2 

zplug "zsh-users/zsh-history-substring-search" 
if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi

zplug "b4b4r07/enhancd", use:init.sh

zplug "momo-lab/zsh-abbrev-alias" 

# -----------------------------
# インストールしていないプラグインをインストール 
# -----------------------------
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
      echo; zplug install
  fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

