; Allows darg and drop to be used to copy effects from one clip to another
#Include ../common/index.ahk

DrapCopyEffects() {
  BasePremiereFunctions()

  KeyWait "LButton", "D"
  MouseGetPos EffectX, EffectY
  KeyWait "LButton"
  MouseGetPos ClipX, ClipY
  ; Move to effects panel
  MouseMove EffectX, EffectY
  ; Click item to copy
  Click "right"
  Loop 5 {
    Send "{Down}"
  }
  Send "Enter"
  MouseMove ClipX, ClipY ; Click the clip
  Click
  MouseMove EffectX, EffectY
  Click "right"
  Loop 6 {
    Send "Down"
  }
  Send "Enter"
}