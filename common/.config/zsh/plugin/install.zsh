### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# https://github.com/zdharma/fast-syntax-highlighting#zinit
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
   zdharma/fast-syntax-highlighting \
 atload"!_zsh_autosuggest_start" \
   zsh-users/zsh-autosuggestions

zinit light "zsh-users/zsh-history-substring-search"
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

zinit ice proto'git' pick'init.sh'
zinit light "b4b4r07/enhancd"

zinit light "momo-lab/zsh-abbrev-alias"

zinit ice depth=1; zinit light romkatv/powerlevel10k

# Install zsh-gomi(fzf required)
zinit ice wait'!0'; zinit light b4b4r07/zsh-gomi
