#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
+CapsLock::CapsLock
CapsLock::!^q
return
!^j::
Send, 322633405{Enter}
return
!^i::
Run, "C:/Users/putter/Documents/ספרים/אינפי/חוברת קורס אינפי.pdf"
return
!^b::
Run, "C:\Users\putter\Documents\ספרים\בדידה\חוברת קורס בדידה.pdf"
return
!^l::
Run, "C:\Users\putter\Documents\ספרים\לינארית\חוברת קורס לינארית.pdf"
return
!^o::
Run, "https://opal.openu.ac.il/my/"
return
!^m::
Run, "https://sheilta.apps.openu.ac.il/pls/mtl/student.login"
return
!^q::
run, "C:\Users\putter\Desktop\google.ahk"
return
!^w::
Run, https://web.whatsapp.com/
return
!s::
Run, spotify.exe
return
!^d::
Send, {F6}{F6}
sleep, 100
Send, +{F10}
Send,{Down}{Down}{Down}{Down}{Down}{Enter}
return
