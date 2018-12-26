; Terminate script in the event of an emergency (i.e. Infinity loop)

TerminateScript() {
  ExitApp 130
}

TerminatePremiere() {
  ProcessClose "Adobe Premiere Pro.exe"
}

; ahk_class ADOBEGCCLIENT
; ahk_exe AdobeGCClient.exe
TerminateGCClient() {
  ProcessClose "AdobeGCClient.exe"
}