#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; #Warn ; Enable warnings to help debug issues
; Place this script inside the location which appears with Super+r: shell:startup

; Super Key Modifiers

#t::
Run Alacritty
return

#f::
Run Explorer
return

#b::
Run Brave
return

#o::
Run Outlook

; Quit the currently focused application
#q::
WinGetTitle, Title, A
PostMessage, 0x0112, 0xF060,,, %Title%
