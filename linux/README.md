# 日本時間にする

- abema tvとか見れない
```sh
# ntpサーバとの同期を有効にする.
timedatectl set-ntp true
```
# 日本語表示
- qtアプリでは日本語が表示されなかった。
- フォントをインストールすることで見えるようになった
```sh
sudo pacman -S otf-ipafont
```

# 日本語入力
```sh
sudo pacman -S fcitx
```

# 音出力・入力
- alsaのみではchromeでyoutubeを再生する方法がわからなかった
- 新しくてdefaultなのはpulseaudioの方らしいのでどのみち入れる

```sh
sudo pacman -S pulseaudio
# メモ:
# chrome上のdiscordで音声通信ができなかった.
# 現象↓
# - chromeでマイクを使用して録音・再生はできる
# - discordのマイクチェックでも音量ゲージが動く
# - discordのvoice chatに入ると喋っても自分のアイコンが光らない
# - pacmd load-module loopback-moduleするとdiscordで会話できるようになる(自分の声がloopbackで聞こえるのがうざい)
#
# snapcraftでデスクトップアプリをインストールしたら解決したので原因未確認だけど
# pulseaudioのせいではなくてalsaのカードがすべてMMだったからな気がする

```

# key bind
```sh
sudo pacman -S xkeysnail
```
### systemdとして起動します
xkeysnailの性質的にshellでの実行よりsystemdのほうがあってそうなので

- systemd
```sh
cp xkeysnail.service ~/.config/systemd/user/
systemctl --user enable xkeysnail
systemctl --user start xkeysnail
systemctl --user status xkeysnail
# エラーの場合詳細を見る
journalctl --user -u xkeysnail -b
```
- 権限設定
```sh
# input groupは存在するけどuinput groupは存在しない
cat /etc/group | grep in
# uinputグループ作成
sudo groupadd uinput
# Always use the -a (append) option when adding a user to a new group. If you omit the -a option, the user will be removed from any groups not listed after the -G option. 
sudo usermod -a -G input,uinput,<your_username>
# 所属グループ確認
gropus <your_username>

sudo cp input.rules uinput.rules /etc/udev/rules.d/
# systemdが起動時に追加のカーネルモジュールを読み込む設定 (これがないと/etc/udevの権限が反映されなかった)
# 本来待てばudevがロードしてくれるものらしい。(= xkeysnailのsystemd実行時にはrulesがロードされてない?)
echo uinput > /etc/modules-load.d/uinput.conf

```
