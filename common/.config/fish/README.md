# iterm で起動する

## 前提になっている考え方

新しい shell を試すとき、login shell にはしたくない

- シェルで遊んでいて変なシェルスクリプト書いた(無限ループとか)ら shell が落ちてしまう
- 落ちた時に別のターミナルから回復したり、問題の切り分けをしたい
  そのため iterm 起動時に`Run Command`で shell を起動したい

## 問題点

XDG_CONFIG_HOME を変更している場合、

- iterm では`Run Command`に fish と書いても XDG_CONFIG_HOME が反映されない
- `~/.config/fish/config.fish`に変更後の XDG_CONFIG_HOME を書くと、環境変数には追加されるが、fish の設定は反映されない

## 回避策

iterm2 の`Run Command`に以下のように設定する

```
env XDG_CONFIG_HOME=/Users/{user name}/envfiles/dotfiles /usr/local/bin/fish
```

この設定をミスると、

```
"Broken Pipe" "Warning A session ended very soon after starting. Check that the command in profile "Default" is correct."
```

とかいって iterm が起動しなくなるので注意
(iterm の Preference が書いてある.plist から Run Command に設定した風の値が書いてあるところを消したら復活できた)
