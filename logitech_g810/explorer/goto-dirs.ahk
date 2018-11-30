; Functions for navigating to different dirs
#Include constants.ahk
#Include ../common/constants.ahk

; Goto dir
GotoDir(dir) {
  if (WinActive(APP_ID_EXPLORER)) {
    Send "!D"
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