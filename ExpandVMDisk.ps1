#Resizing the OS Disk of an Azure Virtual Machine will cause it to restart.
#After expanding the disks, you need to expand the volume within the OS to take advantage of the larger disk.

#The new size should be greater than the existing disk size. The maximum allowed is 2048 GB for OS disks. 
#(It is possible to expand the VHD blob beyond that size, but the OS will only be able to work with the first 2048 GB of space.)

#EXPAND MANAGED DISK
Connect-AzAccount
Select-AzSubscription -SubscriptionName 'my-subscription-name'
$rgName = 'my-resource-group-name'
$vmName = 'my-vm-name'
$vm = Get-AzVM -ResourceGroupName $rgName -Name $vmName
Stop-AzVM -ResourceGroupName $rgName -Name $vmName
$disk= Get-AzDisk -ResourceGroupName $rgName -DiskName $vm.StorageProfile.OsDisk.Name
$disk.DiskSizeGB = 1023
Update-AzDisk -ResourceGroupName $rgName -Disk $disk -DiskName $disk.Name
Start-AzVM -ResourceGroupName $rgName -Name $vmName


#EXPAND UNMANAGED DISK
Connect-AzAccount
Select-AzSubscription -SubscriptionName 'my-subscription-name'
$rgName = 'my-resource-group-name'
$vmName = 'my-vm-name'
$vm = Get-AzVM -ResourceGroupName $rgName -Name $vmName
Stop-AzVM -ResourceGroupName $rgName -Name $vmName
$vm.StorageProfile.OSDisk.DiskSizeGB = 1023
Update-AzVM -ResourceGroupName $rgName -VM $vm
Start-AzVM -ResourceGroupName $rgName -Name $vmName

#Resize attached Managed Data Disk
$disk= Get-AzureRMDisk -ResourceGroupName $rgName -DiskName $vm.StorageProfile.DataDisks[0].Name
$disk.DiskSizeGB = 1023

#Resize attached Unmanaged Data Disk
$vm.StorageProfile.DataDisks[0].DiskSizeGB = 1023
