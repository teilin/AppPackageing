$makeAppxpath = "C:\Program Files (x86)\Windows Kits\8.0\bin\x64\makeappx.exe";
$inputDirectory = ".\TestPackageingApp";

Write-Host "Pakker app..."
$exe = $makeAppxpath
&$exe pack /v /d $inputDirectory /p .\Packeage\TestPackageingApp.appx
Write-Host "Pakking ferdig."

Write-Host "Signerer app pakke..."
$certThumbprint = Get-ChildItem -path cert:\LocalMachine\My | Where-Object {$_.Subject -match "CN=teis"}
$exe = "C:\Program Files (x86)\Windows Kits\8.0\bin\x64\signtool.exe"
&$exe sign /fd sha256 /sha1 $certThumbprint.Thumbprint .\Packeage\TestPackageingApp.appx
Write-Host "Signering ferdig."

Write-Host "Installing..."
Add-AppxPackage .\Packeage\TestPackageingApp.appx
Write-Host "Ferdig med installering."

# Deploy
# certutil.exe -addstore root teis.cer