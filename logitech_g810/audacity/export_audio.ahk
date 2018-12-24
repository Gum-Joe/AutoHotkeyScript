; Auto export audio and close
; NOTE: Please do one save first to correct dir
#Include ../common/index.ahk

AutoExportAudacityAudio() {
  ; Press export combo
  Send "^+E"
  Sleep 1000
  Send "{Enter}"
  Sleep 100
  Send "{Enter}"
  ; Wait to close
  Sleep 1000
  ; Goto next
  WinActivate APP_ID_AUDACITY
}