#Connect Azure with Powershell

#Connect and Authenticate
Connect-AzureRmAccount

#Get Current Connected Subscription/Context
Get-AzureRmContext

#Get All Azure Subscriptions
Get-AzRmSubscription | more

#Select Azure Subscription
Select-AzureRmSubscription -SubscriptionName "Subscription Name"


#Connect Azure with Azure CLI

#Connect and Authenticate
Az login

#Get All Azure Subscriptions
az account list

#Select Azure Subscription
az account set --subscription "subscription-name"
