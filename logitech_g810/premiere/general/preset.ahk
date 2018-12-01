#Include ../common/index.ahk

preset(presetName) {
  BasePremiereFunctions()
  Send SHORTCUT_SHUTTLE_STOP ; another shortcut for Shuttle Stop. CTRL ALT SHIFT K. Set this in Premiere's shortcuts panel. ; Edited to what I use
  ;so if the video is playing, this will stop it. Othewise, it can mess up the script.
  Sleep 5
  ;Setting the coordinate mode is really important. This ensures that pixel distances are consistant for everything, everywhere.
  Coordmode "pixel", "Window"
  Coordmode "mouse", "Window"
  Coordmode "Caret", "Window"


  ;This (temporarily) blocks the mouse and keyboard from sending any information, which could interfere with the funcitoning of the script.
  BlockInput "SendAndMouse"
  BlockInput "MouseMove"
  BlockInput "On"

  SetKeyDelay 0 ;this ensures that any text AutoHotKey "types in," will input instantly, rather than one letter at a time.
  MouseGetPos xposP, yposP ;---stores the cursor's current coordinates at X%xposP% Y%yposP%
  Send "{mButton}" ;this will MIDDLE CLICK to bring focus to the panel underneath the cursor (the timeline). I forget exactly why, but if you create a nest, and immediately try to apply a preset to it, it doesn't work, because the timeline wasn't in focus...?
  Send SHORTCUT_EFFECTS_PANEL_ACTIVATE ;CTRL SHIFT ALT 7 --- you must set this in premiere's keyboard shortcuts menu to the "effects" panel

  sleep 20
  Send SHORTCUT_EFFECTS_PANEL_SEARCH ; Select find box shortcut
  sleep 20
  ; Any text in the Effects panel's find box has now been highlighted. There is also a blinking "text insertion point" at the end of that text. This is the vertical blinking line, or "caret."  

  ; Press backspace
  Send "{BS}"

  ; Type preset
  Send presetName
}