
# prompt_pwdをフルパスで表示
# set -x fish_prompt_pwd_dir_length 0
# 
# function fish_right_prompt 
#   set -l prefix_git ' '
# 
#   set -g __fish_git_prompt_show_informative_status 1
#   set -g __fish_git_prompt_showupstream "informative"
#   set -g __fish_git_prompt_showdirtystate "yes"
# 
#   set -g __fish_git_prompt_color_branch -b "$myprompt_color_bg_repo" 
#   set -g __fish_git_prompt_color_stagedstate -b "$myprompt_color_bg_staged" "$myprompt_color_fg_staged"
#   set -g __fish_git_prompt_color_invalidstate -b "$myprompt_color_bg_invalid" "$myprompt_color_fg_invalid"
#   set -g __fish_git_prompt_color_dirtystate -b "$myprompt_color_bg_dirty" "$myprompt_color_fg_dirty"
#   set -g __fish_git_prompt_color_untrackedfiles -b "$myprompt_color_bg_untracked" "$myprompt_color_fg_untracked"
# 
#   set -g ___fish_git_prompt_char_stateseparator ''
#   set -g ___fish_git_prompt_char_cleanstate ''
# 
#   # この辺みたりして設定する: https://github.com/ryanhugh/fish_config/blob/master/__fish_git_prompt.fi.backup#L459
#   printf '%s[%s]%s%s%s' \
#          (set_color -b "$myprompt_color_bg" "$myprompt_color_fg") (prompt_pwd) \
# 	 (set_color -b "$myprompt_color_bg_repo" "$myprompt_color_fg_repo") (__fish_git_prompt "$prefix_git%s") \
# 	 (set_color normal)
# end
