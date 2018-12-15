; Sets headers in word
#Include helpers.ahk

SetHeader1() {
  ; Ideally direct fire would be used,
  ; but that doesn't work
  ; so instead a keyboard hotkey is sent which triggers a macro.
  Send "^+!{F4}"
  ; RunMacro(APP_WORD, 'SetHeader1') ; If it worked.
}

SetHeader2() {
  ; Ideally direct fire would be used,
  ; but that doesn't work
  ; so instead a keyboard hotkey is sent which triggers a macro.
  Send "^+!{F5}"
  ; RunMacro(APP_WORD, "SetHeader2") ; If it worked.
}

SetHeader3() {
  ; Ideally direct fire would be used,
  ; but that doesn't work
  ; so instead a keyboard hotkey is sent which triggers a macro.
  Send "^+!{F6}"
  ; RunMacro(APP_WORD, "SetHeader3") ; If it worked.
}

SetTitle() {
  ; Ideally direct fire would be used,
  ; but that doesn't work
  ; so instead a keyboard hotkey is sent which triggers a macro.
  Send "^+!{F7}"
  ; RunMacro(APP_WORD, "SetTitle") ; If it worked.
}