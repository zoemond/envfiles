## git-secrets

- ユーザー共通に設定
  - `git secrets --install ~/.git-templates/git-secrets`

## git-config

ln -s .gitconfig ~/

# Linux/WSL共通
- unzip
  - 最低でもdenoをインストールするために必要
- deno
  - zenoを使うためにdenoが必要
- zsh
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
- git-secrets
- tmux
- tig
- [fzf](https://github.com/junegunn/fzf)
- keychain
  - 参考: https://zenn.dev/kaityo256/articles/ssh_agent_on_wsl
- xsel
  - tig, vim上でのクリップボード連携に使用する