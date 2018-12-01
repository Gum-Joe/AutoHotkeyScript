; AHK V2
; From https://github.com/TaranVH/2nd-keyboard/blob/9ee39aaccf9c58df9c4a7c19eb7d12ab5223872c/Almost_All_Windows_Functions.ahk#L570

; App switcher, see https://www.youtube.com/watch?v=OqyQABySV8k

switchToSavedApp(savedCLASS) {
;msgbox,,, savedCLASS is %savedCLASS%,0.5
;msgbox,,, savedexe is %savedEXE%,0.5
if savedCLASS = ahk_class Notepad++
	{
	;msgbox,,, is notepad++,0.5
	if WinActive("ahk_class Notepad++")
		{
		sleep 5
		Send ^{tab}
		}
	}
;msgbox,,,got to here,0.5
windowSwitcher(savedCLASS, savedEXE)
}





back(){
;; if WinActive("ahk_class MozillaWindowClass")
;tooltip, baaaack
if WinActive("ahk_exe firefox.exe")
	Send ^+{tab}
if WinActive("ahk_class Chrome_WidgetWin_1")
	Send ^+{tab}
if WinActive("ahk_class Notepad++")
	Send ^+{tab}
if WinActive("ahk_exe Adobe Premiere Pro.exe")
	Send ^!+b ;ctrl alt shift B  is my shortcut in premiere for "go back"(in bins)(the project panel)
if WinActive("ahk_exe explorer.exe")
	Send !{left} ;alt left is the explorer shortcut to go "back" or "down" one folder level.
if WinActive("ahk_class OpusApp")
	sendinput, {F2} ;"go to previous comment" in Word.
}

;macro key 16 on my logitech G15 keyboard. It will activate firefox,, and if firefox is already activated, it will go to the next window in firefox.

switchToFirefox(){
sendinput, {SC0E8} ;scan code of an unassigned key. Do I NEED this?
IfWinNotExist, ahk_class MozillaWindowClass
	Run, firefox.exe
if WinActive("ahk_exe firefox.exe")
	{
	WinGetClass, class, A
	if (class = "Mozillawindowclass1")
		msgbox, this is a notification
	}
if WinActive("ahk_exe firefox.exe")
	Send ^{tab}
else
	{
	;WinRestore ahk_exe firefox.exe
	WinActivatebottom ahk_exe firefox.exe
	;sometimes winactivate is not enough. the window is brought to the foreground, but not put into FOCUS.
	;the below code should fix that.
	WinGet, hWnd, ID, ahk_class MozillaWindowClass
	DllCall("SetForegroundWindow", UInt, hWnd) 
	}
}


#IfWinActive
;Press SHIFT and macro key 16, and it'll switch between different WINDOWS of firefox.

