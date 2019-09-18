
muhenkan := vk1Dsc07B

Capslock::Ctrl
Alt::Ctrl
Ctrl::Alt 

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