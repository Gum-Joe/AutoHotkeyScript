; Base functions for Premiere & Main common
; Designed for v2
#Include .\index.ahk
#Include .\ensure-selected.ahk
#Include .\set-workspace.ahk
#Include .\terminate.ahk

; Bas function to run at start of every hotkey
BasePremiereFunctions() {
  EnsurePremiereSelected()
}