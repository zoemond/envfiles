# 日本時間にする

-   abema tv とか見れない

```sh
# ntpサーバとの同期を有効にする.
timedatectl set-ntp true
```

# [natural scroll](https://wiki.archlinux.org/index.php/Libinput)

```sh
sudo mv linux/x11/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
```

# Install Apps

```sh
sudo pacman -S yay
yay -S i3exit
yay -S neovim
yay -S tmux
yay -S copyq
yay -S tig
yay -S fzf
# xbacklightは"No outputs have backlight property."となった(lenovo E495, AMD)
# lightはエラーステータスが返ってきた.
# light-gitなら効いたので
yay -S light-git

```

# 日本語表示

-   qt アプリでは日本語が表示されなかった。
-   フォントをインストールすることで見えるようになった

```sh
sudo pacman -S otf-ipafont
```

# 日本語入力

```sh
sudo pacman -S fcitx
```

# 音出力・入力

-   alsa のみでは chrome で youtube を再生する方法がわからなかった
-   新しくて default なのは pulseaudio の方らしいのでどのみち入れる

```sh
sudo pacman -S pulseaudio
```

## Trouble Shoot

### Headphone を挿しても youtube の音が Speaker が流れる

#### 現象 ↓

pavucontrol で出力が Speaker しか選択できず、headphone を認識していない)

#### 治った方法

-   alsamixer を起動していっぱいメニューがあるサウンドカード(HD-Audio Generic)を選択して眺めたあと`shutdown -r now`したら認識するようになった

-   windows を起動したあと linux に戻った際も同様の現象が起こった が、これで治った ↓(治ったあと diff を戻して再起動しても治ったままだった。謎)

https://wiki.archlinux.org/title/Talk:PulseAudio/Examples#Having_both_speakers_and_headphones_plugged_in_and_switching_in_software_on-the-fly

```diff

∅ /usr/share/pulseaudio/alsa-mixer/paths
❯ diff -u analog-output-headphones.conf analog-output-headphones.conf.backup
--- analog-output-headphones.conf       2021-05-27 16:46:17.702804134 +0900
+++ analog-output-headphones.conf.backup        2021-05-27 16:41:06.266937435 +0900
@@ -128,8 +128,8 @@

 ; On some machines Front is actually a part of the Headphone path
 [Element Front]
-switch = off
-volume = off
+switch = mute
+volume = zero

 [Element Rear]
 switch = off

```

このとき

-   pavucontrol(GUI)の出力先には Headphones(plugged in)と Speakers が見れてる
-   `pacmd list-sinks` は一つしか出力されていない

```
❯ pacmd list-sinks
1 sink(s) available.
  * index: 1
  ...
          ports:
                analog-output-speaker: Speakers (priority 10000, latency offset 0 usec, available: no)
                        properties:
                                device.icon_name = "audio-speakers"
                analog-output-headphones: Headphones (priority 9900, latency offset 0 usec, available: yes)
                        properties:
                                device.icon_name = "audio-headphones"
        active port: <analog-output-headphones>
```

### chrome 上の discord で音声通信ができなかった.

#### 現象 ↓

-   chrome でマイクを使用して録音・再生はできる
-   discord のマイクチェックでも音量ゲージが動く
-   discord の voice chat に入ると喋っても自分のアイコンが光らない

#### 治った方法

-   pavcontrol を開いて眺めたりする
-   sudo alsactl store してみる

#### 試した方法

-   pacmd load-module loopback-module すると discord で会話できるようになる(自分の声が loopback で聞こえるのがうざい)
-   `yay -S discord-ptb`で通話できるようになった
    -   `yay -S discord`ではできず...
    -   pc を再起動したら通話できなくなってしまったので

# key bind

```sh
sudo pacman -S python-pip
sudo pip3 install xkeysnail
```

-   権限設定

```sh
# input groupは存在するけどuinput groupは存在しない
cat /etc/group | grep in
# uinputグループ作成
sudo groupadd uinput
# Always use the -a (append) option when adding a user to a new group. If you omit the -a option, the user will be removed from any groups not listed after the -G option.
sudo usermod -a -G input,uinput <your_username>
# 所属グループ確認
gropus <your_username>

sudo cp input.rules uinput.rules /etc/udev/rules.d/
# systemdが起動時に追加のカーネルモジュールを読み込む設定 (これがないと/etc/udevの権限が反映されなかった)
# 本来待てばudevがロードしてくれるものらしい。
echo uinput > /etc/modules-load.d/uinput.conf

```

# default browser

```
$ xdg-mime default google-chrome.desktop x-scheme-handler/http
$ xdg-mime default google-chrome.desktop x-scheme-handler/https
```

# keychain

```
sudo pacman -S keychain

echo 'eval `keychain --eval --agents ssh -Q --quiet 作成したkeyファイル名(パスではない)`' >> ~/.zshrc
```
