
Param(
    [string] [Parameter(Mandatory = $true)] $pass
)

# Folders
Start-Transcript -Path "C:\Temp\transcript0.txt" -NoClobber
#New-Item -ItemType Directory c:\Temp

Invoke-WebRequest -URI "https://github.com/duncanthrax/scream/releases/download/4.0/Scream4.0.zip" -OutFile "C:\Temp\Scream4.0.zip";
Invoke-WebRequest -URI "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" -OutFile "C:\Temp\SteamSetup.exe";
Invoke-WebRequest -URI "https://www.tightvnc.com/download/2.8.81/tightvnc-2.8.81-gpl-setup-64bit.msi" -OutFile "C:\Temp\tightvnc-2.8.81-gpl-setup-64bit.msi";
Invoke-WebRequest -URI "https://www.lo4d.com/get-file/custom-resolution-utility/3cb7a4d0c5db8b72dfed4e43eda52da1/" -OutFile "C:\Temp\cru-1.5.2.zip";

Set-Location "C:\Temp\"
Write-Output "Installing Steam Client"
.\SteamSetup.exe /S

Write-Output "Installing tightvnc-2 - VNC"
msiexec /i C:\Temp\tightvnc-2.8.81-gpl-setup-64bit.msi /quiet /norestart SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=$pass SET_USECONTROLAUTHENTICATION=1 SERVER_REGISTER_AS_SERVICE=1

Write-Output "Installing Scream - Virtual Audio drivers"
Expand-Archive -Path C:\Temp\Scream4.0.zip -DestinationPath C:\Temp\Scream4
Start-Process -FilePath "C:\Temp\Scream4\Install\Install-x64.bat" 

Stop-Transcript