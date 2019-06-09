set PATH ~/.local/bin ~/Library/Android/sdk/platform-tools $PATH 
set -x LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
set -x EDITOR nvim

abbr vi "nvim"
abbr rm "rmtrash"
abbr ls "ls -aG"
abbr ll "ls -l"

set variable (dirname ( status --current-filename ))
for f in (find $variable/myconf/* -type f -name '*.fish')
  . $f
end

set -g fish_user_paths "/usr/local/opt/maven@3.3/bin" $fish_user_paths
