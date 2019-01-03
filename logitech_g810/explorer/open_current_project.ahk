; Script to open current project i'm working on
#Include goto_dirs.ahk
#Include ../common/index.ahk


OpenCurrentProjectFolderEditing() {
  CurrentProj := IniRead(CONFIG_FILE, "dirs", "current_project_editing")
  GotoDir(CurrentProj)
}

; Open the actual premiere file from above
OpenCurrentProjectEditingApp() {
  CurrentProjFolder := IniRead(CONFIG_FILE, "dirs", "current_project_editing")
  CurrentProjName := IniRead(CONFIG_FILE, "dirs", "current_project_editing_file")
  Run CurrentProjFolder CurrentProjName
}

OpenCurrentProjectFolderProgramming() {
  CurrentProj := IniRead(CONFIG_FILE, "dirs", "current_project_programming")
  GotoDir(CurrentProj)
}