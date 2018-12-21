; Automatically switches to master effects
#Include ../common/index.ahk

GoToMasterEffects() {
  BasePremiereFunctions()
  ; Active effects
  Send SHORTCUT_EFFECTS_CONTROLS_ACTIVATE
  ; Get current pos
  MouseGetPos CurrentPosX, CurrentPosY
  ; Click
  Click 31, 100
  ; Move
  MouseMove CurrentPosX, CurrentPosY
}