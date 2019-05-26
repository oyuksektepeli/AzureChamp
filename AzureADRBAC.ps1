#Get Azure RBAC Roles
Get-AzureADDirectoryRole

$CompanyAdminRole = Get-AzureADDirectoryRole | Where-Object {$_.DisplayName -eq "Company Administrator"}

#Get members of Role
Get-AzureADDirectoryRoleMember -ObjectId $CompanyAdminRole.ObjectId

#Get Role Templates
Get-AzureADDirectoryRoleTemplate

$SecurityAdminRoleTemplate = Get-AzureADDirectoryRoleTemplate | Where-Object {$_.DisplayName -eq "Security Administrator"}

#Activate the role
$SecurityAdminRole = Enable-AzureADDirectoryRole -RoleTemplateId $SecurityAdminRoleTemplate.ObjectId

#Get user
$user = Get-AzureADUser -Top 1

#Add user to role
Add-AzureADDirectoryRoleMember -RefObjectId $user.ObjectId -ObjectId $SecurityAdminRole.ObjectId