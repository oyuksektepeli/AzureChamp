#Create Azure Lock with Powershell
New-AzureRMResourceLock -LockName devnotDelete -LockLevel CanNotDelete - ResourceGroupName mac-dev-rg

#Create Azure Lock with Azure CLI
Az lock create --name prodNotDelete --lock-type ReadOnly --resource-group mac-prod-rg

#Remove Azure Lock
$lockId = (Get-AzureRMResourceLock -ResourceGroupName mac-prod-rg).LockId
Remove-AzureRMResourceLock -LockId $lockId
