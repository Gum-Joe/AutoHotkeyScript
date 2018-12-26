; Gets a template from essential graphics
#Include ../common/index.ahk

; Included here as diff. functions may use a diff method of getting track dividers.
Global TRACK_OFFSET_UP := 30

GetGraphicsTemplate(template := "Open Sans", track := 3) {
  ; Step 1: Activate correct panel
  BasePremiereFunctions()
  WorkspaceGraphics()
  Send SHORTCUT_ESSENTIAL_GRAPHICS_ACTIVATE
  ; Click "Browser"
  Click 1595, 91

  ; Step 2: Type template
  ; Pressing tab activates search bar
  Send "{Tab}"
  ; Go to Carret, using Taran's code
  sleep 500 ;sometimes, premiere takes some time to notice that the text box has been highlighted. in that case, it will not return any value for the position of the Caret. Tehrefore, you have to wait.
  Send "{Backspace}" ; Clear
  CaretGetPos(CaretX, CaretY)
  MouseMove CaretX, CaretY, 0 ; Move to Caret
  ; Type the template
  Send template
  Send "{Enter}"
  Sleep 100

  ; Step 3: Select teplate
  ; Move directly down to the only selectable one
  ControlGetPos ControlX, ControlY, , , "DroverLord - Window Class73", WinGetTitle("A")
  MouseMove ControlX, ControlY
  ; Find a black pixel we can select
  MouseGetPos Current2X, Current2Y
  PixelSearch BlackX, BlackY, Current2X, Current2Y, Current2X + 170, Current2Y + 100, 0x000000
  Click BlackX, BlackY

  ; Step 4: Locate where to put clip
  Send SHORTCUT_TIMELINES_ACTIVATE
  Sleep 500 ; Allow panel selection to change
  ; Get info about the timelines panel
  ControlGetPos TimeX, TimeY, TimeWidth, TimeHeight, CONTROL_TIMELINE, WinGetTitle("A")
  ; Looku for a matching playhead pixel
  ; The +100 is to exclude i.e. timecode, which has the same colour
  PixelSearch PlayheadX, PlayheadY, TimeX, TimeY + 50, TimeX + TimeWidth, TimeY + TimeHeight, 0x2D8CEB
  ; With coords, find middle divider between audio and video.
  ; Do this by searching downwards
  PixelSearch TimeMidX, TimeMidY, PlayheadX, PlayheadY, PlayheadX + 10, PlayheadY + TimeHeight, 0x262626

  ; Now we can offset from this to where we need to
  ; We find the next diver line using search for colour, searching up
  ; minus TRACK_OFFSET_UP, as search starts in top left and we are in bottom left.
  PixelSearch NextLineX, NextLineY, TimeMidX, TimeMidY - TRACK_OFFSET_UP, TimeMidX + 10, TimeMidY, 0x313131
  ; Repeat above until we reach a desired track
  ; Minus 1 for the first iteration (above)
  ; Minus another 1 as the line selected will put graphics on track above, not below
  Loop (track - 2) {
    PixelSearch NextLineX, NextLineY, NextLineX, NextLineY - TRACK_OFFSET_UP, NextLineX + 10, NextLineY, 0x313131
  }

  ; Step 5: Drag to the final coords
  MouseClickDrag "L", , , NextLineX, NextLineY
  Sleep 1000

  ; Step 6: You probably want to edit the text next, so auto select text tool
  ; Send SHORTCUT_TEXT_TOOL
}