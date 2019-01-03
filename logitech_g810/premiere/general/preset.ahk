; Script to add a transition
#Include ../common/index.ahk

; Colours for finding icons
Global COLOUR_AUDIO := 0x4B4B4B
Global COLOUR_AUDIO_SELECTED := 0x646464
Global COLOUR_VIDEO := 0x3D3D3D
Global COLOUR_VIDEO_SELECTED := 0xA4A4A4

; Currently only supports adding to end and inbetween for transition
; Can also be used for effects
preset(name, isTransition := false) {
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
  Send name
  Send "{Enter}"
  Send SHORTCUT_EFFECTS_PANEL_ACTIVATE
  Sleep 100

  ; Step 4: bring mouse to preset
  ; Get info about effects panel
  ControlGetPos EffectsX, EffectsY, EffectsWidth, EffectsHeight, controlEffects, WinGetTitle("A")

  ; Step 5: Search for the effects
  ; Use ImageSearch t
  ;resultCode := ImageSearch(PresetX, PresetY, EffectsX, EffectsY, EffectsX + EffectsWidth, EffectsY + EffectsHeight, SCRIPT_ASSET_LIST["transitionIcon"])
  ; Wrapper to make search easier
  _searcher(target, isPicture := False) {
    code := 0
    if not isPicture {
      code := PixelSearch(PresetX, PresetY, EffectsX + 20, EffectsY + 50, EffectsX + EffectsWidth, EffectsY + EffectsHeight, target)
    } else {
      code := ImageSearch(PresetX, PresetY, EffectsX + 20, EffectsY + 50, EffectsX + EffectsWidth, EffectsY + EffectsHeight, target)
    }

    return {
      code: code,
      x: PresetX,
      y: PresetY
    }
  }

  ; Search for first the colours of each icon, then icons with a pic
  result := _searcher(COLOUR_VIDEO)
  if result.code == 1 {
    _mouseMover(result.x, result.y, isTransition)
    return
  }

  result := _searcher(COLOUR_VIDEO_SELECTED)
  if result.code == 1 {
    _mouseMover(result.x, result.y, isTransition)
    return
  }

  result := _searcher(COLOUR_AUDIO)
  if result.code == 1 {
    _mouseMover(result.x, result.y, isTransition)
    return
  }

  result := _searcher(COLOUR_AUDIO_SELECTED)
  if result.code == 1 {
    _mouseMover(result.x, result.y, isTransition)
    return
  }

  ; Do search by pic
  result := _searcher(SCRIPT_ASSET_LIST.icons.effects.transitionIcon, True)
  if result.code == 1 {
    _mouseMover(result.x, result.y, isTransition)
    return
  }

  result := _searcher(SCRIPT_ASSET_LIST.icons.effects.transitionIconAlt, True)
  if result.code == 1 {
    _mouseMover(result.x, result.y, isTransition)
    return
  }

  ;MsgBox Result.x
  ;resultCode := PixelSearch(PresetX, PresetY, EffectsX, EffectsY + 50, EffectsX + EffectsWidth, EffectsY + EffectsHeight, 0x3D3D3D)
  ;if (resultCode == 0) {
  ;  ;ImageSearch(PresetX, PresetY, EffectsX, EffectsY, EffectsX + EffectsWidth, EffectsY + EffectsHeight, SCRIPT_ASSET_LIST["transitionIconAlt"]) ; For if transition is selected
  ;  PixelSearch(PresetX, PresetY, EffectsX, EffectsY + 50, EffectsX + EffectsWidth, EffectsY + EffectsHeight, 0x454545)
  ;}
}

_mouseMover(PresetX, PresetY, isTransition := false) {
  ; Find colour to look for
  colourToLookFor := 0xDDDDDD
  if isTransition {
    colourToLookFor := 0xff0000
  }

  MouseMove PresetX, PresetY
  ; Step 6: Find where to put
  ; Activate Timeline
  Send SHORTCUT_TIMELINES_ACTIVATE
  Sleep 100
  ; Get dimensions
  controlTimeline := ControlGetClassNN(ControlGetFocus("A"))
  ControlGetPos TimelineX,TimelineY, TimelineWidth, TimelineHeight, controlTimeline, WinGetTitle("A")
  ; Look for red, which the hightlighted edge to put transition
  PixelSearch DestX, DestY, TimelineX, TimelineY, TimelineX + TimelineWidth, TimelineY + TimelineHeight, colourToLookFor
  ; Step 6: DRAG
  MouseClickDrag "L", , , DestX, DestY
}

; Wrapper around preset() for transitions
addTransition(name) {
  preset(name, true)
}