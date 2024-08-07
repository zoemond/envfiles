#Requires AutoHotkey v2.0.2

; Windowsキー+Lで画面ロックするのを避けるために レジストリで Lと「ー\ろ」キーを変換し、AutoHotkey上でLに戻したかった。
; しかしレジストリを変更しても Windowsキー+L は有効のまま
;SC073:: {
;    If GetKeyState("LWin", "P")
;        Send "{SC07B}"
;    ELSE
;        Send "{l}"
;    Return
;}

;移動, 選択
SC07B & k:: Send "{Blind}{Up}"
SC07B & j:: Send "{Blind}{Down}"
SC07B & h:: Send "{Blind}{Left}"
SC07B & l:: Send "{Blind}{Right}"
SC07B & i:: Send "{Blind}{Home}"
SC07B & 0:: Send "{Blind}{Home}"
SC07B & a:: Send "{Blind}{End}"
SC07B & 4:: Send "{Blind}{End}"

SC07B & e:: WithShift("^{Right}")
SC07B & b:: WithShift("^{Left}")

;3つ以上のキー同時押しは'&'では実現できません
WithShift(rctrlKey) {
    If GetKeyState("Shift", "P")
        Send "+" rctrlKey
    Else
        Send rctrlKey
    Return
}

;削除
RCtrl & w:: {
    if WinActive("ahk_exe alacritty.exe")
        Send "^{w}"
    else
        Send "^{BS}"
    return
}
SC07B & x:: {
    if GetKeyState("RCtrl", "P") {
        if WinActive("ahk_exe alacritty.exe")
            Send "^{w}"
        else
            Send "^{BS}"
    } else {
        Send "{BS}"
    }
    return
}
SC07B & d:: Send "{Blind}{Del}"

;Send, +{Home}{Del}
;Send, +{End}{Del}
