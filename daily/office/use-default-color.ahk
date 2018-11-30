; Program to set defaukt color
#SingleInstance, force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.


F4::
  if (WinActive("ahk_exe WINWORD.EXE")) {
    MouseGetPos OldPosX, OldPosY
    Click 397, 123
    MouseMove OldPosX, OldPosY
  }
Return