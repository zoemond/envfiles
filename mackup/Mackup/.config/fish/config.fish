set PATH /Users/shinichikoki/Library/Android/sdk/platform-tools $PATH 
set -x LSCOLORS gxfxbEaEBxxEhEhBaDaCaD

alias vi="nvim"
alias rm="rmtrash"
alias ls="ls -a"
alias ll="ls -l"

set variable (dirname ( status --current-filename ))
for f in (find $variable/myconf/* -type f -name '*.fish')
  . $f
end

