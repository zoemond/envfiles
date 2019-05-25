set -l bg           282a36
set -l current_line 44475a
set -l selection    44475a
set -l fg           f8f8f2
set -l comment      6272a4
set -l cyan         8be9fd
set -l green        50fa7b
set -l orange       ffb86c
set -l pink         ff79c6
set -l purple       bd93f9
set -l red          ff5555
set -l yellow       f1fa8c

set -x myprompt_color_bg 282a36
set -x myprompt_color_fg f8f8f2

# git
set -x myprompt_color_bg_repo $selection
set -x myprompt_color_fg_repo $fg
set -x myprompt_color_bg_staged $green
set -x myprompt_color_fg_staged $bg
set -x myprompt_color_bg_dirty $red
set -x myprompt_color_fg_dirty $bg
set -x myprompt_color_bg_untracked $yellow
set -x myprompt_color_fg_untracked $bg
set -x myprompt_color_bg_invalid $red
set -x myprompt_color_fg_invalid $bg

