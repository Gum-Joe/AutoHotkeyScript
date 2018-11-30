#Include ..\..\..\common\check_colour_at.ahk
; Verify mode
BaseY := 73
; BaseCol = 0x26405A
BaseCol := 0x294C23

ShowWaitDialogue() { ; Displayed during mode switch
  MsgBox 0, Waiting, "Waiting for Premiere to switch modes. Press Enter when done."
}

SetWorkspace(mode) {
  WorkspaceCoords := Object() ; X, Y and colour to check for each tab ; Order of tabs: Default - Assembly - Editing - Color - Effects - Audio - Graphics - Libraries - Color BIG - Graphics BIG - Preview
  WorkspaceCoords["Assembly"] := [592, 71, BaseCol]
  WorkspaceCoords["Editing"]:= [681, BaseY, BaseCol]
  WorkspaceCoords["Colour"] := [757, 71, 0x2B7D97],
  WorkspaceCoords["Effects"]:= [816, BaseY, 0x298CB4]
  WorkspaceCoords["Audio"] := [861, BaseY, BaseCol]
  WorkspaceCoords["Graphics"] := [992, 72, 0x2B7D97]
  WorkspaceCoords["Libraries"] := [1057, 72, 0x298CB4]

  if not (CheckColourAt(WorkspaceCoords[mode][0], WorkspaceCoords[mode][1], WorkspaceCoords[mode][2]) = true) {
    X := WorkspaceCoords[mode][0]
    Y := WorkspaceCoords[mode][1]
    ;Gui := GuiCreate()
    ;Gui.Add("Text",, "Waiting for Premiere to switch modes. Press Enter when done.")
    ;Gui.Show
    MouseMove X, Y
    MsgBox "Waiting for Premiere to switch modes. Press Enter when done."
    return
  } else {
    return
  }
}
