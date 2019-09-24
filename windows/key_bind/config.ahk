#+r::Reload 
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


Capslock & p::Send, {Up}
Capslock & n::Send, {Down}
Capslock & b::Send, {Left}
Capslock & f::Send, {Right}
Capslock & a::Send, {Home}
Capslock & e::Send, {End}

Capslock & h::send {BS}
Capslock & w::Send, ^{BS} 

Capslock & k::send +{End}{Del}
Capslock & d::send {Del}

Capslock & q::send ^{q}
Capslock & r::send ^{r}
Capslock & t::send ^{t}
Capslock & y::send ^{y}
Capslock & u::send ^{u}
Capslock & s::send ^{s}
Capslock & g::send ^{g}
Capslock & z::send ^{z}
Capslock & x::send ^{x}
Capslock & c::send ^{c}
Capslock & v::send ^{v}
Capslock & .::send ^{.}

SC07B & d::send ^{Del}
SC07B & f::send ^{Right}
SC07B & b::send ^{Left}
