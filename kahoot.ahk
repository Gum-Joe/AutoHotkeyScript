; Script to auto enter kahoot
#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; TODO Fix spacing issue

Run() {
  OnQ := 1
  SLEEP_TIME := 500
  ; Assume Firefox is open and on Kahoot tab
  #IfWinNotActive ahk_class MozillaWindowClass
    WinActivate, ahk_class MozillaWindowClass
  #IfWinNotActive
  
  ; Open the spread
  ; Verify spreadsheet is open
  Send {End}
  Click 971, 935
  Sleep, %SLEEP_TIME%
  ; Open the spreadsheet
  ; Asuume its open
  WinActivate, ahk_class XLMAIN
  MouseMove 1892, 156
  Sleep, %SLEEP_TIME%
  Click down
  MouseMove 254, 156
  Sleep, %SLEEP_TIME%
  Click up
  Sleep, %SLEEP_TIME%
  Send ^c
  Sleep, %SLEEP_TIME%
  Send {Esc}
  Sleep, %SLEEP_TIME%
  WinActivate, ahk_class MozillaWindowClass ; Go to Q on Kahoot
  Click 632, 239
  Send ^v
  Sleep, %SLEEP_TIME%

  ; A1
  WinActivate, ahk_class XLMAIN
  Send, {Right}
  MouseMove 1892, 156
  Sleep, %SLEEP_TIME%
  Click down
  MouseMove 254, 156
  Sleep, %SLEEP_TIME%
  Click up
  Sleep, %SLEEP_TIME%
  Send ^c
  Sleep, %SLEEP_TIME%
  Send {Esc}
  WinActivate, ahk_class MozillaWindowClass ; Go to Q on Kahoot
  MouseMove, 613, 503
  Click
  Sleep, %SLEEP_TIME%
  Send, ^v
  Sleep, %SLEEP_TIME%

  ; A2
  WinActivate, ahk_class XLMAIN
  Send, {Right}
  MouseMove 1892, 156
  Sleep, %SLEEP_TIME%
  Click down
  MouseMove 254, 156
  Sleep, %SLEEP_TIME%
  Click up
  Sleep, %SLEEP_TIME%
  Send ^c
  Sleep, %SLEEP_TIME%
  Send {Esc}
  WinActivate, ahk_class MozillaWindowClass ; Go to Q on Kahoot
  MouseMove, 613, 605
  Click
  Sleep, %SLEEP_TIME%
  Send, ^v
  Sleep, %SLEEP_TIME%
  
  ; A3
  WinActivate, ahk_class XLMAIN
  Send, {Right}
  MouseMove 1892, 156
  Sleep, %SLEEP_TIME%
  Click down
  MouseMove 254, 156
  Sleep, %SLEEP_TIME%
  Click up
  Sleep, %SLEEP_TIME%
  Send ^c
  Sleep, %SLEEP_TIME%
  Send {Esc}
  WinActivate, ahk_class MozillaWindowClass ; Go to Q on Kahoot
  MouseMove, 1208, 503
  Click
  Sleep, %SLEEP_TIME%
  Send, ^v
  Sleep, %SLEEP_TIME%

  ; A4
  WinActivate, ahk_class XLMAIN
  Send, {Right}
  MouseMove 1892, 156
  Sleep, %SLEEP_TIME%
  Click down
  MouseMove 254, 156
  Sleep, %SLEEP_TIME%
  Click up
  Sleep, %SLEEP_TIME%
  Send ^c
  Sleep, %SLEEP_TIME%
  Send {Esc}
  WinActivate, ahk_class MozillaWindowClass ; Go to Q on Kahoot
  MouseMove, 1208, 605
  Click
  Sleep, %SLEEP_TIME%
  Send, ^v
  Sleep, %SLEEP_TIME%

  ; Notes
  WinActivate, ahk_class XLMAIN
  Send, {Right}
  Send, {Right}
  MouseMove 1892, 156
  Sleep, %SLEEP_TIME%
  Click down
  MouseMove 254, 156
  Sleep, %SLEEP_TIME%
  Click up
  Sleep, %SLEEP_TIME%
  Send ^c
  Sleep, %SLEEP_TIME%
  Send {Esc}
  WinActivate, ahk_class MozillaWindowClass ; Go to Q on Kahoot
  MouseMove, 928, 718
  Click
  Sleep, %SLEEP_TIME%
  Send, ^v
  Sleep, %SLEEP_TIME%

  ; Get secs
  WinActivate, ahk_class XLMAIN
  Send, {Right}
  Send, {Right}
  Send, ^c
  Sleep %SLEEP_TIME%
  WinActivate, ahk_class MozillaWindowClass
  Click 642, 345
  Sleep %SLEEP_TIME%
  ; Parse CBoard
  clipy := clipboard ; not necessary but for clarity since I further process the variable
  clipy := substr(clipy, 1, instr(clipy, "`r") -1) ; just in case there is no "`n" before
  Send {Up}
  Send {Up}
  Sleep %SLEEP_TIME%
  Loop, %clipy% {
    Send {Down}
  }
  Send {Enter}
  
  ; Select Ans
  WinActivate, ahk_class XLMAIN
  Loop, 3 {
    Send {Left}
  }
  Send ^c
  Sleep %SLEEP_TIME%
  clipy := clipboard ; not necessary but for clarity since I further process the variable
  clipy := substr(clipy, 1, instr(clipy, "`r") -1) ; just in case there is no "`n" before
  WinActivate, ahk_class MozillaWindowClass
  IfEqual, clipy, A, Click 941, 500
  IfEqual, clipy, B, Click 941, 597
  IfEqual, clipy, C, Click 1526, 500
  IfEqual, clipy, D, Click 1526, 597
  Sleep %SLEEP_TIME%

  ; DONE!
  Click 1867, 100
  Sleep %SLEEP_TIME%
  WinActivate, ahk_class XLMAIN
  Loop, 5 {
    Send {Left}
  }
  Sleep %SLEEP_TIME%
  Send {Down}
  
}

F9::ExitApp
F8::
 Loop, 3 {
   Run()
 }
Return
