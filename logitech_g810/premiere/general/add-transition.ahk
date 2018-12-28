; Script to add a transition
#Include ../common/index.ahk

addTransition(transition) {
  BasePremiereFunctions()

  ; Step 0: Get current mouse coords
  MouseGetPos, CurrentX, CurrentY

  ; Step 1: Highlight effect panel box
  Send SHORTCUT_EFFECTS_PANEL_ACTIVATE

  ; Steo 2: Select find box
  Sleep 20
  Send SHORTCUT_EFFECTS_PANEL_SEARCH ; Select find box shortcut

  ; Step 3: Clear & type what we want
  ; Press backspace
  Send "{BS}"
  ; Type preset
  Send presetName

  ; Step 4: bring mouse to preset

}
