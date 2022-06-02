import re
from xkeysnail.transform import *

import subprocess
import traceback

import time
from Xlib import X
from Xlib.display import Display
from Xlib.ext.xtest import fake_input

# FIXME: youtubeの再生中動画にはクリックが効かない
# xautomationコマンドを実行しても同じ結果だった
#    - `clickCommand = ['xte', r"mouseclick 1"]`
def click():
    d = Display()
    fake_input(d, X.ButtonPress, 1)
    d.sync()
    time.sleep(0.001);
    fake_input(d, X.ButtonRelease, 1)
    d.sync()


define_modmap({
    Key.CAPSLOCK: Key.LEFT_CTRL,
    Key.LEFT_CTRL: Key.LEFT_ALT,
    Key.LEFT_ALT: Key.LEFT_CTRL
})

# fcitxで最初に「英語-US)」、2番目に「Mozc」を設定したとき、
# 特に設定しなくてもUS配列を使える
# backspaceの横のキーのみ変換
define_keymap(lambda wm_class: True, {
    K(        "YEN"):       K("GRAVE"), # -> `
    K(  "Shift-YEN"):       K("Shift-GRAVE") # -> ~
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

    K("RSuper-Ctrl-h"): [K("Ctrl-Left")],
    K("RSuper-Ctrl-l"): [K("Ctrl-Right")],
    K("RSuper-i"): K("HOME"),
    K("RSuper-a"): K("END"),
    K("RSuper-Shift-i"): K("Shift-HOME"),
    K("RSuper-Shift-a"): K("Shift-END"),

    K("RSuper-f"): [K("Page_down")],
    K("RSuper-g"): [K("Page_up")],
    K("RSuper-Shift-f"): [K("Shift-Page_Down")],
    K("RSuper-Shift-g"): [K("Shift-Page_Up")],

    K("RSuper-b"): K("Ctrl-Left"),
    K("RSuper-w"): K("Ctrl-Right"),
    K("RSuper-Shift-b"): [K("Ctrl-Shift-Left")],
    K("RSuper-Shift-w"): [K("Ctrl-Shift-Right")],

    K("RSuper-x"): [K("Backspace")],
    K("RSuper-d"): [K("Delete")],
    K("RSuper-Ctrl-x"): [K("Ctrl-Backspace")],
    K("RSuper-Ctrl-d"): [K("Ctrl-Delete")],

    K("RSuper-Enter"): click,

    # tmux keys
    K("WAKEUP"): {
        K("h"): [K("Ctrl-Space"), K("h")],
        K("j"): [K("Ctrl-Space"), K("j")],
        K("k"): [K("Ctrl-Space"), K("k")],
        K("l"): [K("Ctrl-Space"), K("l")],
    },
})

# application hot key
copyqCommand = 'sudo -u koki copyq toggle'
screenshotCommand = 'flameshot gui'
define_keymap(None, {
    K("RSuper-v"): launch(copyqCommand.split()),
    K("RSuper-s"): launch(screenshotCommand.split()),
})
