;改行コードはCRLFでないとコメント直下の行が無効になる
SetKeyDelay, 0

#+r::Reload 
muhenkan := vk1Dsc07B
LAlt::LCtrl
LCtrl::LAlt 

;Windowsの言語設定から英字キーボードを選択するとgoogle imeが変換/無変換キーを認識しないため
;切り替え時のラグが若干きになる
;https://umada.net/autohotkey_keyconfig
;https://www.autohotkey.com/docs/KeyList.htm#SpecialKeys
SC079::
  ;日本語への切替
  PostMessage 0x50, 0, 0x4110411,, A  ;WM_INPUTLANGCHANGEREQUEST
Return

SC07B::
  ;Englishへの切替
  PostMessage 0x50, 0, 0x4090409,, A  ;WM_INPUTLANGCHANGEREQUEST
Return

;backspaceの隣のキー → 半角・全角キー
SC07D::Send, {SC029}
+SC07D::Send, +{SC029}

;移動, 選択
RCtrl & p::WithShift("{Up}")
RCtrl & n::WithShift("{Down}")
RCtrl & b::WithShift("{Left}")
RCtrl & f::WithShift("{Right}")
RCtrl & a::WithShift("{Home}")
RCtrl & e::WithShift("{End}")

SC07B & f::WithShift("^{Right}")
SC07B & b::WithShift("^{Left}")

;3つ以上のキー同時押しは'&'では実現できません
WithShift(rctrlKey){
    If GetKeyState("Shift", "P")
        Send, +%rctrlKey%
    Else
        Send, %rctrlKey%
    Return
}

;削除
RCtrl & h::send {BS}
RCtrl & w::Send, ^{BS} 

RCtrl & k::send +{End}{Del}
RCtrl & d::send {Del}

SC07B & d::send ^{Del}


; application hot keys
#+k::
  WinActivate, ahk_exe ubuntu1804.exe
return

#+w::
  Run, bugn.exe
return

