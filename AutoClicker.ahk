#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

continue = 1
clicksD = 100
clickIntervalD = 1000

NumpadAdd::
continue := 1
InputBox, clicksA, , How many times do you want to click? (default: 100)
InputBox, clickIntervalA, , How long do you want to wait between each click in miliseconds? (default: 1000)
if (clicksA)
	clicks := clicksA
else 
	clicks := clicksD
if (clickIntervalA)
	clickInterval := clickIntervalA
else 
	clickInterval := clickIntervalD
clicksLeft := clicks
Loop, % clicks
{
	if (continue < 1)
		Break

	Send {LButton}
	clicks := clicks - 1
	ToolTip, Clicks Left: %clicks%
    	Sleep, clickInterval
}
ToolTip
continue := 1 
return

NumpadSub::
continue := 0
return