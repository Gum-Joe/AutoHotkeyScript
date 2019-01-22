; Terminate script in the event of an emergency (i.e. Infinity loop)
#Include ../common/index.ahk

TerminateScript() {
  ExitApp 130
}

TerminatePremiere() {
  ProcessClose "Adobe Premiere Pro.exe"
}

; ahk_class ADOBEGCCLIENT
; ahk_exe AdobeGCClient.exe
TerminateGCClient() {
  ProcessClose "AdobeGCClient.exe"
}

; Doing this too often
RestartPremiere() {
  TerminatePremiere()
  Sleep 100
  ; OpenCurrentProjectEditingApp()
  ; Func above couldn't be used as I think it makes a circular dep.
  CurrentProjFolder := IniRead(CONFIG_FILE, "dirs", "current_project_editing")
  CurrentProjName := IniRead(CONFIG_FILE, "dirs", "current_project_editing_file")
  Run CurrentProjFolder CurrentProjName
}