#SingleInstance, force
; Script to set powerpoint to a4 landscape
F7::
    WinActivate, POWERPNT.EXE
    MouseMove, 211, 49
    Click
    MouseMove, 27, 84
    Click
    MouseMove, 173, 57
    Click
    Loop 6 {
        Send {Down}
    }
    Send {Enter}
    Send {Enter}
Return