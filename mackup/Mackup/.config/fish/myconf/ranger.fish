# ranger->サブシェル->rangerの多重起動を避ける
function ranger
  if set -q -x RANGER_LEVEL
    exit
  else
    command ranger $argv
  end
end

# rangerのサブシェルから起動された場合はpromptを変更する
if set -q -x RANGER_LEVEL
  set -g _origin_prompt (fish_prompt)
  function fish_prompt
    echo "(RANGER)$_origin_prompt"
  end
end 

# fish用ranger-cd
#( https://gist.github.com/ashwin/8d64074bbe2296818929 )
function ranger-cd
    set tmpfile "/tmp/pwd-from-ranger"
    ranger --choosedir=$tmpfile $argv
    set rangerpwd (cat $tmpfile)
    if test "$PWD" != $rangerpwd
        cd $rangerpwd
    end
end
