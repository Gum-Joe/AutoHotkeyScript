; Application switcher for numpad
; The numpad is positioned to left of main keyboard for easy use

; Function to help switching apps
; From https://www.youtube.com/watch?v=OqyQABySV8k
appSwitcher(appClass, appPath) {
  groupName := "theWindowsOf" appClass
  ; If a windows is not open open one
  if not WinExist("ahk_class " appClass)
    Run appPath
  ; Create a group with all of them
  GroupAdd groupName, "ahk_class " appClass
  ; If currently on one windows, go to the next
  if WinActive("ahk_class " appClass) {
    GroupActivate groupName, "r"
  } else {
    ; Else activate the last window
    WinActivate "ahk_class " appClass
  }
}

; Explorer (NUM6)
Explorer() {
  appSwitcher("CabinetWClass", "explorer.exe")
}
ExplorerLaunch() {
  Run "explorer.exe"
}

; Firefox (NUM_+)
Firefox() {
  appSwitcher("MozillaWindowClass", "C:\Program Files\Mozilla Firefox\firefox.exe")
}
FirefoxLaunch() {
  Run "C:\Program Files\Mozilla Firefox\firefox.exe"
}

; VSCODE (NUM_-)
; Custom as all electron apps have same ahk_class
VSCode() {
  if (not WinExist("ahk_exe Code.exe")) {
    Run "code"
  }
  ; Create a group with all of them
  GroupAdd "theWindowsOfCode", "ahk_exe Code.exe"
  ; If currently on one windows, go to the next
  if WinActive("ahk_exe Code.exe") {
    GroupActivate "theWindowsOfCode", "r"
  } else {
    ; Else activate the last code
    WinActivate "ahk_exe Code.exe"
  }
}
VSCodeLaunch() {
  Run "code"
}

; Terminal (NUM5)
; Grouped to include git-bash, cmder, hyper, powershell, cmd
DEFAULT_TERMINAL := "C:\tools\Cmder\Cmder.exe" ; Cmder
Terminal() {
  if (not WinExist("ahk_group theWindowsOfTerminals")) {
    Run DEFAULT_TERMINAL
  }

  ; Create a group with all of them
  GROUP_NAME := "theWindowsOfTerminals"
  GroupAdd GROUP_NAME, "ahk_class ConsoleWindowClass" ; CMD, PowerShell
  GroupAdd GROUP_NAME, "ahk_class mintty" ; Git Bash
  GroupAdd GROUP_NAME, "ahk_class VirtualConsoleClass" ; Cmder
  GroupAdd GROUP_NAME, "ahk_exe Hyper.exe"

  ; If currently on one windows, go to the next
  if WinActive("ahk_group theWindowsOfTerminals") {
    GroupActivate "theWindowsOfTerminals", "r"
  } else {
    ; Else activate the last code
    WinActivate "ahk_group theWindowsOfTerminals"
  }
}
TerminalLaunch() {
  Run DEFAULT_TERMINAL
}

; Office Apps
; Word (NUM3)
Word() {
  appSwitcher("OpusApp", "C:\Program Files\Microsoft Office\root\Office16\WINWORD.exe")
}
WordLaunch() {
  Run "C:\Program Files\Microsoft Office\root\Office16\WINWORD.exe"
}

; Powerpoint (NUM2)
Powerpoint() {
  appSwitcher("PPTFrameClass", "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.exe")
}
PowerpointLaunch() {
  Run "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.exe"
}

; Excel (NUM1)
Excel() {
  appSwitcher("XLMAIN", "C:\Program Files\Microsoft Office\root\Office16\EXCEL.exe")
}
ExcelLaunch() {
  Run "C:\Program Files\Microsoft Office\root\Office16\EXCEL.exe"
}

; Adobe apps
; Premiere (NUM9)
Premiere() {
  appSwitcher("Premiere Pro", "C:\Program Files\Adobe\Adobe Premiere Pro CC 2019\Adobe Premiere Pro.exe")
}
PremiereLauncher() {
  Run "C:\Program Files\Adobe\Adobe Premiere Pro CC 2019\Adobe Premiere Pro.exe"
}