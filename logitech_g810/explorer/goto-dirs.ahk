; Functions for navigating to different dirs
#Include constants.ahk
#Include ../common/constants.ahk

; Goto dir
GotoDir(dir) {
  if (WinActive(APP_ID_EXPLORER) or WinActive("ahk_class #32770")) {
    Send "!D"
    Sleep 50
    Send dir
    Send "{Enter}"
  } else {
    Run dir
  }
}

; Goto H/W DIR
GotoHomework() {
  GotoDir(HOMEWORK_ROOT CURRENT_YEAR)
}

; Go to German stuff
GotoHomeworkGerman() {
  GotoDir(HOMEWORK_ROOT CURRENT_YEAR "\German")
}

; Goto Assets DIR
GotoYTAssets() {
  GotoDir(ASSET_PATH)
}

; Goto Core Assets DIR
GotoYTCoreAssets() {
  GotoDir(ASSET_PATH "\Core Assets")

}