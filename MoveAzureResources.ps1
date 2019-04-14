#Move Resource to another resource group

# https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-move-resources

#Move resource to another resource group with powershell

$resource = Get-AzureRmResource -ResourceGroupName plaz-net2-rg -ResourceName VNet1
Move-AzureRmResource -DestinationResourceGroupName plaz-net-rg -ResourceId $resource.ResourceId

#Move resource to another resource group with Azure CLI

$resource=(az resource show -g plaz-net-rg -n vnet1 --resource-type "Microsoft.Network/virtualNetworks" --query id --output tsv)
az resource move --destination-group plaz-net2-rg --id $resource

#Delete Azure Resources
Remove-AzureRMResourceGroup -name mac-dev-rg
Az group delete -n mac-dev-rg
