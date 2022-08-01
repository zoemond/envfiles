# 日本時間にする

- abema tv とか見れない

```sh
# ntpサーバとの同期を有効にする.
timedatectl set-ntp true
```

# [natural scroll](https://wiki.archlinux.org/index.php/Libinput)

```sh
sudo cp linux/x11/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
```

# Install Apps

```sh
sudo pacman -S paru
paru -S i3exit
paru -S neovim
paru -S tmux
paru -S copyq
paru -S tig
paru -S fzf
# coc-ts-serverがfileをrenameするのに必要
paru -S watchman
# xbacklightは"No outputs have backlight property."となった(lenovo E495, AMD)
# lightはエラーステータスが返ってきた.
# light-gitなら効いたので
paru -S light-git

```

# 日本語表示

- qt アプリでは日本語が表示されなかった。
- フォントをインストールすることで見えるようになった

```sh
sudo pacman -S otf-ipafont
```

# 日本語入力

```sh
paru -S fcitx5-mozc fcitx5-im fcitx-configure
```

- fcitx-configure -> 日本語を追加
- fcitx-configure ->Global Options から Activate Input Method と Deactivate Input Method にキーを割り当て

# 音出力・入力

- alsa のみでは chrome で youtube を再生する方法がわからなかった
- 新しくて default なのは pulseaudio の方らしいのでどのみち入れる

```sh
sudo pacman -S pulseaudio
```

## Trouble Shoot

### Headphone を挿しても youtube の音が Speaker が流れる

#### 現象 ↓

pavucontrol で出力が Speaker しか選択できず、headphone を認識していない (windows を起動したあと linux に戻った際も同様の現象が起こった )

- (参考)
  - 音がなる状態のときは list-sinks すると一つの sink に output の port が 2 つあることが確認できる
  ```
  ❯ pacmd list-sinks
  1 sink(s) available.
    * index: 1
           name: <alsa_output.pci-0000_05_00.6.analog-stereo>
          driver: <module-alsa-card.c>
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

#### 治った方法

- シャットダウン(再起動ではない)すると治った

  > https://forum.manjaro.org/t/sound-from-speakers-no-sound-from-3-5mm-jack-audio-amd-thinkpad-e595/13717/5 . Manjaro cannot initialise audio device correctly from hybrid hibernation state, but rebooting Manjaro will power down the device and reload it correctly

### chrome 上の discord で音声通信ができなかった.

#### 現象 ↓

- chrome でマイクを使用して録音・再生はできる
- discord のマイクチェックでも音量ゲージが動く
- discord の voice chat に入ると喋っても自分のアイコンが光らない

#### 治った方法

- pavcontrol を開いて眺めたりする
- sudo alsactl store してみる

#### 試した方法

- pacmd load-module loopback-module すると discord で会話できるようになる(自分の声が loopback で聞こえるのがうざい)
- `yay -S discord-ptb`で通話できるようになった
  - `yay -S discord`ではできず...
  - pc を再起動したら通話できなくなってしまったのでこの方法も違いそう

# key bind

```sh
sudo paru -S xkeysnail
```

- 権限設定

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

# font

```
paru -S ttf-hackgen-nerd
ln -s path/to/fonctonfig ~/.config/fontconfig # copyqが使うフォントがシステムのデフォルト。日本語が表示できるフォントにします
```
