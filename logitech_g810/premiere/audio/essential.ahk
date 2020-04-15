; Hotkeys related to essential audio
#Include ../common/index.ahk
#Include ../../common/index.ahk

EssentialAudioPresetBlueYeti() {

  ; Base HotKey code
  BasePremiereFunctions()
  ; Verify Audio mode is selected
  SetWorkspace("Audio")

	; Select panel
	; Select effect controls
	Send SHORTCUT_ESSENTIAL_AUDIO_ACTIVATE
	Sleep 50 ; WAIT FOR IT TO ACT.
	controlEffectsCont := ControlGetClassNN(ControlGetFocus("A"))
	; Get info about effects control panel
  ControlGetPos EffectsX, EffectsY, EffectsWidth, EffectsHeight, controlEffectsCont, WinGetTitle("A")

	; Find where it says Dialogue
	out1 := ImageSearch(Found1X, Found1Y, EffectsX, EffectsY, EffectsX + EffectsWidth, EffectsY + EffectsHeight, SCRIPT_ASSET_LIST.panels.essentialAudio.dialogue)

	if (out1) {
		; Need to click the dialogue thingy
		Click Found1X, Found1Y
		Sleep 50
	}

	; Search for Prset: text in panel
	ImageSearch FoundX, FoundY, EffectsX, EffectsY, EffectsX + EffectsWidth, EffectsY + EffectsHeight, SCRIPT_ASSET_LIST.panels.essentialAudio.preset

	ActualX := FoundX + 50
	MouseMove ActualX, FoundY
	Click
	Sleep 50
	; Drop down open
	; Find effect
	out := ImageSearch(EX, EY, EffectsX, EffectsY, EffectsX + EffectsWidth, EffectsY + EffectsHeight, SCRIPT_ASSET_LIST.panels.essentialAudio.maleBlueYeti)

	; Check error status
	if (out) {
		Click EX, EY
	}
	; Else, not there, so it's been selected already
  Return
}