; Program to paste text only in word
#SingleInstance, force

^+V::
  if (WinActive("ahk_exe WINWORD.EXE")) {
    MouseGetPos OldPosX, OldPosY
    Click 28, 121
    Send T
    MouseMove OldPosX, OldPosY
  }
Return