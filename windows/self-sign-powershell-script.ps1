# script to sign a powershell script for when your 
# execution policy is AllSigned
#   (Set-ExecutionPolicy -Scope CurrentUser AllSigned)

# TODO: fill in the full script path here
$ScriptPath = ""

#Parameters
$CertificateName = "PowerShell Code Signing"
 
#Create a Self-Signed SSL certificate
$Certificate = New-SelfSignedCertificate -CertStoreLocation Cert:\CurrentUser\My -Subject "CN=$CertificateName" -KeySpec Signature -Type CodeSigningCert
 
#Export the Certificate to "Documents" Folder in your computer
$CertificatePath = [Environment]::GetFolderPath("MyDocuments") + "\$CertificateName.cer"
Export-Certificate -Cert $Certificate -FilePath $CertificatePath
 
#Add Certificate to the "Trusted Root Store"
Get-Item $CertificatePath | Import-Certificate -CertStoreLocation "Cert:\LocalMachine\Root"
  
Write-host "Certificate Thumbprint:" $Certificate.Thumbprint

#Get the Certificate from Cert Store
$CodeSignCert = Get-ChildItem -Path Cert:\CurrentUser\My | Where-Object { $_.Thumbprint -eq $Certificate.Thumbprint }
 
#Sign the PS1 file
Set-AuthenticodeSignature -FilePath $ScriptPath -Certificate $CodeSignCert