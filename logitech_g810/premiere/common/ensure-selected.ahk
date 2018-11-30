; Makes sure Premiere is selected
EnsurePremiereSelected() {
  if WinActive("ahk_class Premiere Pro")
    Return
  WinActivate "ahk_class Premiere Pro"
  Return
}