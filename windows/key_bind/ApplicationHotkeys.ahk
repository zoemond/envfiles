#+a::
  if !WinExist("ahk_exe Hyper.exe")
     Run, Hyper.exe
  else if WinActive("ahk_exe Hyper.exe")
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

