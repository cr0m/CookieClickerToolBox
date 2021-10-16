
;
; Usage
; ---------------------------------------
;  F1: Exit/Quit
;  F2: Start Clicking
;  F4: Move & Start Clicking
;  F9; Semi-AutoMatic Game Data Backup
;
; Misc
; ---------------------------------------
;  F3: Show Counter
;  F5: Test
;

Gui, New, +AlwaysOnTop
Gui, Add, Text,x10 y5, F1: Exit
Gui, Add, Text,x55 y5, F2: CLICK
Gui, Add, Text,x110 y5, F4: Move to cookie first && start clicking!!!
Gui, Add, Text,x305 y5, F9: Semi-AutoMatic Game Data Backup (open notepad)
Gui, Add, Text,x0 y20, --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Gui, Add, Text,x10 y35, MouseBack: Pause MouseFwd: CLICK DeBug: F3: Show Counter    F5: Test
Gui, Show, w617 h55, Cookie Clicker Grandma Pimper (CCGP) - Pimping zombie grandmas for max cookies yo
GuiClose:
GuiEscape:

F1::ExitApp


f2::clickIt()

XButton1::Pause
XButton2::clickIt()

f3::showCount()
f4::moveIt()
f5::test()
f9::backupGame()
RButton::ExitApp


global count=0

; build in quick monitor conditional &|| resolution 
clickIt(){ ; F2
	Loop {
		count += 1
		Click
		Sleep 5
	}
}

showCount(){ ; F3
	MsgBox, Clicks so far: %count%
}

moveIt(){  ; F4
	; Main Monitor
	MouseMove, 300, 420
	clickIt()
}

test(){  ; F5
	; MsgBox, wtf
	; WinActivate ; Use the window found by WinExist.

	if WinExist("ahk_exe notepad.exe") {
		WinActivate
		Sleep 5
		Send ^a
		Send {Delete}
		Send ^v
	} else {
		MsgBox, nope  ; TODO: make this open new one 
	}
}	


backupGame(){ ; F9
	
	MouseMove, 693, 82 ; move cursor to "Options" button
	; TODO: add check here to make sure color is #ffffff
	MouseClick ; Click Options
	Sleep 5
	MouseMove, 893, 593 ; move to Export 
	Click 
	Sleep 5
	Send ^c  ; copy game data out
	Sleep 5
	
	; Switch to previously opened Notepad TODO: add else to open new or something
	if WinExist("ahk_exe notepad.exe") {
		WinActivate
		Sleep 5
		; Clears existing/previously-exported data in notepad & pastes new data
		Send ^a
		Send {Delete}
		Send ^v
	} else {
		MsgBox, nope
		; TODO: open notepad
		; paste shit
	}

	; Switch back to the game 
	if WinExist("ahk_exe Cookie Clicker.exe") {
		WinActivate
	} else {
		MsgBox, nope  
	}

	; Move to "All Done" 
	MouseMove, 1000, 780
	Sleep 5
	MouseClick
	
	; Close out of "Options"
	MouseMove, 1600, 240
	Sleep 5
	MouseClick
}