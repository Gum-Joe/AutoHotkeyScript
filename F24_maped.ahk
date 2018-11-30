;#InstallKeybdHook
;#if (getKeyState("F24", "P")) ;THIS is the line that makes all the lines below, possible.
^A::
  MsgBox Hello
Return
;#if