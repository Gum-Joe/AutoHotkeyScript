; Auto export audio and close
; NOTE: Please do one save first to correct dir
#Include ../common/index.ahk

GoToNextAudacity() {
  if (not WinExist(APP_ID_AUDACITY)) {
    Run "explorer.exe"
  }
  ; Create a group with all audacity
  GroupAdd "theAudacity", APP_ID_AUDACITY
  ; If currently on one windows, go to the next
  if WinActive(APP_ID_EXE_AUDACITY) {
    GroupActivate "theAudacity", "r"
  } else {
    ; Else activate the last audacity
    WinActivate APP_ID_AUDACITY
  }
}

AutoExportAudacityAudio() {
  ; Press export combo
  Send "^+E"
  Sleep 1000
  Send "{Enter}" ; Close explorer
  Sleep 1000
  ; May get a file exists error
  While WinGetTitle("A") == "Warning" {
    ; Do nothing
    Send "{Enter}"
    Sleep 1000
  }
  Sleep 100
  Send "{Enter}" ; CLose attributes
  ; Wait to close
  Sleep 1000
  Loop {
    if (not WinActivate("ahk_class #32770")) {
      break
    }
  }
  ; Goto next
  Sleep 1000
  ;WinActivate APP_ID_AUDACITY
  WinClose()
  Sleep 1000
  GoToNextAudacity()
}

ExportAudacityAudio() {
  While WinExist(APP_ID_AUDACITY) {
    ExportAudacityAudio()
    Sleep 1000
  }
}