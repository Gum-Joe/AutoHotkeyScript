#SingleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; AHK V1

; Remaps Ctrl + Shift + V to paste text only

~^+V::
	if (WinActive("ahk_exe POWERPNT.EXE")) {
    ; Ensure on correct tab
    Send !hvt ; H: Home, V: Paste T: Text only
		;Sleep 500
		;MsgBox, "MEAP"
  }
Return
