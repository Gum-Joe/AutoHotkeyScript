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
  MsgBox Path
  appSwitcher("audition11", APP_PATH_AUDITION)
  Sleep 100
  ; Step 5: Run "Open" And type it
  WinActivate "ahk_exe Adobe Audition CC.exe"
  WinGetPos Win2X, Win2Y, Win2Width, Win2Height, WinGetTitle("A")
  MouseMove Win2X, Win2Y
  SLeep 1000
  MouseMove Win2X + Win2Width, Win2Y + Win2Height
  SLeep 2000
  PixelSearch OpenX, OpenY, Win2X, Win2Y, Win2X + Win2Width, Win2Y + Win2Height, 0xE7E7E7
  MouseMove OpenX, OpenY
  SendInput "{!}F"
  Sleep 100
}