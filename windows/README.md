# package managerについて
scoopは
- アップデートの方法がgui経由になったり(vscode)
- プログラムから開くメニューをレジストリに登録自分でしないといけなかったり(vscode)
- scoopコマンド, bucket探す手間があったり
  (ググったときにapt ~ とかbrew ~ みたいなのがすぐ出てこないので大変)

して面倒くささが改善されてる気がしなかったので 手動でインストールしていくことにします

---

# スムーズに設定する順メモ
## google chrome
## key swap
## auto hot key
スタートアップ時に管理者権限プログラムを実行するためにはスタートアッププログラムではなくタスクスケジューラから実行するように設定する必要がある
## copyq
## US配列
## bug n
1. ダウンロード
2. 配置
  - [... executable or script when running bug.n, or in the Windows user directory (e.g. C:\Users\joten\AppData\Roaming\bug.n).](https://github.com/fuhsjr00/bug.n/blob/master/doc/Customization.md)
3. 環境変数追加
4. 設定ファイルへのシンボリックリンク作成
- 実行権限cmd: `mklink C:\Users\me\AppData\Roaming\bug.n\Config.ini  C:\Users\me\envfiles\windows\key_bind\bug.n\Config.ini`

## フォント
- alacrittyで表示するのに調子の良かった[Ricty](https://github.com/edihbrandon/RictyDiminished)を入れる
  - Noto Sans, Noto Serif, 源ノ角ゴシック は英語表示がずれた

## alacritty
  - install: https://github.com/alacritty/alacritty
  - 実行権限cmd: `mklink C:\Users\me\AppData\Roaming\alacritty\alacritty.yml  C:\Users\me\envfiles\windows\alacritty\alacritty.yml`
---
その他
- vscode
  - 7zip
- git
- neovim
- sudo
- ln
- which


# wsl
## git ssh
- https://qiita.com/suthio/items/2760e4cff0e185fe2db9
- sshconfig <
```
Host github github.com
  HostName github.com
  IdentityFile ~/.ssh/id_git_rsa #ここに自分の鍵のファイル名
  User git
```
## tools
- `sudo apt install ranger`
- `sudo apt install zsh`
  - install: https://github.com/zplug/zplug
    - `chmod -R 755 ~/.zplug` : wslで(?).zshrc時に`Ignore insecure directories and continue [y] or abort compinit [n]?`という警告が出ないように
  - ~/.zshenv <
    ```sh
    if [[ -z "$XDG_CONFIG_HOME" ]]
    then
            export XDG_CONFIG_HOME="$HOME/.config/"
    fi
    ```
  - ~/.zshrc <
     ```sh
     # スクリプトファイル内で取れる$0はsourceされたファイルになるが、
     # zshのようにしてzshを起動すると$0はカレントディレクトリになるのでうまく動かない
     # そのため環境変数ZDOTDIRを設定するのではなく、.zshrcでスクリプトをsourceするようにする
     source "$XDG_CONFIG_HOME/zsh/.zshrc"
    ```

- `sudo apt install neovim`
  - [install dein](https://github.com/Shougo/dein.vim)
- `sudo apt install tig`
- [fzf](https://github.com/junegunn/fzf)
  - ubuntu 18. はapt repositoryに存在しない
  - `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf`
  - `~/.fzf/install`
