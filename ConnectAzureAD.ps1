#Install Azure AD Module
Find-Module AzureAD

Install-Module -Name AzureAD

Import-Module -Name AzureAD

#Get credentials for Azure AD
$cred = Get-Credential -Message "Username and Password for Azure AD"

#Connect Azure AD
Connect-AzureAD -Credential $cred 

#Get Session Info
Get-AzureADCurrentSessionInfo

#Get Information about Tenant
Get-AzureADTenantDetail

Get-AzureADDomain





