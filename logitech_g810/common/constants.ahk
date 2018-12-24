; Constants

; App id
; Used in function such as WinActivate()
; This gives them more descriptive names
Global APP_ID_WORD := "ahk_exe WINWORD.exe"
Global APP_ID_POWERPOINT := "ahk_exe POWERPNT.EXE"
Global APP_ID_EXCEL := "ahk_exe EXCEL.EXE"
Global APP_ID_PREMIERE := "ahk_class Premiere Pro"
Global APP_EXE_PREMIERE := "Adobe Premiere Pro.exe"
Global APP_ID_EXPLORER := "ahk_class CabinetWClass"
Global APP_ID_GIT_BASH := "ahk_class mintty"
Global APP_ID_FIREFOX := "ahk_class MozillaWindowClass"
Global APP_ID_AUDACITY := "ahk_exe audacity.exe"
Global APP_ID_EXE_AUDACITY := "ahk_exe audacity.exe"
Global APP_PATH_GIT_BASH := "C:\Program Files\Git\git-bash.exe"
Global PREMIERE_PATH := "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Adobe Premiere Pro CC 2018"
Global PREMIERE_EXE := "Adobe Premiere Pro.exe"
Global PREMIERE_CLASS := "Premiere Pro"

; Dirs
Global HOMEWORK_ROOT := "D:\Users\Kishan\OneDrive\Homework"
Global CURRENT_YEAR := "\GCSE\Year 10"
Global YOUTUBE_PATH := "Y:"
GLOBAL ASSET_PATH := YOUTUBE_PATH "\Assets"
Global REPO_ROOT := "D:\Users\Kishan\Documents\Projects\AutoHotKeyScripts" ; CHANGE THIS TO WHERE THIS REPO IS CLONES

; Premiere specific stuff
Global DIR_CINEFORM_PROXIES := "C:\CINEFORM" ; Where I store cineform proxies for easy editing

; Path to Default INCLUDE.txt, where attributions are added for videos
Global DEFAULT_INCLUDE_TXT := ASSET_PATH "\INCLUDE_DEFAULT.txt"

; Config file, where stuff such as current Project is set
Global CONFIG_FILE := REPO_ROOT "/config.ini" ; Relative to root of project