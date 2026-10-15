' ============================================================
' CreateShortcut.vbs
' Creates a desktop shortcut for TokenViewer
' Run: double-click this file or execute via cscript
' ============================================================

Set oWS = WScript.CreateObject("WScript.Shell")
Set oFSO = WScript.CreateObject("Scripting.FileSystemObject")

sDesktop = oWS.SpecialFolders("Desktop")
sAppDir = oFSO.GetParentFolderName(WScript.ScriptFullName)
sExeTarget = sAppDir & "\TokenViewer.exe"
sBatTarget = sAppDir & "\launch.bat"
sIcon = sAppDir & "\TokenViewer.ico"
sShortcut = sDesktop & "\TokenViewer.lnk"

' Prefer native .exe if compiled, otherwise fallback to launch.bat
If oFSO.FileExists(sExeTarget) Then
    sTarget = sExeTarget
    nWindowStyle = 1
Else
    sTarget = sBatTarget
    nWindowStyle = 7
End If

' Create the shortcut
Set oLink = oWS.CreateShortcut(sShortcut)
oLink.TargetPath = sTarget
oLink.WorkingDirectory = sAppDir
oLink.Description = "TokenViewer - LLM Token Counter"
oLink.WindowStyle = nWindowStyle
oLink.IconLocation = sIcon & ",0"
oLink.Save

WScript.Echo "Desktop shortcut created." & vbCrLf & vbCrLf & _
  "Target: " & sTarget & vbCrLf & _
  "Shortcut Location: " & sShortcut
