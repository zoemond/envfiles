## powerline segment 不採用理由
#### iterm2だと三角が透明にならない
#### 表示の違和感をなくすにはKeep background colors opaqueする方法があるが、
#### backgound colorを設定しているところが透明にならないため利便性にかけると思った。

# prompt_pwdをフルパスで表示
set -x fish_prompt_pwd_dir_length 0

function fish_prompt 
  printf "\n"

  set -l prefix_git ' '
  set -l suffix_git ' '

  set -g __fish_git_prompt_show_informative_status 1
  set -g __fish_git_prompt_showupstream "informative"
  set -g __fish_git_prompt_showdirtystate "yes"

  set -g ___fish_git_prompt_color_prefix      (set_color -b "$myprompt_color_bg_repo")
  set -g ___fish_git_prompt_color_prefix_done (set_color -b "$myprompt_color_bg_repo")
  set -g ___fish_git_prompt_color_suffix       (set_color -b "$myprompt_color_bg_repo")
  set -g ___fish_git_prompt_color_suffix_done  (set_color -b "$myprompt_color_bg_repo")

  set -g __fish_git_prompt_color_branch -b "$myprompt_color_bg_repo" 
  set -g __fish_git_prompt_color_stagedstate -b "$myprompt_color_bg_staged" "$myprompt_color_fg_staged"
  set -g __fish_git_prompt_color_invalidstate -b "$myprompt_color_bg_invalid" "$myprompt_color_fg_invalid"
  set -g __fish_git_prompt_color_dirtystate -b "$myprompt_color_bg_dirty" "$myprompt_color_fg_dirty"
  set -g __fish_git_prompt_color_untrackedfiles -b "$myprompt_color_bg_untracked" "$myprompt_color_fg_untracked"

  set -g ___fish_git_prompt_char_stateseparator ''
  set -g ___fish_git_prompt_char_cleanstate ''

  # この辺みたりして設定する: https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_prompt.fish 
  printf '%s%s%s%s%s' \
	 (set_color -b "$myprompt_color_bg_repo" "$myprompt_color_fg_repo") (fish_git_prompt "$prefix_git%s$suffix_git") \
         (set_color -b "$myprompt_color_bg_pwd" "$myprompt_color_fg_pwd") ' '(prompt_pwd)' ' \
	 (set_color normal)

  set -l last_status $status 

  if not test $last_status -eq 0
    set_color -b red
  else
    set_color "$myprompt_color_fg"
    set_color -b "$myprompt_color_bg"
  end 

  printf "\n%s" (date +"%H:%M") 
  set_color normal
  printf " "

end
