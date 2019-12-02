set PATH /Users/shinichikoki/Library/Android/sdk/platform-tools $PATH 
set -x LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
set -x EDITOR nvim

abbr vi "nvim"
abbr rm "trash-put"
abbr ls "ls -aG"
abbr ll "ls -l"

set variable (dirname ( status --current-filename ))
for f in (find $variable/myconf/* -type f -name '*.fish')
  . $f
end

