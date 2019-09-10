; Simple hotkey to take a capture in the source/program preview
; And save it
; Makes 2 actions into 1
#Include ../common/index.ahk

CaptureAndSave() {
	Send SHORTCUT_TAKE_CAPTURE
	Send "{Enter}"
}