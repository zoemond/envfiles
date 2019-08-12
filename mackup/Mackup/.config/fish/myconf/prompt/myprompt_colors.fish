set -l bg           282a36
set -l fg           f8f8f2

set -l green        50fa7b
set -l red          ff5555
set -l yellow       f1fa8c
set -l sea_black       16374c
set -l sea_black_bold  434c53

set -x myprompt_color_bg 282a36
set -x myprompt_color_fg f8f8f2

# pwd
set -x myprompt_color_bg_pwd $sea_black
set -x myprompt_color_fg_pwd $fg

# git
set -x myprompt_color_bg_repo $sea_black_bold
set -x myprompt_color_fg_repo $fg
set -x myprompt_color_bg_staged $green
set -x myprompt_color_fg_staged $bg
set -x myprompt_color_bg_dirty $red
set -x myprompt_color_fg_dirty $bg
set -x myprompt_color_bg_untracked $yellow
set -x myprompt_color_fg_untracked $bg
set -x myprompt_color_bg_invalid $red
set -x myprompt_color_fg_invalid $bg

