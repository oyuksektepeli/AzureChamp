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
