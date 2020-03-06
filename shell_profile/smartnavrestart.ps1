# script to restart pesky SmartNAV with powershell
# I find that smartnav is always dying on me in windows 8, so I'm constantly restarting it.
# create a shortcut to this, like C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "& "C:\foo\bar\smartnavrestart.ps1"
# mark the shortcut to run as admin
Get-Process | Where-Object { $_.Name -eq "SmartNAV" } | Select-Object -First 1 | Stop-Process
#Read-Host -Prompt "Press Enter to continue"
Start-Process "C:\Program Files (x86)\NaturalPoint\SmartNav\SmartNAV.exe"