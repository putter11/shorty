#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
UpdateList(FileArray)
{
	LV_Delete()
	GuiControlGet, t,, Edit
	for i in FileArray
	{
		if (Instr(FileArray[FileArray.length() + 1 - i],t) = 1)
			LV_Add("", FileArray[FileArray.length() + 1 - i])
	}
	return
}

UpdateArray(t, FileArray)
{
	for i in FileArray
	{
		if (FileArray[i] = t)
			FileArray.RemoveAt(i)
	}
	if StrLen(t) > 0
		FileArray.push(t)
	UpdateFile(FileArray)
	return
}

UpdateFile(FileArray)
{
	global PATH
	f := FileOpen(PATH, "w")
	for i in FileArray
		f.writeline(FileArray[i])
	f.close()
	return
}

Search(FileArray)
{
	GuiControlGet, t,, Edit
	g := "https://www.google.com/search?q=" . t
	Run, %g%
	UpdateArray(t, FileArray)
	ExitApp
}

FileArray :=[]
global PATH = "C:\Users\putter\Desktop\t.txt"
Gui, New,,Google
Gui, Add, Button, Hidden Default, OK
Gui, Add, Edit,w350 vEdit gEditg
Gui, Add, ListView, vMyListView h300,History
Gui, ListView, Hello
Loop, read, %PATH%
{
    FileArray.Push(A_LoopReadLine)
}
for l in FileArray
	LV_Add("", FileArray[FileArray.length() + 1 - l])
Gui, show,W400
return

Editg:
	UpdateList(FileArray)
	return

ButtonOK:
	GuiControlGet, FocusedControl, FocusV
	if (FocusedControl != "MyListView")
	{
		if (FocusedControl = "Edit")
		{
			Search(FileArray)
			return
		}
	}
	LV_GetText(RowText, LV_GetNext(0, "Focused"))
	GuiControl,,Edit, %RowText%
	ControlFocus, %RowText%
	Send {end}
	UpdateList(FileArray)
	return

Down::
	ControlGetFocus, OutputVar, Google
	if (OutputVar = "Edit1")
		Send, {Tab}{Down}{Up}
	else
		send, {Down}
	return

Escape::
	ControlGetFocus, OutputVar, Google
	if (OutputVar != "")
	{
		ExitApp
	}
	else
		Send, {Escape}
	return
	
GuiClose:  ; Indicate that the script should exit automatically when the window is closed.
ExitApp