#Get Tags of Resource Group
(Get-AzureRMResourceGroup -Name mac-dev-rg).Tags

#Add Tags to Resources with Powershell
Set-AzureRMResourceGroup -Name mac-dev-rg -Tag @{ Dept="IT"; Owner="Onur Yuksektepeli"}

#Add Tags to Existing List with Powershell
$tags = (Get-AzureRMResourceGroup -Name mac-dev-rg).Tags
$tags.add("CostCenter","ECommerce")
Set-AzureRmResourceGroup -Tag $tags -name mac-dev-rg

#Add Tags to Resources with Azure CLI
Az group show -n mac-dev-rg --query tags
Az group update -n mac-dev-rg --set tags.Owner=OnurYuksektepeli tags.Deparment=IT

#Clear Resource Tags with Powershell
Set-AzureRMResourceGroup -Tag @{} -Name mac-dev-rg
