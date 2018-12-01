; File generated by 2Keys
; 2Keys AutoHotkey entry point

; Default AHK stuff
;#SingleInstance, force ; Uncomment this line if using AutoHotkey < v2
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; CONVERSION NOTICE 1
; All your hotkeys need to changed to functions
; Then, include the function to run in your config under the key mapping.
; The script with the function in should then be included below.
; See https://github.com/Gum-Joe/2Keys for help

; CONVERSION NOTICE 2
; Since the keyboards are plugged into a separte computer (the detector)
; You can't get keyboard states (and info. about the keyboards) using AutoHotkeys
; Soon we'll be adding a set of core libraries which will allow you to do, i.e.:
; #Include <2Keys/keyboards>
; keyboards.getState(keyboard, key)
; Syntax is subject to change

; CONVERSION NOTICE 3
; Depending on the version of AutoHotkey 2Keys is using
; You may need to migrate your scripts to AutoHotkey v2

; Include all your AutoHotkey scripts here
; i.e. #Include "run-apps.ahk"

; Common stuff
#Include ./common/index.ahk

; Hotkey dirs
#Include ./premiere/index.ahk
#Include ./office/index.ahk
#Include ./explorer/index.ahk
#Include ./general/index.ahk

; Common trigger check
WinActiveOffice() {
  return (WinActive(APP_ID_WORD) or WinActive(APP_ID_POWERPOINT) or WinActive(APP_ID_EXCEL))
}

; Triggers HotKey for letter P
TriggerP() {
  if (WinActive(APP_ID_WORD) or WinActive(APP_ID_POWERPOINT) or WinActive(APP_ID_EXCEL)) {
    SetPrint()
  } else if (WinActive(APP_ID_PREMIERE)) {
    OutputDebug "None set"
  }
}

; Trigger for F1
TriggerF1() {
  GotoHomework()
}

; Trigger for F2
TriggerF2() {
  GotoYTAssets()
}

; Trigger for F3
TriggerF3() {
  GotoYTCoreAssets()
}

; Trigger for 1
Trigger1() {
  if (WinActiveOffice()) {
    SetHeader1()
  }
}

TriggerL() {
  if (WinActive(APP_ID_WORD)) {
    FocusLineSpacing()
  }
}

TriggerF24CA() {
  ;Send "{F24 down}"
  Send "{Ctrl}A"
  ;Send "{F24 up}"
}