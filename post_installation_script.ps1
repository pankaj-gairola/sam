
write-host ' installing NuGet module....'; [datetime]::Now
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
write-host ' installed NuGet module....'; [datetime]::Now

write-host ' installing azure module....'; [datetime]::Now
Install-Module -Name Azure,AzureRM -force
write-host ' installed azure module....'; [datetime]::Now

$s_name = "blobaccount1"

$pass = "u0Wsq7tXPkiUQjclzZqy0tfc0OYgP8S62/tmCrA3ig3QTXLGNNA5rXcfh6r24WiYlIOwLicOUKu26eXWDgeVqQ=="


$ctx = new-azurestoragecontext -StorageAccountName $s_name -StorageAccountKey $pass


write-host 'coping text file from azure blob....'; [datetime]::Now
Get-AzureStorageBlobContent -Blob installer.xml  -Container sunil-storage-account-container -Destination C:\Windows\Temp\ -Context $ctx
write-host ' copied text file from azure blob....'; [datetime]::Now

write-host ' copying solarwindinstaller  from azure blob....'; [datetime]::Now
Get-AzureStorageBlobContent -Blob Solarwinds-Orion-SAM-6.6.1-OfflineInstaller.exe  -Container sunil-storage-account-container -Destination C:\Windows\Temp\ -Context $ctx
write-host ' copied solarwindinstaller  from azure blob....'; [datetime]::Now


#Invoke-WebRequest -Uri "https://installer.solarwinds.com/Download/156b7586-4cc0-4867-9f22-f81eeefcdc57/Solarwinds-Orion-SAM.exe" -OutFile "C:\Windows\Temp\Solarwinds-Orion-SAM.exe"

#Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&id=1d8MpgDTUdEzKeWZjtVjO-heVDLe1FGI4" -OutFile "C:\Windows\Temp\installer.xml"


cd "C:\Windows\Temp"

write-host ' starting installation solarwindinstaller....'; [datetime]::Now
.\Solarwinds-Orion-SAM-6.6.1-OfflineInstaller.exe /s /ConfigFile="C:\Windows\Temp\installer.xml"
write-host ' installation completed solarwindinstaller....'; [datetime]::Now

#https://blobaccount1.blob.core.windows.net/sunil-storage-account-container/Solarwinds-Orion-SAM-6.6.1-OfflineInstaller.exe
		
