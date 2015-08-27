$makeAppxpath = "C:\Program Files (x86)\Windows Kits\8.0\bin\x64\makeappx.exe";
$inputDirectory = ".\TestPackageingApp";

$exe = $makeAppxpath
&$exe pack /v /d $inputDirectory /p TestPackageingApp.appx