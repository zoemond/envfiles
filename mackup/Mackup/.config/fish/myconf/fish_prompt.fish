## powerline segment 不採用理由
#### iterm2だと三角が透明にならない
#### 表示の違和感をなくすにはKeep background colors opaqueする方法があるが、
#### backgound colorを設定しているところが透明にならないため利便性にかけると思った。
# function fish_prompt
#   set -l last_status $status
# 
#   if not test $last_status -eq 0
#     segment white $fish_color_error (date +"%H:%M") 
#   else
#     segment black white (date +"%H:%M") 
#   end 
#   segment_close 
# end

function fish_prompt 
  set -l last_status $status 


  if not test $last_status -eq 0
    set_color -b red
  else
    set_color "$myprompt_color_fg"
    set_color -b "$myprompt_color_bg"
  end 


  printf '%s' (date +"%H:%M") 
  set_color normal
  printf ' '
end
