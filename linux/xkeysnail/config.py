import re
from xkeysnail.transform import *

import subprocess
import traceback

import time
from Xlib import X
from Xlib.display import Display
from Xlib.ext.xtest import fake_input

# FIXME: youtubeの再生中動画にはクリックが効かない
def click():
    d = Display()
    fake_input(d, X.ButtonPress, 1)
    d.sync()
    time.sleep(0.001);
    fake_input(d, X.ButtonRelease, 1)
    d.sync()

# IMEの状態取得
# 半角文字はUS配列・全角に文字はJIS配列(かな文字)で行いたいので、IMEの状>態によってkeymapを変更する
def isNotImeActive(wm_class):
    """
    fcitx-remoteコマンドでfcitxの状態を取得できるが、ユーザ権限で実行する必要がある。
    理由は以下
      - 実行者の違うfcitx対しては`fcitx-remote`が実行できない
      - xkeysnailはsudo権限を必要とするのでuser権限で実行しているfcitxに対してfictx-remoteがエラーになる
      - 実行者を同じにするため、sudo 権限でfcitxを起動することはできる
      (fcitxをsudoで起動するには~/.xprofileで設定してある環境変数が必要)
      - が、mozcはsudoで起動できない(mozcのポリシーによるものらしい)

    ユーザ権限で実行する(sudo -u username)とパスワード入力を求められるので、入力の必要がないように設定
    - `sudo visudo`から以下のように追記
     ```
     root ALL=(koki) NOPASSWD: /usr/bin/fcitx-remote
     ```
     ユーザ名ベタ書きがびみょいけどポータブルにする必要が出てからでいいかと思ったので放置
    """
    cmd = ['sudo -u koki fcitx-remote']
    try:
        res = subprocess.check_output(
                cmd,
                stderr=subprocess.STDOUT,
                shell=True)
        return res.decode() != '2\n'
    except subprocess.CalledProcessError as e:
        print('code', e.returncode)
        print('cmd', e.cmd)
        print('output', e.output)
        print(traceback.format_exc())
    
    return False


define_modmap({
    Key.CAPSLOCK: Key.LEFT_CTRL,
    Key.LEFT_CTRL: Key.LEFT_ALT,
    Key.LEFT_ALT: Key.LEFT_CTRL
})

## 日本語キーボード上で英語配列を使う設定
define_keymap(isNotImeActive, {
    K("Shift-KEY_2"): K("LEFT_BRACE"),
    K("Shift-KEY_6"): K("EQUAL"),
    K("Shift-KEY_7"): K("Shift-KEY_6"),
    K("Shift-KEY_8"): K("Shift-APOSTROPHE"),
    K("Shift-KEY_9"): K("Shift-KEY_8"),
    K("Shift-KEY_0"): K("Shift-KEY_9"),
    ## [Minus]は共通
    K("Shift-MINUS"):       K("Shift-RO"),
    K(      "EQUAL"):       K("Shift-MINUS"),
    K("Shift-EQUAL"):       K("Shift-SEMICOLON"),
    K(        "YEN"):       K("Shift-LEFT_BRACE"),
    K(  "Shift-YEN"):       K("Shift-EQUAL"),
    K(      "LEFT_BRACE"):  K("RIGHT_BRACE"),
    K("Shift-LEFT_BRACE"):  K("Shift-RIGHT_BRACE"),
    K(      "RIGHT_BRACE"): K("BACKSLASH"),
    K("Shift-RIGHT_BRACE"): K("Shift-BACKSLASH"),
    ## [Semicolon]は共通
    K("Shift-SEMICOLON"):   K("APOSTROPHE"),
    K(      "APOSTROPHE"):  K("Shift-KEY_7"),
    K("Shift-APOSTROPHE"):  K("Shift-KEY_2"),
    K(      "BACKSLASH"):   K("YEN"),
    K("Shift-BACKSLASH"):   K("Shift-YEN"),
})


# ワンショットモデファイアキーの設定
define_multipurpose_modmap({
   Key.MUHENKAN: [Key.MUHENKAN, Key.RIGHT_META]
})

# Vim-like Coursor
define_keymap(None, {
    K("RSuper-h"): K("Left"),
    K("RSuper-j"): K("Down"),
    K("RSuper-k"): K("Up"),
    K("RSuper-l"): K("Right"),
    K("RSuper-Shift-h"): K("Shift-Left"),
    K("RSuper-Shift-j"): K("Shift-Down"),
    K("RSuper-Shift-k"): K("Shift-Up"),
    K("RSuper-Shift-l"): K("Shift-Right"),

    K("RSuper-i"): K("HOME"),
    K("RSuper-a"): K("END"),
    K("RSuper-Shift-i"): K("Shift-HOME"),
    K("RSuper-Shift-a"): K("Shift-END"),

    K("RSuper-b"): K("Ctrl-Left"),
    K("RSuper-w"): K("Ctrl-Right"),
    K("RSuper-Shift-b"): [K("Ctrl-Shift-Left")],
    K("RSuper-Shift-w"): [K("Ctrl-Shift-Right")],

    K("RSuper-x"): [K("Backspace")],
    K("RSuper-d"): [K("Delete")],
    K("RSuper-Ctrl-x"): [K("Ctrl-Backspace")],
    K("RSuper-Ctrl-d"): [K("Ctrl-Delete")],

    K("RSuper-Enter"): click,
})

# application hot key
copyqCommand = 'sudo -u koki copyq toggle'
define_keymap(None, {
    K("RSuper-v"): launch(copyqCommand.split()),
})
