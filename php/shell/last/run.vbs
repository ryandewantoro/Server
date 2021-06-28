set Wshell = CreateObject("WScript.shell")
Wshell.Run chr(34) & "clean.bat" & Chr(34), 0
Set WshShell = Nothing
