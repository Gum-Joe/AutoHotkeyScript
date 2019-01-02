; Opens last download

OpenLastDownloadFirefox() {
  ; Open downloads thing
  Send "^j"
  ; Wait to open
  Sleep 100
  ; Get window title of downloads
  LibraryTitle := WinGetTitle("A")
  ; Enter to open
  Send "{Enter}"
  ; Switch and close library window
  WinActivate(LibraryTitle)
  Send "^W"
}