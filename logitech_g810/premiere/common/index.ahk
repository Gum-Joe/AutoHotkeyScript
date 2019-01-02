; Base functions for Premiere & Main common
; Designed for v2
#Include ensure_selected.ahk
#Include set_workspace.ahk
#Include terminate.ahk
#Include ../../common/constants.ahk
#Include shortcuts.ahk

; Bas function to run at start of every hotkey
BasePremiereFunctions() {
  EnsurePremiereSelected()
}