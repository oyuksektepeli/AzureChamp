#Import Storage Space Powershell Module
import-module "C:\Program Files\Azure\StorageSyncAgent\StorageSync.Management.ServerCmdlets.dll"

#Trigger Cloud Tiering Manually
Inovoke-StorageSyncCloudTiering -Path "F:\AzureChamp\cdnfile01.txt"

#Recall all files to file server
Invoke-StorageSyncFileRecall -Path ""

#File Sync QoS
New-StorageSyncNetworkLimit -Day Monday,Tuesday -StartHour 1 -EndHour 7 -LimimitKbps 60000

