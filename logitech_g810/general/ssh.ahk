; Autossh into Pi
#Include ../common/constants.ahk

SSHPi() {
  ; Run Git Bash
  ;if (not WinActive(APP_ID_GIT_BASH)) {
  ;  if (not WinExist(APP_ID_GIT_BASH)) {
  ;    Run APP_PATH_GIT_BASH
  ;  } else {
  ;    WinActivate APP_ID_GIT_BASH
  ;  }
  ;}

  Run APP_PATH_GIT_BASH ; Open
  Sleep 500
  WinActivate APP_ID_GIT_BASH
  Send "ssh pi@192.168.0.100{Enter}" ; Type command
}