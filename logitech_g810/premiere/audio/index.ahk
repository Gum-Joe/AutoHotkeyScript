#Include ..\common\index.ahk

EssentialAudioPresetBlueYeti_cb() {
  Click 1764, 290 ; Sekect Dialogue
  Click 1724, 211 ; Open Presets
  Loop 4 {
    Send Down ; Select
  }
  Send Enter ; Select it
  Return
}

EssentialAudioPresetBlueYeti() {
  ; Base HotKey code
  BasePremiereFunctions()
  ; Verify Audio mode is selected
  SetWorkspace("Audio")
  Return
}

;Ok:
;  Gui.Destroy()
;return