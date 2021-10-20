# script to restart pesky SmartNAV with powershell, and Cap's stupid policy prevents the other version from running as admin
# this one should not require admin rights
# I find that smartnav is always dying on me in windows 8, so I'm constantly restarting it.
# create a shortcut to this, like C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "& "C:\foo\bar\thisfile.ps1"
wmic process where "name='SmartNAV.exe'" delete
Start-Process "C:\Program Files (x86)\NaturalPoint\SmartNav\SmartNAV.exe"