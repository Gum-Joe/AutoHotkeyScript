; Since I can't directly open files in audition without extracting audio]
; This hotkey is needed
; Only works from bin
#Include ../common/index.ahk
#Include ../../common/index.ahk

OpenInAudition() {
  ; Step 1: Get clip info
  Send SHORTCUT_GET_PROPERTIES
  Sleep 100
  WinActivate "ahk_class DroverLord - Window Class"
  ; Click in thw windows that comes up so we can copy it's text
  ControlGetPos WinX, WinY, WinWidth, WinHeight, "Edit1", "ahk_class DroverLord - Window Class"
  ; Search the window for a grey pixel, the colour of the text box
  PixelSearch GreyX, GreyY, WinX, WinY, WinX + WinWidth, WinY + WinHeight, 0xE8E8E8
  ; Click
  Click GreyX, GreyY
  ; Drag down
  MouseClickDrag "L", GreyX, GreyY, GreyX, GreyY + 500
  ; Step 2: Copy
  Click GreyX, GreyY, "R"
  Send "C"
  Sleep 100
  ; Step 3: Retrieve path from line 1
  Path := ""
  Loop Parse, Clipboard, "`n", "`r" {
    Path := SubStr(A_LoopField, StrLen("File Path: ")) ; Remove "File Path: " off start
    break
  }
  ; Step 4: Go to Audition
  appSwitcher("audition11", APP_PATH_AUDITION)
  Sleep 100
  ; Step 5: Run "Open" And type it
  WinActivate "ahk_exe Adobe Audition CC.exe"
  SLeep 100
  Send "^o" ; For some reason ^O and ^o are different
  Sleep 500
  ; Type it
  Send Path
  Send "{Enter}"
  ; OPEN!
}