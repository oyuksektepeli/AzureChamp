#Log into Azure
Connect-AzureAD

$domain = "ContosoNed.onmicrosoft.com"
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "agxsFX72xwsSAi"

#Find an existing user
Get-AzureADUser -SearchString "Istanbul"

Get-AzureADUser -Filter "City eq 'Istanbul'"

#Creating a new user
$user = @{
    City = "Istanbul"
    Country = "Turkey"
    Department = "Information Technology"
    DisplayName = "Haydar Pasa"
    GivenName = "Haydar"
    JobTitle = "IT Admin"
    UserPrincipalName = "haydar.pasa@$domain"
    PasswordProfile = $PasswordProfile
    PostalCode = "34000"
    State = "IST"
    StreetAddress = "Haydar Pasa Caddesi"
    Surname = "Pasa"
    TelephoneNumber = "216-987-6544"
    MailNickname = "Haydarpasa"
    AccountEnabled = $true
    UsageLocation = "TR"
}

$newUser = New-AzureADUser @user

$newUser | Format-List