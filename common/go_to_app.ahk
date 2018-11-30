; Code to switch to an app if open, or launch it if not.

; app: Application striong to supply, with ahk_type included (i.e. ahk_class Premiere Pro)
GoToApp(app) {
  if (WinActive(app)) {
    ; Already active
    return true
  } else if (WinExist(app)) {
    ; Exists, switch to it
    WinActivate app
    return true
  } else {
    ; Not open
    return false
  }
}