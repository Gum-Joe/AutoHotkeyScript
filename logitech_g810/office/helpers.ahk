; Useful office functions
Global APP_WORD := "Word.Application"

; Show alt overlay
ShowOverlay() {
  Send "{LAlt}"
}

; Run a macro
RunMacro(app, macro) {
  if (app = APP_WORD) {
    oWord := ComObjActive(APP_WORD)
    oWord.Run(macro)
  }
}