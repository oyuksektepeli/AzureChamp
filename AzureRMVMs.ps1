#Start Azure VM With Powershell
Start-AzureRmVM -ResourceGroupName "mac-dev-rg" -Name "mclinuxvm01"

#Start Azure VM with Azure CLI
az vm start --resource-group mac-dev-rg --name mclinuxvm01

#Stop Azure VM with Powershell
Stop-AzureRmVM -ResourceGroupName "mac-dev-rg" -Name "mclinuxvm01"

#Stop Azure VM with Azure CLI
az vm stop --resource-group mac-dev-rg --name mclinuxvm01



