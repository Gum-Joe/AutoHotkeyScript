; Script to auto set print settings
; For Office 365
; AHK v2
; Mapping: P

SetPrint() {
  Send "^p"
  Sleep 250
  Loop 3 {
    Send "{Tab}" ; Select Printer Properties
  }
  Sleep 250
  Send "{Enter}"
  Sleep 250
  Loop 3 {
    Send "{Tab}" ; Highlight settings
  }
  Sleep 250

  ; Which settings to set?
  ; The dialog auto focuses the current quality setting
  ; So we can use it to check the current quality.
  FocusedHwnd := ControlGetFocus(WinGetTitle("ahk_class #32770"))
  FocusedClassNN := ControlGetClassNN(FocusedHwnd)
  
  ; Set to draft (Button5)
  if (FocusedClassNN != "Button5") {
    if (FocusedClassNN = "Button4") {
      ; Normal, go along one
      Send "{Right}"
    } else if (FocusedClassNN = "Button3") {
      ; Best, go along two
      Send "{Right}"
      Send "{Right}"
    }
    ; If not a button, it isn't handled
  }

  ; Finalise as mode set, press enter
  Send "{Enter}"
}