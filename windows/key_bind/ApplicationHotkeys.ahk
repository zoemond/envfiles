#+a::
  if !WinExist("ahk_exe alacritty.exe")
     Run, alacritty.exe
  else if WinActive("ahk_exe alacritty.exe")
     WinMinimize, ahk_exe alacritty.exe
  else
     WinActivate, ahk_exe alacritty.exe
return

#+w::
  Run, bugn.exe
return

SC07B & v::
  Run, copyq toggle,,hide
return

