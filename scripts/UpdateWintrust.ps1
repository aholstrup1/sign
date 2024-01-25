param(
    [string] $WintrustIniPath
)


$wintrustini = Get-Content $WintrustIniPath

# Update the Wintrust.ini file to include the NavSIP.dll
$navSipIni = @'

[5]
DLL=NavSip.dll
GUID={36FFA03E-F824-48E7-8E07-4A2DCB034CC7}
CryptSIPDllCreateIndirectData=NavSIPCreateIndirectData
CryptSIPDllGetSignedDataMsg=NavSIPGetSignedDataMsg
CryptSIPDllIsMyFileType2=NavSIPIsFileSupportedName
CryptSIPDllPutSignedDataMsg=NavSIPPutSignedDataMsg
CryptSIPDllRemoveSignedDataMsg=NavSIPRemoveSignedDataMsg
CryptSIPDllVerifyIndirectData=NavSIPVerifyIndirectData
'@

$wintrustini += $navSipIni
Set-Content -Path $WintrustIniPath -Value $wintrustini