#SingleInstance, force
; Script to create file
; Active atom
Options = JS|JSX|SCSS|CSS|HTML|Markdown|JSON|YAML|C++|C|Python|Ruby|Docker File
; Create GUI
F8::
  ; Add Stuff
  Gui, Add, Text, , File Type: ; Label
  Gui, Add, DropDownList, w280, %Options% ; Selection dropdown
  Gui, Add, Text,, Name: ; Name
  Gui, Add, Edit, w280,

  ; Buttons
  Gui, Add, Button, Default gok, &OK
  ; Options
  Gui, +AlwaysOnTop
  ; Show
  Gui, Show, w300 h150, Create GUI
Return

ok:
  Gui Destroy
return
