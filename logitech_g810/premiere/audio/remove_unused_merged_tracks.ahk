; This script:
; 1. Opens audio props panel
; 2. Sets a merged clip to only 1 track
; 3. Sets the one track to the synced audio
; USE FROM THE BIN
#Include ../common/index.ahk

RemoveUnusedMergedTracks() {
  BasePremiereFunctions()

  ; Open audio channel
  Send SHORTCUT_BINS_AUDIO_CHANNELS
  Sleep 100

  ; Highlight channel number
  Loop 5 {
    Send "{Tab}"
  }
  Send 1

  ; Click off
  Click 343, 367
  ; Select box 3
  Click 168, 197
  ; Hit enter to close
  Send "{Enter}"
}