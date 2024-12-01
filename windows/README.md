# スムーズに設定する順メモ
## まずキーボードちゃんとする
1. US 配列にする
2. 最低限のアプリケーションインストール
  - winget install --id LGUG2Z.komorebi -e # changekey を解凍するため
  - winget install --id=Git.Git  -e # config.ahkを実行するため
  - winget install --id=AutoHotkey.AutoHotkey  -e # PowerToyesは仮想モードがないのでキーリマッパとしては不採用
3. changekey のインストール(ブラウザ経由)・設定
4. git clone git@github.com:zoemond/envfiles.git
5. AutohotKeyの設定
  - タスクスケジューラから最上位の特権でconfig.ahkを実行する
  - スタートアッププログラムにショートカットを配置するだけでも良いが、これだと管理者権限で起動したアプリケーション上でAHKが効かなくなる
  - 管理者権限でスタートアップ時にプログラムを起動するにはタスクスケジューラを使用する必要がある

## applicationインストール
winget exportは不要なものまで入ってくるのでべた書きで...

- winget install --id=hluk.CopyQ  -e
- winget install --id=Flameshot.Flameshot  -e
- winget install --id=Microsoft.VisualStudioCode  -e
- wsl --install
- winget install --id=Canonical.Ubuntu.2204  -e 

## スタートアッププログラムに配置する
- CopyQ

## パスを通す
-  CopyQ 
   - ショートカットキーを設定して実行するため 
-  AHK 
   - komorebiから使用するため

## 一般、komorebi
(Profile.ps1を含む)スクリプトを実行するために実行ポリシーを初期値から変更する必要がある
`Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`



# WSL
インストールするライブラリは ../common/README.md 参照

## zsh
- [メモ] zenoのfuzzy findが使えないが、p10zのせいかもしれない

## xsel
- tig、vimなどでwsl-windows間のコピーに使用する。wslgがあるが、linuxで使用可能な設定とwindowsで使用可能な設定を統合するよりは、X Serverを入れてしまったほうが楽なのではという考え
- 今やWSLgが存在するので windows側に VcXsrv Windows X Serverを入れる必要はない
- windowsとwslの間ではwaylandプロトコルが使用されているらしいが、xselもDISPLAY変数さえ設定すればクリップボードの共有ができた
- しかし履歴として保存ができないので非常に困る(https://github.com/microsoft/wslg/issues/1245)
- 逆に今まで通りX Serverをwindows側に立てて通信することはできなかった
  - https://github.com/microsoft/WSL/issues/4106#issuecomment-502989345 も試したが...
  - 内部でWaylandが使われるようになっているのであればそれはそうかという気もする(不明)

