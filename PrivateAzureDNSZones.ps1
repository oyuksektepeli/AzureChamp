Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionName "Microsoft Azure"

$rgName = "mac-vnet-rg"
$zoneName = "trainer3.local"

$macvnet60 = "macvnet60"
$hostname60 = "macwin2k1660"
$hostip1 = "10.60.60.4"

$macvnet70 = "macvnet70"
$hostname70 ="macwin2k1670"
$hostip2 = "10.70.70.4"

$vnet60 = Get-AzureRmVirtualNetwork -Name $macvnet60 -ResourceGroupName $rgName
$vnet70 = Get-AzureRmVirtualNetwork -Name $macvnet70 -ResourceGroupName $rgName

New-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -ZoneType Private -ResolutionVirtualNetworkId @($vnet60.Id)
New-AzureRmDnsZone -Name "mac.local" -ResourceGroupName $rgName -ZoneType Private

New-AzureRmDnsRecordSet -Name $hostname60 -RecordType A -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600
New-AzureRmDnsRecordSet -Name $hostname70 -RecordType A -ZoneName $zoneName -ResourceGroupName $rgName  -Ttl 3600

Get-AzureRmDnsRecordSet -ZoneName $zoneName -ResourceGroupName $rgName

Set-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -RegistrationVirtualNetworkId @($vnet70.Id)
Set-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -ResolutionVirtualNetworkId @($vnet60.Id)
Get-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName 