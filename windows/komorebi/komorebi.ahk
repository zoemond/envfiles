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


SC073 & q:: Komorebic("close")
SC073 & m:: Komorebic("minimize")

; Focus windows ; Move windows
SC073 & h:: KomorebicShift("focus left", "move left")
SC073 & j:: KomorebicShift("focus down", "move down")
SC073 & k:: KomorebicShift("focus up", "move up")
SC073 & l:: KomorebicShift("focus right", "move right")

SC073 & [:: KomorebicShift("cycle-stack previous", "cycle-focus previous")
SC073 & ]:: KomorebicShift("cycle-stack next", "cycle-focus next")


; Stack windows
SC073 & s:: KomorebicShift("stack-all", "unstack-all")

; Resize
SC073 & =:: KomorebicShift("resize-axis horizontal increase", "resize-axis vertical increase")
SC073 & -:: KomorebicShift("resize-axis horizontal decrease", "resize-axis vertical decrease")

; Manipulate windows
SC073 & t:: Komorebic("toggle-float")
SC073 & f:: Komorebic("toggle-monocle")
SC073 & p:: Komorebic("toggle-pause")

; Window manager options
;#+r:: Komorebic("retile")

; Layouts
SC073 & x:: Komorebic("flip-layout horizontal")
SC073 & y:: Komorebic("flip-layout vertical")

; Workspaces ; Move windows across workspaces
SC073 & 0:: KomorebicShift("focus-monitor-workspace 0 0", "move-to-monitor 0")
SC073 & 1:: KomorebicShift("focus-monitor-workspace 1 0", "move-to-monitor-workspace 1 0")
SC073 & 2:: KomorebicShift("focus-monitor-workspace 2 0", "move-to-monitor-workspace 2 0")
SC073 & 3:: KomorebicShift("focus-monitor-workspace 1 1", "move-to-monitor-workspace 1 1")
SC073 & 4:: KomorebicShift("focus-monitor-workspace 2 1", "move-to-monitor-workspace 2 1")
