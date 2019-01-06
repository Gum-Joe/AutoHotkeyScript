; Script to auto set print settings
; For Office 365
; AHK v2
; Mapping: P
#Include helpers.ahk

_setPrintQuality() {
  ; Set to draft (Button5)
  ControlFocus "Button5", "A"
}

_setPrintLayout() {
  ; Focus setting for double sided
  ControlFocus "ComboBox2", "A"
  Send "{Down}"
  ; Press Up 3 times to get to top
  Loop 3 {
    Send "{Up}"
  }
  ; Go down to "Flip on lon edge"
  Send "{Down}"
}

SetPrint() {
  Send "^p"
  SLeep 500
  ; Open Print Props
  Send "!PR"

  ; Which settings to set?
  ; The dialog auto focuses the current quality setting
  ; So we can use it to check the current quality.
  FocusedHwnd := ControlGetFocus(WinGetTitle("ahk_class #32770"))
  FocusedClassNN := ControlGetClassNN(FocusedHwnd)
  
  ; Ensure on correct tab
  WinText := WinGetText("A")
  ; MsgBox WinText
  if InStr(WinText, "Layout") {
    _setPrintLayout()
    Send "^{Tab}"
    Sleep 500
    _setPrintQuality()
  } else {
    ; On Quality settings
    _setPrintQuality()
    Send "^{Tab}"
    Sleep 500
    _setPrintLayout()
  }

  ; Finalise as mode set, press enter
  Sleep 500
  ControlGetPos OKX, OKY, , , "OK", "A"
  Click OKX, OKY
}