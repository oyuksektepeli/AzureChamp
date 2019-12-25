#Connect Azure with Powershell

#Connect and Authenticate
Connect-AzAccount

#Get Current Connected Subscription/Context
Get-AzureRmContext

#Get All Azure Subscriptions
Get-AzSubscription | more

#Select Azure Subscription
Select-AzContext


#Connect Azure with Azure CLI

#Connect and Authenticate
Az login

#Get All Azure Subscriptions
az account list

#Select Azure Subscription
az account set --subscription "subscription-name"
