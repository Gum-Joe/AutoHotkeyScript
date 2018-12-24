; Script to launch apps when I press a certain key on the ^!Numpad7
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; Adobe apps
^!Numpad7::
  Run, "C:\Program Files\Adobe\Adobe Premiere Pro CC 2018\Adobe Premiere Pro.exe"
Return
^!Numpad8::
  Run, "C:\Program Files\Adobe\Adobe After Effects CC 2018\Support Files\AfterFX.exe"
Return
^!Numpad9::
  Run, "C:\Program Files\Adobe\Adobe Illustrator CC 2018\Support Files\Contents\Windows\Illustrator.exe"
Return
^!Numpad6::
  Run, "C:\Program Files\Adobe\Adobe Audition CC 2018\Adobe Audition CC.exe"
Return

; General Apps
; From https://www.youtube.com/watch?v=OqyQABySV8k
^!Numpad4::
  ; If a windows is not open open one
  IfWinNotExist ahk_class MozillaWindowClass
    Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
  ; Create a group with all firefoxes
  GroupAdd, theFoxes, ahk_class MozillaWindowClass
  ; If currently on one windows, go to the next
  if WinActive("ahk_exe firefox.exe") {
    GroupActivate, theFoxes, r
  } else {
    ; Else activate the last explorer
    WinActivate, ahk_class MozillaWindowClass
  }
Return

; From https://www.youtube.com/watch?v=OqyQABySV8k
^!Numpad5::
  ; If a windows is not open open one
  IfWinNotExist ahk_class CabinetWClass
    Run, "explorer.exe"
  ; Create a group with all explorers
  GroupAdd, theExplorers, ahk_class CabinetWClass
  ; If currently on one windows, go to the next
  if WinActive("ahk_exe explorer.exe") {
    GroupActivate, theExplorers, r
  } else {
    ; Else activate the last explorer
    WinActivate, ahk_class CabinetWClass
  }
Return

^!Numpad1::
  Run, "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.exe"
Return
^!Numpad2::
  Run, "C:\Program Files\Microsoft Office\root\Office16\WINWORD.exe"
Return
^!Numpad3::
  Run, "C:\Program Files\Microsoft Office\root\Office16\EXCEL.exe"
Return

^!i::
  Run, "itunes.exe"
Return

; For easy numpad typing
NumpadSub::
  Send {BackSpace}
Return

; For easy desktop switching
$1::
  WinGetTitle Title, A
  if (WinActive("ahk_exe explorer.exe") and Title = "Task View") {
    Click 118, 63
  } else {
    Send 1 ; Don't block
  }
Return
$2::
  WinGetTitle Title, A
  if (WinActive("ahk_exe explorer.exe") and Title = "Task View") {
    Click 280, 63
  } else {
    Send 2 ; Don't block
  }
Return
$3::
  WinGetTitle Title, A
  if (WinActive("ahk_exe explorer.exe") and Title = "Task View") {
    Click 450, 63
  } else {
    Send 3 ; Don't block
  }
Return
$4::
  WinGetTitle Title, A
  if (WinActive("ahk_exe explorer.exe") and Title = "Task View") {
    Click 620, 63
  } else {
    Send 4 ; Don't block
  }
Return
$5::
  WinGetTitle Title, A
  if (WinActive("ahk_exe explorer.exe") and Title = "Task View") {
    Click 780, 63
  } else {
    Send 5 ; Don't block
  }
Return