Option Explicit
Dim objShell, fso, scriptFolder, psPath, cmd
Set objShell = CreateObject("Wscript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
scriptFolder = fso.GetParentFolderName(WScript.ScriptFullName)

psPath = objShell.ExpandEnvironmentStrings("%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe")
cmd = """" & psPath & """ -ExecutionPolicy Bypass -File """ & scriptFolder & "\touchgrass.ps1" & """"

objShell.Run cmd, 0, False
