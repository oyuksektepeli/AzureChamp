Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionName "Microsoft Azure"

$rgName = "mac-network-rg"
$zoneName = "macdns.local"

$macvnet80 = "macvnet80"
$hostname80 = "macwin2k1680"
$hostip1 = "10.80.80.4"

$macvnet90 = "macvnet90"
$hostname90 ="macwin2k1690"
$hostip2 = "10.90.90.4"

$vnet80 = Get-AzureRmVirtualNetwork -Name $macvnet80 -ResourceGroupName $rgName
$vnet90 = Get-AzureRmVirtualNetwork -Name $macvnet90 -ResourceGroupName $rgName

New-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -ZoneType Private -ResolutionVirtualNetworkId @($vnet80.Id)
New-AzureRmDnsZone -Name "mac.local" -ResourceGroupName $rgName -ZoneType Private

New-AzureRmDnsRecordSet -Name $hostname80 -RecordType A -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600
New-AzureRmDnsRecordSet -Name $hostname90 -RecordType A -ZoneName $zoneName -ResourceGroupName $rgName  -Ttl 3600

Get-AzureRmDnsRecordSet -ZoneName $zoneName -ResourceGroupName $rgName

Set-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -RegistrationVirtualNetworkId @($vnet90.Id)
Set-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -ResolutionVirtualNetworkId @($vnet60.Id)
Get-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName 