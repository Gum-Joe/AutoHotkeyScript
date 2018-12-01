; Makes sure Premiere is selected
#Include ../../common/constants.ahk

EnsurePremiereSelected() {
  if (WinActive(APP_ID_PREMIERE)) {
    return
  } else {
    WinActivate APP_ID_PREMIERE
  }
}