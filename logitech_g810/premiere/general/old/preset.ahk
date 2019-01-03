#Include ../common/index.ahk

preset(presetName) {
  BasePremiereFunctions()
  Send SHORTCUT_SHUTTLE_STOP ; another shortcut for Shuttle Stop. CTRL ALT SHIFT K. Set this in Premiere's shortcuts panel. ; Edited to what I use
  ;so if the video is playing, this will stop it. Othewise, it can mess up the script.
  Sleep 5
  ;Setting the coordinate mode is really important. This ensures that pixel distances are consistant for everything, everywhere.
  Coordmode "pixel", "Window"
  Coordmode "mouse", "Window"
  Coordmode "Caret", "Window"


  ;This (temporarily) blocks the mouse and keyboard from sending any information, which could interfere with the funcitoning of the script.
  BlockInput "SendAndMouse"
  BlockInput "MouseMove"
  BlockInput "On"

  SetKeyDelay 0 ;this ensures that any text AutoHotKey "types in," will input instantly, rather than one letter at a time.
  MouseGetPos xposP, yposP ;---stores the cursor's current coordinates at X%xposP% Y%yposP%
  Send "{mButton}" ;this will MIDDLE CLICK to bring focus to the panel underneath the cursor (the timeline). I forget exactly why, but if you create a nest, and immediately try to apply a preset to it, it doesn't work, because the timeline wasn't in focus...?
  Send SHORTCUT_EFFECTS_PANEL_ACTIVATE ;CTRL SHIFT ALT 7 --- you must set this in premiere's keyboard shortcuts menu to the "effects" panel

  sleep 20
  Send SHORTCUT_EFFECTS_PANEL_SEARCH ; Select find box shortcut
  sleep 20
  ; Any text in the Effects panel's find box has now been highlighted. There is also a blinking "text insertion point" at the end of that text. This is the vertical blinking line, or "caret."  

  ; Get carret pos
  ;MouseMove CaretX, CaretY, 0
  sleep 500 ;sometimes, premiere takes some time to notice that the text box has been highlighted. in that case, it will not return any value for the position of the Caret. Tehrefore, you have to wait.
  CaretGetPos(CaretX, CaretY)
  MouseMove CaretX, CaretY, 0 ; Move to Caret
  ;and fortunately, AHK knows the exact X and Y position of this caret. So therefore, we can find the effects panel find box, no matter what monitor it is on, with 100% consistency.
  ;tooltip, 1 - mouse should be on the karat X= %A_CaretX% Y= %A_CaretY% now
  sleep 15
  msgbox "carat X Y is" CaretX ", " CaretY
  MouseGetPos ,, Window, WindowClassNN
  WinClass := WinGetClass("ahk_id " Window)
  ;tooltip, 2 - ahk_class =   %class% `nClassNN =     %classNN% `nTitle= %Window%
  sleep 50
  ;;;I think ControlGetPos is not affected by coordmode??  Or at least, it gave me the wrong coordinates if premiere is not fullscreened... https://autohotkey.com/docs/commands/ControlGetPos.htm 
  ControlGetPos XX, YY, Width, Height, WindowClassNN, "ahk_class " Winclass, SubWindow, SubWindow ;-I tried to exclude subwindows but I don't think it works...?
  ;;my results:  59, 1229, 252, 21,      Edit1,    ahk_class Premiere Pro

  ;tooltip, classNN = %classNN%
  ;sleep 50
  ;now we have found a lot of useful informaiton about this find box. Turns out, we don't need most of it...
  ;we just need the X and Y coordinates of the "upper left" corner...

  ;comment in the following line to get a message box of your current variable values. The script will not advance until you dismiss the message box.
  MsgBox "xx=" XX "yy=" YY

  MouseMove XX, YY, 0 ;-----------------------moves cursor onto the magnifying glass
  ;tooltip, should be in the center of the magnifying glass now.
  ;sleep 50
  sleep 5

  ; Press backspace
  Send "{BS}"

  ; Type preset
  Send presetName
}