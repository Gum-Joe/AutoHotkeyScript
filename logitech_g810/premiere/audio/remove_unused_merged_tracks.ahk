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
  
  ; Wait until open
  WinWaitActive "ahk_class #32770"
  Sleep 200

  ; Even open, may not have rendered. Move to centre and wait to go a certain colour
  ; WinGetPos , , Width, Height, "A"
  ; Loop PixelGetColor(Width / 2, Height / 2) != 0x1D1D1D {
  ;   OutputDebug "Waiting"
  ;   Sleep 100 
  ; }

  ; Highlight channel number
  Loop 5 {
    Send "{Tab}"
  }
  Send 1
  Sleep 50 ; WAIT for change

  ; Click off
  Click 343, 367
  ; Select box 3
  Click 168, 197
  ; WAIT
  Sleep 50
  ; Hit enter to close
  Send "{Enter}"
}