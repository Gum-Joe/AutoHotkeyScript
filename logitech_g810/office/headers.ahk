; Sets headers in word
#Include helpers.ahk

SetHeader1() {
  ; Ideally direct fire would be used,
  ; but that doesn't work
  ; so instead a keyboard hotkey is sent which triggers a macro.
  Send "^+!{F4}"
  ; RunMacro(APP_WORD, "SetHeader1") ; If it worked.
}