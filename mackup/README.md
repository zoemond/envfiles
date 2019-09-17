# `XDG_CONFIG_HOME`配下のディレクトリについて
- `~/.config`決め打ち(`XDG_CONFIG_HOME`を見ていない)アプリが存在するため、`~/.config`で管理する 
  - mackup
  - karabiner-elements
  - 他にもあるかも

# memo
- iterm shell integration 
  - utilities

---

# mackup
## gitでの管理ついて
- 以下の理由のため mackupはgitで管理することにしました。
  - 変更履歴の管理
  - プロキシを挟んでいるような場所にいてもとってこれそう

- デメリット
  - ファイルの同期
  - なんとかできそうではある 

## fish
### 微妙なところ
- pluginも自作の関数/設定も`function/`, `conf.d/`に配置される
- dotfilesをリモートサーバで管理する理由は、環境構築を楽にするという目的の他に、設定項目の管理もあるので
  - 何のプラグインを入れたかは管理したい
  - 入れたプラグインのソースは管理したくない

### 対策
- そのためデフォルトのFishをignoreし, my-fishを定義して管理したい関数を書いていくことにする
- mackupのいいところがなくなる戦略だけど、プラグインの二重管理がなんか嫌だ
- きつい

## mackupハマらないように
- 自分で定義するアプリのファイル名はケバブかスネーク推奨
  - 大文字小文字を区別できないので、キャメルでは認識してもらえなかった

## karabiner
### 微妙なところ
- `assets/complex-modification`を更新すると同時に`karabiner.json`が更新される.
  - 2重管理になっている
