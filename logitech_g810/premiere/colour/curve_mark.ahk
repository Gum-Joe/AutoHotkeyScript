; Marks my four point on a lumetri curve
#Include ../common/index.ahk

CurveMarkLumetri() {
  BasePremiereFunctions()
  MouseGetPos CurrentX, CurrentY
  WorkspaceColour()
  
  
  Send SHORTCUT_LUMETRI_COLOUR_ACTIVATE

  ; Click 1805, 410 ; Top
  ; The coordinates are always off, but by how much?
  OffsetX := -11
  OffsetY := - 52
  Click 1816 + OffsetX, 462 + OffsetY ; Top
  Click 1755 + OffsetX, 522 + OffsetY ; Middle
  Click 1696 + OffsetX, 583 + OffsetY ; Bottom

  MouseMove CurrentX, CurrentY
}