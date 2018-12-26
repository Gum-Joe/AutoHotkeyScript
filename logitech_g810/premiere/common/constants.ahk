; AHK constants
#Include ../../common/constants.ahk

; Workspaces
; Names
; Change the values after the := to the name of your workspaces you want to remap to
Global WORKSPACE_ALL := "All Panels"
Global WORKSPACE_ASSEMBLY := "Assembly"
Global WORKSPACE_AUDIO := "Audio"
Global WORKSPACE_COLOUR := "Color"
Global WORKSPACE_COLOUR_BIG := "Color BIG" ; Makes preview bigger
Global WORKSPACE_DEFAULT := "Default"
Global WORKSPACE_EDITING := "Editing"
Global WORKSPACE_EFFECTS := "Effects"
Global WORKSPACE_GRPAHICS := "Graphics"

; Store in object
Global WORKSPACES := Object()
WORKSPACES[WORKSPACE_ALL] := 1
WORKSPACES[WORKSPACE_ASSEMBLY] := 2
WORKSPACES[WORKSPACE_AUDIO] := 3
WORKSPACES[WORKSPACE_COLOUR] := 4
WORKSPACES[WORKSPACE_COLOUR_BIG] := 5
WORKSPACES[WORKSPACE_DEFAULT] := 6
WORKSPACES[WORKSPACE_EDITING] := 7
WORKSPACES[WORKSPACE_EFFECTS] := 8
WORKSPACES[WORKSPACE_GRAPHICS] := 9