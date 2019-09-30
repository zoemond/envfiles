Set-Alias vi nvim

remove-item alias:ls
function ls(){ Get-ChildItem -Force $args }
function gst(){ git status }
function glo(){ git log --oneline }
function gbr(){ git branch }
function gch(){ git checkout }
function ga(){ git add $args }
function gaa(){ git add -A }
# remove-item alias:gcm // Constantオプションを不可して作成されたaliasは削除できない
# Set-Alias gcm 'git commit -m'
function gca(){ git commit -a -m $args }
function gam(){ git commit --ammend }
function gri(){ git rebase -i $args }
function grc(){ git rebase --continue }
function gpk(){ git cherry-pick $args }
function gpc(){ git cherry-pick --continue }

function srr(){ svn revert --recursive $args }
