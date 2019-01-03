; Hold down this hotkey to auto set frame to size
#Include ../common/index.ahk

AutoResize() {
  KeyWait LButton
  MouseMove 10, 0,,R
  Click
  Send NumpadMult
}

; Insert a selected clip from bin and type "*" to Set Frame to Size
InsertAndAutoResize() {
  MsgBox "DISABLED"
}