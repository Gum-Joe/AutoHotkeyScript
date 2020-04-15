#Include ..\common\index.ahk
#Include remove_unused_merged_tracks.ahk
#Include open_in_audition.ahk
#Include essential.ahk

EssentialAudioPresetBlueYeti_cb() {
  Click 1764, 290 ; Sekect Dialogue
  Click 1724, 211 ; Open Presets
  Loop 4 {
    Send Down ; Select
  }
  Send Enter ; Select it
  Return
}



;Ok:
;  Gui.Destroy()
;return