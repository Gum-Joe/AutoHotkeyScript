; File to center align graphics
#Include ..\common\index.ahk

GraphicsCenterAlign_cb() {
  if not (PixelGetColor(1659, 154) = 0xB4B4B4) {
    MouseMove 1659, 154
  }

}

GraphicsCenterAlign() {
  EnsurePremiereSelected()
  SetWorkspace("Graphics")
  if not (PixelGetColor(1659, 154) = 0xB4B4B4) {
    Click 1647, 102
  }
  Click 1594, 303
  Click 1618, 301
}