switchToOtherFirefoxWindow(){
;sendinput, {SC0E8} ;scan code of an unassigned key
Process, Exist, firefox.exe
;msgbox errorLevel `n%errorLevel%
	If errorLevel = 0
		Run, firefox.exe
	else
	{
	GroupAdd, taranfirefoxes, ahk_class MozillaWindowClass
	if WinActive("ahk_class MozillaWindowClass")
		GroupActivate, taranfirefoxes, r
	else
		WinActivate ahk_class MozillaWindowClass
	}
}



; This is a script that will always go to The last explorer window you had open.
; If explorer is already active, it will go to the NEXT last Explorer window you had open.
; CTRL Numpad2 is pressed with a single button stoke from my logitech G15 keyboard -- Macro key 17. 

switchToExplorer(){
IfWinNotExist, ahk_class CabinetWClass
	Run, explorer.exe
GroupAdd, taranexplorers, ahk_class CabinetWClass
if WinActive("ahk_exe explorer.exe")
	GroupActivate, taranexplorers, r
else
	WinActivate ahk_class CabinetWClass ;you have to use WinActivatebottom if you didn't create a window group.
}

; ;trying to activate these windows in reverse order from the above. it does not work.
; ^+F2::
; IfWinNotExist, ahk_class CabinetWClass
	; Run, explorer.exe
; GroupAdd, taranexplorers, ahk_class CabinetWClass
; if WinActive("ahk_exe explorer.exe")
	; GroupActivate, taranexplorers ;but NOT most recent.
; else
	; WinActivatebottom ahk_class CabinetWClass ;you have to use WinActivatebottom if you didn't create a window group.
; Return

;closes all explorer windows :/
;^!F2 -- for searchability

closeAllExplorers()
{
WinClose,ahk_group taranexplorers
}


switchToPremiere(){
IfWinNotExist, ahk_class Premiere Pro
	{
	;Run, Adobe Premiere Pro.exe
	;Adobe Premiere Pro CC 2017
	; Run, C:\Program Files\Adobe\Adobe Premiere Pro CC 2017\Adobe Premiere Pro.exe ;if you have more than one version instlaled, you'll have to specify exactly which one you want to open.
	Run, Adobe Premiere Pro.exe
	}
if WinActive("ahk_class Premiere Pro")
	{
	IfWinNotExist, ahk_exe notepad++.exe
		{
		Run, notepad++.exe
		sleep 200
		}
	WinActivate ahk_exe notepad++.exe ;so I have this here as a workaround to a bug. Sometimes Premeire becomes unresponsive to keyboard input. (especially after timeline scrolling, especially with a playing video.) Switching to any other application and back will solve this problem. So I just hit the premiere button again, in those cases.g
	sleep 10
	WinActivate ahk_class Premiere Pro
	}
else
	WinActivate ahk_class Premiere Pro
}


switchToWord()
{
Process, Exist, WINWORD.EXE
;msgbox errorLevel `n%errorLevel%
	If errorLevel = 0
		Run, WINWORD.EXE
	else
	{
	IfWinExist, Microsoft Office Word, OK ;checks to see if the annoying "do you want to continue searching from the beginning of the document" dialouge box is present.
		sendinput, {escape}
	else if WinActive("ahk_class OpusApp")
		sendinput, {F3} ;set to "go to next comment" in Word.
	else
		WinActivate ahk_class OpusApp
	}
}


switchWordWindow()
{
; Process, Exist, WINWORD.EXE
; ;msgbox errorLevel `n%errorLevel%
	; If errorLevel = 0
		; Run, WINWORD.EXE
	; else
	; {
	GroupAdd, taranwords, ahk_class OpusApp
	if WinActive("ahk_class OpusApp")
		GroupActivate, taranwords, r
	else
		WinActivate ahk_class OpusApp
	; }
}



switchToChrome()
{
IfWinNotExist, ahk_exe chrome.exe
	Run, chrome.exe

if WinActive("ahk_exe chrome.exe")
	Sendinput ^{tab}
else
	WinActivate ahk_exe chrome.exe
}

switchToStreamDeck(){
IfWinNotExist, ahk_exe StreamDeck.exe
	{
	Run, C:\Program Files\Elgato\StreamDeck\StreamDeck.exe
	}
else
	{
	WinActivate ahk_exe StreamDeck.exe
	}
}


#IfWinActive
windowSwitcher(theClass, theEXE)
{
;msgbox,,, switching to `nsavedCLASS = %theClass% `nsavedEXE = %theEXE%, 0.5
IfWinNotExist, %theClass%
	Run, % theEXE
if not WinActive(theClass)
	WinActivate %theClass%
}


sortExplorerByName(){
IfWinActive, ahk_class CabinetWClass
	{
	;Send,{LCtrl down}{NumpadAdd}{LCtrl up} ;expand name field
	send {alt}vo{enter} ;sort by name
	;tippy2("sort Explorer by name")

	}

}

sortExplorerByDate(){
IfWinActive, ahk_class CabinetWClass
	{
	;Send,{LCtrl down}{NumpadAdd}{LCtrl up} ;expand name field
	send {alt}vo{down}{enter} ;sort by date modified, but it functions as a toggle...
	;tippy2("sort Explorer by date")

	}

}