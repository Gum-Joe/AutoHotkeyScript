#Include ../common/index.ahk

SetSpeedDuration1Sec() {
  Send SHORTCUT_SPEED_DURATION
  Send "{Tab}" ; Select
  Send "00:00:01:00" ; Type
  Send "{Enter}" ; Done
}