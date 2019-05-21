
set -x fish_prompt_pwd_dir_length 0
function fish_right_prompt 
  set -g __fish_git_prompt_show_informative_status 1
  set -g __fish_git_prompt_color_branch black 
  set -g __fish_git_prompt_showupstream "informative"
  set -g __fish_git_prompt_showdirtystate "yes"
  set -g __fish_git_prompt_color_stagedstate green
  set -g __fish_git_prompt_color_invalidstate red
  set -g __fish_git_prompt_color_dirtystate red
  set -g __fish_git_prompt_color_cleanstate brgreen
  set -g __fish_git_prompt_color_untrackedfiles yellow

  printf '%s%s%s%s ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (__fish_git_prompt) 
end
