#Log into Azure

Connect-AzureAD



#Get all the groups in Azure AD Tenant

Get-AzureADGroup



#Get the Information Technology Group

$group = Get-AzureADGroup -SearchString "Information Technology"



#Get all members and the owner

Get-AzureADGroupMember -ObjectId $group.ObjectId



Get-AzureADGroupOwner -ObjectId $group.ObjectId



#Create a new group

$group = @{

    DisplayName = "Champ Group"

    MailEnabled = $false

    MailNickName = "ChampGroup"

    SecurityEnabled = $true

}



$newGroup = New-AzureADGroup @group



#Update the group description

Set-AzureADGroup -ObjectId $newGroup.ObjectId -Description "Group for Champ to use."



#Set Ford as the owner

$haydar = Get-AzureADUser -Filter "DisplayName eq 'Haydar Pasa'"



Add-AzureADGroupOwner -ObjectId $newGroup.ObjectId -RefObjectId $haydar.ObjectId



#Add users to the group

$users = Get-AzureADUser -Filter "City eq 'Istanbul'"



foreach($user in $users){

    Add-AzureADGroupMember -ObjectId $newGroup.ObjectId -RefObjectId $user.ObjectId

}



#AzureADPreview Only

$dynamicGroup = @{

    DisplayName = "Marketing Group"

    MailEnabled = $false

    MailNickName = "MarketingGroup"

    SecurityEnabled = $true

    Description = "Dynamic group for Marketing"

    GroupTypes = "DynamicMembership"

    MembershipRule = "(user.department -contains ""Marketing"")"

    MembershipRuleProcessingState = "On"

}



New-AzureADMSGroup @dynamicGroup