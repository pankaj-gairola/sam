Invoke-WebRequest -Uri "https://installer.solarwinds.com/Download/156b7586-4cc0-4867-9f22-f81eeefcdc57/Solarwinds-Orion-SAM.exe" -OutFile "C:\Windows\Temp\Solarwinds-Orion-SAM.exe"

Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&id=1d8MpgDTUdEzKeWZjtVjO-heVDLe1FGI4" -OutFile "C:\Windows\Temp\installer.xml"


cd "C:\Windows\Temp"


.\Solarwinds-Orion-SAM.exe /s /ConfigFile="C:\Windows\Temp\installer.xml"
