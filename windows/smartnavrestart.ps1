# script to restart pesky SmartNAV with powershell
# I find that smartnav is always dying on me in windows 8, so I'm constantly restarting it.
# create a shortcut to this, like C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "& "C:\foo\bar\smartnavrestart.ps1"
# mark the shortcut to run as admin
Get-Process | Where-Object { $_.Name -eq "SmartNAV" } | Select-Object -First 1 | Stop-Process
#Read-Host -Prompt "Press Enter to continue"
Start-Process "C:\Program Files (x86)\NaturalPoint\SmartNav\SmartNAV.exe"
# SIG # Begin signature block
# MIIFjgYJKoZIhvcNAQcCoIIFfzCCBXsCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUC0stOOX/UI9pwiojdqXYWML9
# FDegggMeMIIDGjCCAgKgAwIBAgIQXGoxlt1ok7FP9R6mcjA1MzANBgkqhkiG9w0B
# AQUFADAlMSMwIQYDVQQDDBpMVyBQb3dlcnNoZWxsIENvZGUgU2lnbmluZzAeFw0y
# NDA2MTkxMzM2NDFaFw0yNTA2MTkxMzU2NDFaMCUxIzAhBgNVBAMMGkxXIFBvd2Vy
# c2hlbGwgQ29kZSBTaWduaW5nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
# AQEAzkXOGgF7IbhOOXG7VsWOrAyX8DwJFye71Jf6GdWNd0Do0l1eyym2EArC886S
# XMm7wQFwDRFTW2Ctan/K4cF18Ew6Cz3ruJd3xltx/hsa9TexKFEoSTzUeWL3ej+n
# bYyKrrBQlT/k0kAkJt+3mk6Iqhd3NDzA/XwLElXq8FpzdYQZZjdiSapMcez3lKdt
# 8beI1YQSqob1UwHX5pEdHyrQkQbmhzcRmORtU+cDB10WW/bgB2J5oy8JcxALW2SJ
# XU0R/Kvpb/i+KFxe9b9b32N92lJkRH8mnDe6xBLgsNlAufOdQ2oYbhcAQWAneeL+
# qg7P3HieeVKAMap+8BHFJwIJRQIDAQABo0YwRDAOBgNVHQ8BAf8EBAMCB4AwEwYD
# VR0lBAwwCgYIKwYBBQUHAwMwHQYDVR0OBBYEFPAGoM68OBIdX9k9dPxOG21TPOPT
# MA0GCSqGSIb3DQEBBQUAA4IBAQA8ipeaRA9tqqWEpr+gLPVk/EtmqCCoZLqvVK8h
# 2kCLRMnJGEODm1Hv9UGJSucH9CN89OqviPzj7BSMzZpx7oaKFDkEWWspFM4v1YEO
# /5d20BHjYejO08RzblJ9VN4zi+eJ5fGLj5gnpEqxM5Gid34HJb/jMbRhQl9xJZB0
# Z0Q3a9e0OKQqryezE0vmFEzNKuFHzpdFhuGpH0AmutVazaf4scenpLaPHkFsTc2c
# 1z78GJaQEs3YjSWKK20U1aI5cXgXtkhNSzL+D6LYzZyrFwTokklawyrhctl2jQAt
# N1OVNSCll2VDOFAdLevVaKcvOB2CnZXaej566woQPngZtIf5MYIB2jCCAdYCAQEw
# OTAlMSMwIQYDVQQDDBpMVyBQb3dlcnNoZWxsIENvZGUgU2lnbmluZwIQXGoxlt1o
# k7FP9R6mcjA1MzAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKA
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYK
# KwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQU64amP176trrKmPnzpo/EpX7aI8kw
# DQYJKoZIhvcNAQEBBQAEggEAy7L2oIVobJPY2RuM6MG19Cvk54FYXcPX/OrvVXLI
# EtuiEP2ZhmVnK+eBzUiUgjAJNdB/sgDQ3MF7i0AiJvg7tTXeXjwqtw3ysytxg3Ef
# u3iDIysvub75M+gHebW04qeZfYU1pO5VTmmDroh3bg4fJeIeIMRqjMpQzT3tLAt9
# N+qL0iHiRDDFCSztFtPL1WUOfJH0L+SK2U3vx1NyDgy04SxPmJuC1hJUGXztPANf
# FiUGfFHQkfPjrjatdb9YsuxNgCQvjrEJBuL8anfi3idWJX2gJe2U+KdsmxU6V2qV
# wB3UORfESeR/IFrYLr2B8D6RG3siEXeL+IeQSnME1uzx6w==
# SIG # End signature block
