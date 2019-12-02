# itermで起動する
## 前提になっている考え方
新しいshellを試すとき、login shellにはしたくない
- シェルで遊んでいて変なシェルスクリプト書いた(無限ループとか)らshellが落ちてしまう
- 落ちた時に別のターミナルから回復したり、問題の切り分けをしたい
そのため iterm起動時に`Run Command`でshellを起動したい
## 問題点
XDG_CONFIG_HOMEを変更している場合、
- itermでは`Run Command`にfishと書いてもXDG_CONFIG_HOMEが反映されない
- `~/.config/fish/config.fish`に変更後のXDG_CONFIG_HOMEを書くと、環境変数には追加されるが、fishの設定は反映されない

## 回避策
iterm2の`Run Command`に以下のように設定する
``` 
env XDG_CONFIG_HOME=/Users/{user name}/envfiles/dotfiles /usr/local/bin/fish
```
この設定をミスると、
```
"Broken Pipe" "Warning A session ended very soon after starting. Check that the command in profile "Default" is correct."
```
とかいってitermが起動しなくなるので注意
(itermのPreferenceが書いてある.plistからRun Commandに設定した風の値が書いてあるところを消したら復活できた)
