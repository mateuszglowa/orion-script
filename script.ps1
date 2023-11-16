# Folders
New-Item -ItemType Directory c:\Temp

Invoke-WebRequest -URI "https://github.com/duncanthrax/scream/releases/download/4.0/Scream4.0.zip" -OutFile "C:\Temp\Scream4.0.zip";
Invoke-WebRequest -URI "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" -OutFile "C:\Temp\SteamSetup.exe";
Invoke-WebRequest -URI "https://www.tightvnc.com/download/2.8.81/tightvnc-2.8.81-gpl-setup-64bit.msi" -OutFile "C:\Temp\tightvnc-2.8.81-gpl-setup-64bit.msi";
