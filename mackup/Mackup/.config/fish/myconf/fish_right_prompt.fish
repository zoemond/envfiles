
# prompt_pwdをフルパスで表示
set -x fish_prompt_pwd_dir_length 0

function fish_right_prompt 
  set -l color_kind_black 232323 
  set -l color_git_normal 3cb371 # mediumseagreen 
  set -l pwd_bg_color 2f4f4f # darkslategray
  set -l prefix_git ' '

  set -g __fish_git_prompt_show_informative_status 1
  set -g __fish_git_prompt_showupstream "informative"
  set -g __fish_git_prompt_showdirtystate "yes"

  set -g __fish_git_prompt_color_branch -b "$color_git_normal" 
  set -g __fish_git_prompt_color_stagedstate -b green "$color_kind_black"
  set -g __fish_git_prompt_color_invalidstate -b red "$color_kind_black"
  set -g __fish_git_prompt_color_dirtystate -b red "$color_kind_black"
  set -g __fish_git_prompt_color_untrackedfiles -b yellow "$color_kind_black"

  set -g ___fish_git_prompt_char_stateseparator ''
  set -g ___fish_git_prompt_char_cleanstate ''

  # この辺みたりして設定する: https://github.com/ryanhugh/fish_config/blob/master/__fish_git_prompt.fi.backup#L459
  printf '%s[%s]%s%s' (set_color -b "$pwd_bg_color" "$color_kind_black") (prompt_pwd) (set_color -b "$color_git_normal" "$color_kind_black") (__fish_git_prompt "$prefix_git%s")
end
