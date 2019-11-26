;改行コードはCRLFでないとコメント直下の行が無効になる
SetKeyDelay, 0

#+r::Reload 
muhenkan := vk1Dsc07B
LAlt::LCtrl
LCtrl::LAlt 

;Google IME切り替えの神関数
#Include NeosAutoHotKey-IME.ahk

SC079::
  ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", 0)
  InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")
  ENG:=67699721
  GOOGLE:=68224017
  if (InputLocaleID <> %GOOGLE%)
  { ;IMEがGoogleでないときはGoogleに切り替えます。
    PostMessage 0x50, 0, 0x4110411,, A  ;WM_INPUTLANGCHANGEREQUEST
  }
  IME_SET(1)
Return

SC07B::
  IME_SET(0)
Return

;backspaceの隣のキー → 半角・全角キー
SC07D::Send, {SC029}
+SC07D::Send, +{SC029}

;移動, 選択
SC07B & k::Send, {Blind}{Up}
SC07B & j::Send, {Blind}{Down}
SC07B & h::Send, {Blind}{Left}
SC07B & l::Send, {Blind}{Right}
SC07B & i::Send, {Blind}{Home}
SC07B & a::Send, {Blind}{End}

SC07B & w::WithShift("^{Right}")
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
RCtrl & w::Send, ^{BS} 
SC07B & x::Send, {Blind}{BS}
SC07B & d::Send, {Blind}{Del}

        ;Send, +{Home}{Del}
        ;Send, +{End}{Del}

; application hot keys
#+k::
  WinActivate, ahk_exe ubuntu1804.exe
return

#+a::
  if WinActive("ahk_exe Hyper.exe")
     WinMinimize, ahk_exe Hyper.exe
  else
     WinActivate, ahk_exe Hyper.exe
return

#+w::
  Run, bugn.exe
return

#v::
  Run, copyq toggle,,hide
return

