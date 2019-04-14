#MANAGE STORAGE WiTH POWERSHELL
Connect-AzureRMAccount
Get-AzureRMLocation | select Location
$location = "westeurope"

$resourceGroup = "myResourceGroup"
New-AzureRMResourceGroup -Name $resourceGroup -Location $location

#Create a storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroup `
  -Name "mystorageaccount" `
  -SkuName Standard_LRS `
  -Location $location `

$ctx = $storageAccount.Context

#Create a container
$containerName = "quickstartblobs"
new-AzurermStoragecontainer -Name $containerName -Context $ctx -Permission blob


# upload a file
set-AzStorageblobcontent -File "D:\_TestImages\Image001.jpg" `
  -Container $containerName `
  -Blob "Image001.jpg" `
  -Context $ctx 

# upload another file
set-AzStorageblobcontent -File "D:\_TestImages\Image002.png" `
  -Container $containerName `
  -Blob "Image002.png" `
  -Context $ctx

  #List the blobs in a container
  Get-AzStorageBlob -Container $ContainerName -Context $ctx | select Name

  #Download blobs
  # download first blob
Get-AzStorageblobcontent -Blob "Image001.jpg" `
-Container $containerName `
-Destination "D:\_TestImages\Downloads\" `
-Context $ctx 

# download another blob
Get-AzStorageblobcontent -Blob "Image002.png" `
-Container $containerName `
-Destination "D:\_TestImages\Downloads\" `
-Context $ctx

#Data transfer with AzCopy
./AzCopy `
    /Source:C:\myfolder `
    /Dest:https://mystorageaccount.blob.core.windows.net/mystoragecontainer `
    /DestKey:<storage-account-access-key> `
    /Pattern:"myfile.txt"

#MANAGE STORAGE WiTH AZ CLI

#Create a resource group
az group create \
    --name myResourceGroup \
    --location eastus

#Create a storage account
    az storage account create \
    --name mystorageaccount \
    --resource-group myResourceGroup \
    --location eastus \
    --sku Standard_LRS \
    --encryption blob
    --kind StorageV2


#Specify storage account credentials

az storage account keys list \
    --account-name mystorageaccount \
    --resource-group myResourceGroup \
    --output table

#set environment variable on linux
export AZURE_STORAGE_ACCOUNT="mystorageaccountname"
export AZURE_STORAGE_KEY="myStorageAccountKey"

#set environment variable on windows
SET AZURE_STORAGE_ACCOUNT="ConnectionString"

az storage account show-connection-string --name "storageaccountname" --resource-group "resourcegroupname"

#Create a container
az storage container create --name mystoragecontainer
az storage container create --name "containername" --public-access blob
az storage container set-permission --name "containername" --public-access container


#Upload a blob
az storage blob upload \
    --container-name mystoragecontainer \
    --name blobName \
    --file ~/path/to/local/file

#This operation creates the blob if it doesn't already exist, and overwrites it if it does. Upload as many files as you like before continuing.
    az storage blob upload \
    --container-name mystoragecontainer \
    --name helloworld \
    --file helloworld

#List the blobs in a container
az storage blob list \
    --container-name mystoragecontainer \
    --output table

#Download a blob
az storage blob download \
    --container-name mystoragecontainer \
    --name blobName \
    --file ~/destination/path/for/file
