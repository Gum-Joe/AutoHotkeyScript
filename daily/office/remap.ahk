; Remap Ctrl+Shift+z -> Ctrl+Y to be consistent with other apps
#SingleInstance, force

^+Z::
  if (WinActive("ahk_exe WINWORD.EXE")) {
    SendInput ^Y
    return
  } else {
    Send ^+Z
    return
  }
Return