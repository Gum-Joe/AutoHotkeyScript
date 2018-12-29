; Script to add a transition
#Include ../common/index.ahk

; Currently only supports adding to end and inbetween
addTransition(transition) {
  BasePremiereFunctions()
  ; Step 0: Get current mouse coords
  MouseGetPos CurrentX, CurrentY

  ; Step 1: Highlight effect panel box
  Send SHORTCUT_EFFECTS_PANEL_ACTIVATE
  Sleep 100
  controlEffects := ControlGetClassNN(ControlGetFocus("A"))
  Sleep 100

  ; Steo 2: Select find box
  Send SHORTCUT_EFFECTS_PANEL_SEARCH ; Select find box shortcut
  sleep 100
  ; Step 3: Clear & type what we want
  ; Press backspace
  Send "{BS}"
  Sleep 100
  ; Type preset
  Send transition
  Send "{Enter}"
  Send SHORTCUT_EFFECTS_PANEL_ACTIVATE
  Sleep 100

  ; Step 4: bring mouse to preset
  ; Get info about effects panel
  ControlGetPos EffectsX, EffectsY, EffectsWidth, EffectsHeight, controlEffects, WinGetTitle("A")
  ; Use ImageSearch
  resultCode := ImageSearch(PresetX, PresetY, EffectsX, EffectsY, EffectsX + EffectsWidth, EffectsY + EffectsHeight, SCRIPT_ASSET_LIST["transitionIcon"])
  if (resultCode == 0) {
    ImageSearch(PresetX, PresetY, EffectsX, EffectsY, EffectsX + EffectsWidth, EffectsY + EffectsHeight, SCRIPT_ASSET_LIST["transitionIconAlt"]) ; For if transition is selected
  }
  MouseMove PresetX, PresetY

  ; Step 5: Find where to put
  ; Activate Timeline
  Send SHORTCUT_TIMELINES_ACTIVATE
  Sleep 100
  ; Get dimensions
  controlTimeline := ControlGetClassNN(ControlGetFocus("A"))
  ControlGetPos TimelineX,TimelineY, TimelineWidth, TimelineHeight, controlTimeline, WinGetTitle("A")
  ; Look for red, which the hightlighted edge to put transition
  PixelSearch DestX, DestY, TimelineX, TimelineY, TimelineX + TimelineWidth, TimelineY + TimelineHeight, 0xff0000
  ; Step 6: DRAG
  MouseClickDrag "L", , , DestX, DestY
}

; My acutal transitions
TransitionDipToBlack() {
  addTransition("Dip to Black")
}