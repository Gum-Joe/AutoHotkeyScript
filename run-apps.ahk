; Script to launch apps when I press a certain key on the ^!Numpad7
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; From https://www.youtube.com/watch?v=OqyQABySV8k
appSwitcher(appClass, appPath) {
  groupName := "theWindowsOf" appClass
  ; If a windows is not open open one
  IfWinNotExist ahk_class %appClass%
    Run %appPath%
  ; Create a group with all of them
  GroupAdd %groupName%, ahk_class %appClass%
  ; If currently on one windows, go to the next
  if WinActive("ahk_class " appClass) {
    GroupActivate %groupName%, r
  } else {
    ; Else activate the last explorer
    WinActivate ahk_class %appClass%
  }
}

; Adobe apps
^!Numpad7::
  Run, "C:\Program Files\Adobe\Adobe Premiere Pro CC 2019\Adobe Premiere Pro.exe"
Return
; ^!Numpad8::
;   Run, "C:\Program Files\Adobe\Adobe After Effects CC 2019\Support Files\AfterFX.exe"
; Return
^!Numpad8::
  Run, "C:\Program Files\Adobe\Adobe Illustrator CC 2018\Support Files\Contents\Windows\Illustrator.exe"
Return
^!Numpad9::
  Run, "C:\Program Files\Adobe\Adobe Audition CC 2018\Adobe Audition CC.exe"
Return

; VSCODE
; Custom version as all electron apps have same ahk_class
!Numpad6::
  IfWinNotExist ahk_exe Code.exe
    Run code
  ; Create a group with all of them
  GroupAdd theWindowsOfCode, ahk_exe Code.exe
  ; If currently on one windows, go to the next
  if WinActive("ahk_exe Code.exe") {
    GroupActivate theWindowsOfCode, r
  } else {
    ; Else activate the last code
    WinActivate ahk_exe Code.exe
  }
Return
^!Numpad6::
  Run, "code"
Return

; General Apps
; Firefox
#IfWinNotActive ahk_class OpusApp
!Numpad4::
  appSwitcher("MozillaWindowClass", "C:\Program Files\Mozilla Firefox\firefox.exe")
Return
^!Numpad4::
  Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
Return
#IfWinNotActive

#IfWinActive ahk_class OpusApp
^!Numpad4::
  appSwitcher("MozillaWindowClass", "C:\Program Files\Mozilla Firefox\firefox.exe")
Return

^!+Numpad4::
  Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
Return
#IfWinActive

; Explorer
!Numpad5::
  appSwitcher("CabinetWClass", "explorer.exe")
Return
^!Numpad5::
  Run, "explorer.exe"
Return

; Word
^!Numpad1::
  appSwitcher("OpusApp", "C:\Program Files\Microsoft Office\root\Office16\WINWORD.exe")
Return
^!+Numpad1::
  Run, "C:\Program Files\Microsoft Office\root\Office16\WINWORD.exe"
Return

^!Numpad2::
  Run, "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.exe"
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