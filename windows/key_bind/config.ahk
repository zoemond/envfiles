#+r::Reload 
muhenkan := vk1Dsc07B
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

RCtrl & p::Send, {Up}
RCtrl & n::Send, {Down}
RCtrl & b::Send, {Left}
RCtrl & f::Send, {Right}
RCtrl & a::Send, {Home}
RCtrl & e::Send, {End}

RCtrl & h::send {BS}
RCtrl & w::Send, ^{BS} 

RCtrl & k::send +{End}{Del}
RCtrl & d::send {Del}

RCtrl & q::send ^{q}
RCtrl & r::send ^{r}
RCtrl & t::send ^{t}
RCtrl & y::send ^{y}
RCtrl & u::send ^{u}
RCtrl & s::send ^{s}
RCtrl & g::send ^{g}
RCtrl & z::send ^{z}
RCtrl & x::send ^{x}
RCtrl & c::send ^{c}
RCtrl & v::send ^{v}
RCtrl & .::send ^{.}

SC07B & d::send ^{Del}
SC07B & f::send ^{Right}
SC07B & b::send ^{Left}
