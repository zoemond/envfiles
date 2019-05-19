# ranger->サブシェル->rangerの多重起動を避ける 
function exit_if_nested_ranger
  if set -q -x RANGER_LEVEL
    exit 
  end
end 

# rangerのサブシェルから起動された場合はpromptを変更する
if set -q -x RANGER_LEVEL
  set -g _origin_prompt (fish_prompt)
  function fish_prompt
    echo "(RANGER)$_origin_prompt"
  end
end 


# https://github.com/ranger/ranger/wiki/Integration-with-other-programs
# > if you want to change the dir on demand after you exit ranger, by the following wrapper function.  
function ranger
    exit_if_nested_ranger

    set IFS \t\n
    set tempfile (mktemp -t tmp.XXXXXX)
    command ranger --cmd="map Q chain shell echo %d > "$tempfile"; quitall" $argv

    # test (cat $tempfile) = ...すると、tempfileに中身が無いときエラーになる。どうしたらいいのか分からないので一時変数にした
    set current_ranger_path (cat -- "$tempfile")
    if test -f "$tempfile" 
       and test "$current_ranger_path" != $PWD 
         cd $current_ranger_path || return
    end
end 
