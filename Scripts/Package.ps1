# ============================================================
# Package script Windows Store Applications
# ------------------------------------------------------------
# Created by Teis Lindemark
# Date 23.08.2015
# ============================================================

$basePath = "C:\Program Files (x86)\Windows Kits\8.0\bin\x64\";
$inputDirectory = ".\TestPackageingApp";
$outputPackage = ".\Packeage\TestPackageingApp.appx";

Write-Host "Pakker app..."
$exe = $basePath + "makeappx.exe"
&$exe pack /v /o /d $inputDirectory /p .\Packeage\TestPackageingApp.appx
Write-Host "Pakking ferdig."

Write-Host "Genererer sertifikat"
#$exe = $basePath + "makecert"
#&$exe -a sha1 -sk "teilin.net" -iv teilin.net.pvk -n "CN=teilin.net" -ic teilin.net.cer -sr currentuser -ss My
Write-Host "Ferdig å generere sertifikat"

Write-Host "Signerer app pakke..."
$certThumbprint = Get-ChildItem -path cert:\LocalMachine\My | Where-Object {$_.Subject -match "CN=teis"}
$exe = $basePath + "signtool.exe"
&$exe sign /fd sha256 /sha1 $certThumbprint.Thumbprint $outputPackage
Write-Host "Signering ferdig."

Write-Host "Installing..."
#Add-AppxPackage .\Packeage\TestPackageingApp.appx
Write-Host "Ferdig med installering."

# Deploy
# certutil.exe -addstore root teis.cer
