; Program to set defaukt color
#SingleInstance, force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.


F4::
  if (WinActive("ahk_exe WINWORD.EXE")) {
    ; Ensure on correct tab
    Send {LAlt}H
    MouseGetPos OldPosX, OldPosY
    Click 410, 118
    MouseMove OldPosX, OldPosY
  }
Return