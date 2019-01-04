; From https://www.youtube.com/watch?v=OqyQABySV8k
#Include constants.ahk

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