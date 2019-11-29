;------------------------------------
;改行コードはCRLFでないとコメント直下の行が無効になる
;------------------------------------

;どのディレクトリからの実行でもファイルのIncludeができるように
;ベースとなるディレクトリを変更
#Include %A_ScriptDir%
SetKeyDelay, 0

LAlt::LCtrl
LCtrl::LAlt 

;backspaceの隣のキー → 半角・全角キー
SC07D::Send, {SC029}
+SC07D::Send, +{SC029}

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

#Include CursorPointer.ahk
#Include Caret.ahk
#+r::Reload 
#Include ApplicationHotKeys.ahk