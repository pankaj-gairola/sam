
Install-Module -Name Azure,AzureRM -force

$s_name = "blobaccount1"

$pass = "u0Wsq7tXPkiUQjclzZqy0tfc0OYgP8S62/tmCrA3ig3QTXLGNNA5rXcfh6r24WiYlIOwLicOUKu26eXWDgeVqQ=="

$ctx = new-azurestoragecontext -StorageAccountName $s_name -StorageAccountKey $pass


Get-AzureStorageBlobContent -Blob installer.xml  -Container sunil-storage-account-container -Destination C:\Windows\Temp\ -Context $ctx

Get-AzureStorageBlobContent -Blob Solarwinds-Orion-SAM-6.6.1-OfflineInstaller.exe  -Container sunil-storage-account-container -Destination C:\Windows\Temp\ -Context $ctx




#Invoke-WebRequest -Uri "https://installer.solarwinds.com/Download/156b7586-4cc0-4867-9f22-f81eeefcdc57/Solarwinds-Orion-SAM.exe" -OutFile "C:\Windows\Temp\Solarwinds-Orion-SAM.exe"

#Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&id=1d8MpgDTUdEzKeWZjtVjO-heVDLe1FGI4" -OutFile "C:\Windows\Temp\installer.xml"


cd "C:\Windows\Temp"


.\Solarwinds-Orion-SAM-6.6.1-OfflineInstaller.exe /s /ConfigFile="C:\Windows\Temp\installer.xml"


#https://blobaccount1.blob.core.windows.net/sunil-storage-account-container/Solarwinds-Orion-SAM-6.6.1-OfflineInstaller.exe
		
