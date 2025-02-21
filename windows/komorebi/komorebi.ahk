#Requires AutoHotkey v2.0
#SingleInstance Force

Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

Komorebics(cmds) {
    For index, cmd in cmds {
        Komorebic(cmd)
    }
}

KomorebicsShift(cmds, shiftCmds) {
    If GetKeyState("Shift", "P")
        Komorebics(shiftCmds)
    Else
        Komorebics(cmds)
    Return

}


;3つ以上のキー同時押しは'&'では実現できません
KomorebicShift(cmd, shiftCmd) {
    If GetKeyState("Shift", "P")
        Komorebic(shiftCmd)
    Else
        Komorebic(cmd)
    Return
}

;3つ以上のキー同時押しは'&'では実現できません
KomorebicShiftCtrl(cmd, shiftCmd, ctrlCmd) {
    If GetKeyState("Ctrl", "P")
        Komorebic(ctrlCmd)
    Else If GetKeyState("Shift", "P")
        Komorebic(shiftCmd)
    Else
        Komorebic(cmd)
    Return
}


SC070 & q:: Komorebic("close")
SC070 & m:: Komorebic("minimize")

; Focus windows ; Move windows
SC070 & h:: KomorebicShift("focus left", "move left")
SC070 & j:: KomorebicShift("focus down", "move down")
SC070 & k:: KomorebicShift("focus up", "move up")
SC070 & l:: KomorebicShift("focus right", "move right")

SC070 & [:: KomorebicShift("cycle-stack previous", "cycle-focus previous")
SC070 & ]:: KomorebicShift("cycle-stack next", "cycle-focus next")


; Stack windows
SC070 & s:: KomorebicShift("stack-all", "unstack-all")

; Resize
SC070 & =:: KomorebicShift("resize-axis horizontal increase", "resize-axis vertical increase")
SC070 & -:: KomorebicShift("resize-axis horizontal decrease", "resize-axis vertical decrease")

; Manipulate windows
SC070 & t:: Komorebic("toggle-float")
SC070 & f:: Komorebic("toggle-monocle")
SC070 & p:: Komorebic("toggle-pause")

; Window manager options
;#+r:: Komorebic("retile")

; Layouts
SC070 & x:: Komorebic("cycle-layout previous")
SC070 & y:: Komorebic("cycle-layout next")

; Workspaces ; Move windows across workspaces
SC070 & 0:: KomorebicShift("focus-monitor-workspace 0 0", "move-to-monitor 0")
SC070 & 1:: KomorebicShift("focus-monitor-workspace 1 0", "move-to-monitor-workspace 1 0")
SC070 & 2:: KomorebicShift("focus-monitor-workspace 2 0", "move-to-monitor-workspace 2 0")
SC070 & 3:: KomorebicShift("focus-monitor-workspace 1 1", "move-to-monitor-workspace 1 1")
SC070 & 4:: KomorebicShift("focus-monitor-workspace 2 1", "move-to-monitor-workspace 2 1")
