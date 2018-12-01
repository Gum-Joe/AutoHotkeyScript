; Line spacing
#Include helpers.ahk

; Focuses line space, then use buttons on main to select
FocusLineSpacing() {
  ShowOverlay()
  Send "H"
  Send "K"
  ; Hotkey 1,, "On"
  ; Hotkey 2,, "On"
}

/**
1::
  Send "{Down}"
  Send "{Enter}"
  Exit
Return

2::
  Send "{Down}"
  Send "{Down}"
  Send "{Down}"
  Send "{Enter}"
  Exit
Return

Hotkey 1,, "Off"
Hotkey 2,, "Off"
*/