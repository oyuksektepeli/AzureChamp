#Create Resource Group from Azure Powershell
New-Azurermresourcegroup -name "mac-prod-rg" -Location "West Europe"

#Create Resource Group from Azure CLI
Az group create --name "mac-dev-rg" --location "West Europe"
