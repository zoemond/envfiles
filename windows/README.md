# スムーズに設定する順メモ

## まずキーボードちゃんとする

1. US 配列にする
2. 最低限のアプリケーションインストール

- winget install --id LGUG2Z.komorebi -e # changekey を解凍するため
- winget install --id=Git.Git -e # config.ahk を実行するため
- winget install --id=AutoHotkey.AutoHotkey -e # PowerToyes は仮想モードがないのでキーリマッパとしては不採用

3. changekey のインストール(ブラウザ経由)・設定
4. git clone git@github.com:zoemond/envfiles.git
5. AutohotKey の設定

- タスクスケジューラから最上位の特権で config.ahk を実行する
- スタートアッププログラムにショートカットを配置するだけでも良いが、これだと管理者権限で起動したアプリケーション上で AHK が効かなくなる
- 管理者権限でスタートアップ時にプログラムを起動するにはタスクスケジューラを使用する必要がある

## application インストール

winget export は不要なものまで入ってくるのでべた書きで...

- winget install --id=hluk.CopyQ -e
- winget install --id=Flameshot.Flameshot -e
- winget install --id=Microsoft.VisualStudioCode -e
- wsl --install
- winget install --id=Canonical.Ubuntu.2204 -e

## スタートアッププログラムに配置する

- CopyQ

## パスを通す

- CopyQ
  - ショートカットキーを設定して実行するため
- AHK
  - komorebi から使用するため

## 一般、komorebi

(Profile.ps1 を含む)スクリプトを実行するために実行ポリシーを初期値から変更する必要がある
`Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

# WSL

インストールするライブラリは ../common/README.md 参照

## zsh

- [メモ] zeno の fuzzy find が使えないが、p10z のせいかもしれない
- ```sh
  # これがない場合、npm startで syscall: 'spawn google-chrome-stable',などとでてブラウザが立ち上がらない
  echo 'export BROWSER=/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe' >> ~/.zshrc
  ```

## xsel

- tig、vim などで wsl-windows 間のコピーに使用する。wslg があるが、linux で使用可能な設定と windows で使用可能な設定を統合するよりは、X Server を入れてしまったほうが楽なのではという考え
- 今や WSLg が存在するので windows 側に VcXsrv Windows X Server を入れる必要はない
- windows と wsl の間では wayland プロトコルが使用されているらしいが、xsel も DISPLAY 変数さえ設定すればクリップボードの共有ができた
- しかし履歴として保存ができないので非常に困る(https://github.com/microsoft/wslg/issues/1245)
- 逆に今まで通り X Server を windows 側に立てて通信することはできなかった
  - https://github.com/microsoft/WSL/issues/4106#issuecomment-502989345 も試したが...
  - 内部で Wayland が使われるようになっているのであればそれはそうかという気もする(不明)

# 難点

- デフォルトフォントを(レジストリをいじらずに)設定できないので、アプリケーションごとに設定する必要がある
  - Chrome のアドレスバー、Qt のアプリなど設定が反映されない部分がある
- プログラム経由でクリップボードに値を書き込むと履歴として残らない
  - WSL2 で WSLg が入ったことによる(https://github.com/microsoft/wslg/issues/1245)
  - clip.exe を使用すれば良いけど...
- トラックパッドのポインタ速度を最大まであげても遅い

## FlameShot

- FlameShot は windows には PrtSc キーのみの起動しか提供していない
- 新たな PC では PrtSc キーが Windows によって占拠されていたので、以下の記事に従って Registry を変更した
  - https://www.makeuseof.com/windows-11-disable-snipping-tool/#how-to-disable-the-snipping-tool-using-the-registry-editor
