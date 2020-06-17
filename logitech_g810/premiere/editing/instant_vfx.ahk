; My version of Taran's insatntVFX func
#Include ../common/index.ahk

InstantVFX(effectName, hotTextNumber := 1) {
	BasePremiereFunctions()

	; Get original pos
  MouseGetPos CurrentX, CurrentY

	; Select effect controls
	Send SHORTCUT_EFFECTS_CONTROLS_ACTIVATE
	Sleep 50 ; WAIT FOR IT TO ACT.

	controlEffectsCont := ControlGetClassNN(ControlGetFocus("A"))
	; Get info about effects control panel
  ControlGetPos EffectsX, EffectsY, EffectsWidth, EffectsHeight, controlEffectsCont, WinGetTitle("A")

	; Find little triangle
	TriangleY := EffectsY+66 ;ui 100%
	TriangleX := EffectsX+13 ;ui 100%
	MouseMove TriangleX, TriangleY
	; Get colour
	TriangleColour := PixelGetColor(TriangleX, TriangleY)

	; Check it
	; if (colorr = "0x353535") ;for 150% ui
	if (TriangleColour = "0x222222") ;for 100% ui
	{
		; this means closed triangle. Will click and then SEARCH
		; blockinput, Mouse
		Click TriangleX, TriangleY
		sleep 5
		;clickTransformIcon()
		findVFX(effectName, hotTextNumber)
		Return
	} else if (TriangleColour = "0x7A7A7A") { ;for 100% ui 
		; else if (colorr = "0x757575") ;for 150% ui. again, this values could be different for everyone. check with window spy. This color simply needs to be different from the color when the triangle is closed. it also cannot be the same as a normal panel color (1d1d1d or 232323)
		;tooltip, %colorr% means OPENED triangle. SEARCHING FOR SCALE
		;blockinput, Mouse
		sleep 5
		;clickTransformIcon()
		findVFX(effectName, hotTextNumber)
		;untwirled = 1
		Return "untwirled"
	} else if (TriangleColour = "0x1D1D1D" || TriangleColour = "0x232323") {
		; this is a normal panel color of 0x1d1d1d or %colorr%, which means NO CLIP has been selected ; assuming you didnt change your UI brightness. so we are going to select the top clip at playhead.
		Send SHORTCUT_SELECTION_FOLLOWS_PLAYHEAD
		sleep 10
		; It's possible a clip isn't selected, as selection follows playhead is usualy on for me.
		if (TriangleColour = "0x1D1D1D" || TriangleColour = "0x232323") {
			Send SHORTCUT_SELECTION_FOLLOWS_PLAYHEAD ; Not selected, so turn back on
		}
		; resetFromAutoVFX()
		;now you need to do all that again, since the motion menu is now open. But only do it ONCE more! 
		InstantVFX(effectName, hotTextNumber)
		Return reset
	} else {
		MsgBox "ERROR: " TriangleColour " not expected"
		;play noise
		; resetFromAutoVFX()
		Return reset
	}

}

; This func does the finding
findVFX(effectName, hotTextNumber := 1) {
	; Get info about where we are
	MouseGetPos xPos, yPos

	theFile := SCRIPT_ASSET_LIST.panels.effectsControls.textPrefix effectName SCRIPT_ASSET_LIST.panels.effectsControls.textSuffix

	; Search
	ImageSearch FoundX, FoundY, xPos-90, yPos, xPos+800, yPos+900, theFile
	if ErrorLevel = 1 {
		;ImageSearch, FoundX, FoundY, xPos-30, yPos, xPos+1200, yPos+1200, *10 %A_WorkingDir%\%foobar%_D2019.png ;within 10 shades of variation (in case SCALE is fully extended with bezier handles, in which case, the other images are real hard to find because the horizontal seperating lines look a BIT different. But if you crop in really closely, you don't have to worry about this. so this part of the code is not really necessary execpt to expand the range to look.
		ImageSearch FoundX, FoundY, xPos-30, yPos, xPos+1200, yPos+1200, "*10 " theFile
	}
	if ErrorLevel = 2{
		MsgBox "ERROR LEVEL 2: Could not conduct the search"
		;resetFromAutoVFX()
	}
	if ErrorLevel = 1 {
		;msgbox, , , error level 1, .7
		MsgBox "ERROR LEVEL 1: " effectName " could not be found on the screeen"
		; resetFromAutoVFX()
	} else {
		; FOUND!
		MouseMove FoundX, FoundY
		sleep 5
		findHotText(hotTextNumber)
	}
}

; The hotTextNumber param lets us select i.e. the vertical hottext
findHotText(hotTextNumber) {
	; Get info about where we are
	MouseGetPos xPos, yPos
	; From here, search for a colour in a small box
	PixelSearch TextX, TextY, xPos, yPos, xPos+500, yPos+20, 0x2d8ceb, 30, "Fast RGB"
	
	if ErrorLevel {
		MsgBox "ERROR: hottext not found"
		return
	}
	MouseMove TextX, TextY
	sleep 10

	if hotTextNumber == 2 {
		MouseGetPos xPos2, yPos2
		PixelSearch TextX2, TextY2, xPos2 + 40, yPos2, xPos2+500, yPos2+20, 0x2d8ceb, 30, "Fast RGB"
		MouseMove TextX2, TextY2
	}

	; Click
	Click "down left"

}

InstantVFXScale() {
	InstantVFX("Scale")
}

InstantVFXPosition() {
	InstantVFX("Position")
}

InstantVFXPositionVert() {
	InstantVFX("Position", 2)
}

InstantVFXOpacity() {
	InstantVFX("Opacity")
}

InstantVFXAnchorPoint() {
	InstantVFX("AnchorPoint")
}

InstantVFXAnchorPointVert() {
	InstantVFX("AnchorPoint", 2)
}