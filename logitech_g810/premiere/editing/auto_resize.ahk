; Hold down this hotkey to auto set frame to size

AutoResize() {
  KeyWait LButton
  MouseMove 10, 0,,R
  Click
  Send NumpadMult
}