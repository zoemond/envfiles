# -----------------------------
# Prompt
# -----------------------------

# %M    ホスト名
# %m    ホスト名
# %d    カレントディレクトリ(フルパス)
# %~    カレントディレクトリ(フルパス2)
# %C    カレントディレクトリ(相対パス)
# %c    カレントディレクトリ(相対パス)
# %n    ユーザ名
# %#    ユーザ種別
# %?    直前のコマンドの戻り値
# %D    日付(yy-mm-dd)
# %W    日付(yy/mm/dd)
# %w    日付(day dd)
# %*    時間(hh:flag_mm:ss)
# %T    時間(hh:mm)
# %t    時間(hh:mm(am/pm))
PROMPT="%K{white}%F{233}%T%{${reset_color}%}%K{reset_color} "

RPROMPT="%K{245}%{${fg[233]}%}[%~]%{${reset_color}%}%K{reset_color}" 
# -----------------------------
# for git
# ----------------------------- 
autoload -Uz vcs_info
## %b ブランチ情報
## %a アクション名(mergeなど)
## %c changes
## %u uncommit 
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'%K{245}${vcs_info_msg_0_}%{${reset_color}%}' 
