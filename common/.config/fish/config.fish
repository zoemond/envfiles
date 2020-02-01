set -x LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
set -x EDITOR nvim

abbr vi "nvim"
abbr rm "trash-put"
abbr ls "ls -aG"
abbr ll "ls -lh"

set variable (dirname ( status --current-filename ))
for f in (find $variable/myconf/* -type f -name '*.fish')
  . $f
end

