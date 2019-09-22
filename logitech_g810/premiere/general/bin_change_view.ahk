; Switch between thubmnail and list view in bins
#Include ../common/index.ahk

BinChangeView() {
	BasePremiereFunctions()

	MouseGetPos CurrentX, CurrentY

	; Look for thubnail button
	listThumbSearch := ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, SCRIPT_ASSET_LIST.icons.bins.listViewIcon)
	if listThumbSearch == 1 {
		; FOUND!
		; CLICK
		Click FoundX, FoundY
	} else {
		; Find thumbnial view icon, as list view is selected, and click
		ImageSearch(ThumbX, ThumbY, 0, 0, A_ScreenWidth, A_ScreenHeight, SCRIPT_ASSET_LIST.icons.bins.thumbnailViewIcon)
		Click ThumbX, ThumbY
	}

	; RETURN
	MouseMove CurrentX, CurrentY
}