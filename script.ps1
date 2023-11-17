
Param(
    [string] [Parameter(Mandatory = $true)] $pass
)

# Folders
Start-Transcript -Path "C:\Temp\transcript0.txt" -NoClobber
#New-Item -ItemType Directory c:\Temp

Invoke-WebRequest -URI "https://github.com/duncanthrax/scream/releases/download/4.0/Scream4.0.zip" -OutFile "C:\Temp\Scream4.0.zip";
Invoke-WebRequest -URI "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" -OutFile "C:\Temp\SteamSetup.exe";
Invoke-WebRequest -URI "https://www.tightvnc.com/download/2.8.81/tightvnc-2.8.81-gpl-setup-64bit.msi" -OutFile "C:\Temp\tightvnc-2.8.81-gpl-setup-64bit.msi";

Set-Location "C:\Temp\"

.\SteamSetup.exe /S

msiexec /i .\tightvnc-2.8.81-gpl-setup-64bit.msi /quiet /norestart SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=$pass SET_USECONTROLAUTHENTICATION=1
#Start-Process msiexec.exe /i C:\Temp\tightvnc-2.7.1-setup-64bit.msi /quiet /norestart SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=$pass SET_USECONTROLAUTHENTICATION=1
#Start-Process msiexec.exe -Wait -ArgumentList '/I C:\Temp\tightvnc-2.7.1-setup-64bit.msi /quiet /norestart SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=$pass SET_USECONTROLAUTHENTICATION=1'

Stop-Transcript