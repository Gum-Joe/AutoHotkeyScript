; Generates new Pr Project
#Include ../common/constants.ahk

Global CategoryGUI

GenerateNewPremiereProject() {
  ; Step 1  : select category
  CategoryGUI := GuiCreate("", "Create New Pr Project")
  CategoryGUI.Add("Text",, "Select a category")
  Categories := "Sketches|Tech|Misc|Bluey & Munch|Politics|RapidJoe|Unboxing|What If"
  Category := CategoryGUI.Add("ComboBox", "vCategory", Categories)
  OKBTN := CategoryGUI.Add("Button", "Default w80", "OK")
  CategoryGUI.Show
  OKBTN.OnEvent("Click", "Handle_Click")
  ; Step 1: Is Premiere open?
  ;if (not GoToApp("ahk_class Premiere Pro")) {
  ;  ; Open
  ;  Run "C:\Program Files\Adobe\Adobe Premiere Pro CC 2018\Adobe Premiere Pro.exe"
  ;}

  ; Step 2, are we at start page?

}

Handle_Click() {
  Category := CategoryGUI.Submit()["Category"] ; Get it
  ; Step 2: Ask for a proj. name
  Name := InputBox("What is the name of the project?", "Name")
  
  ; MKDIR
  DirCreate "Y:\" Category "\" Name
  if ErrorLevel 
    MsgBox A_LastError
  
  ; Create Folders
  OutputDebug "Creating folders..."
  PROJECT_ROOT := YOUTUBE_PATH Category "\" Name
  Mkdir(PROJECT_ROOT "\Footage")
  Mkdir(PROJECT_ROOT "\Footage\Audio")
  Mkdir(PROJECT_ROOT "\Graphics")
  Mkdir(PROJECT_ROOT "\Audio")
  Mkdir(PROJECT_ROOT "\Compositions")

  OutputDebug "Adding a default INCLUDE.txt..."
  FileCopy(DEFAULT_INCLUDE_TXT, PROJECT_ROOT "\INCLUDE.txt")

  OutputDebug "Creating Pr Project..."
  if (not WinExist("ahk_class " PREMIERE_CLASS)) {
    Run PREMIERE_PATH
    MsgBox "Press enter once Premiere has finished loading.",,4096
  } 
  WinActivate "ahk_class " PREMIERE_CLASS
  Send "{Alt}"
  Send "F"
  Send "{Enter}"
  Send "{Enter}"
  Sleep 1000

  OutputDebug "Enabling Injest..."
  NEW_PROJECT_CLASS := "ahk_class #32770"
  WinActivate NEW_PROJECT_CLASS ; Activate new project box
  Click 236, 90 ; Select Injest tab
  Click 77, 135 ; Enable Injest
  Send "{Tab}"
  Loop 2 {
    Send "{Down}" ; Select create proxies
  }
  Send "{Tab}"
  Loop 2 {
    Send "{Down}" ; Select CINEFOMR
  }
  Loop 2 {
    Send "{Tab}"
  }
  Loop 3 {
    Send "{Down}" ; Open dialog and select dir
  }
  ControlSetText "Edit2", DIR_CINEFORM_PROXIES, NEW_PROJECT_CLASS
}

Mkdir(dir) {
  DirCreate dir
  if ErrorLevel 
    MsgBox A_LastError
}