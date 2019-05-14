$rgName = "mac-network-rg"
$zoneName = "mac.local"

$macvnet10 = "macvnet10"
$hostname10 = "macwin2k1610"
$hostip1 = "10.10.10.4"

$macvnet20 = "macvnet20"
$hostname20 ="macwin2k1620"
$hostip2 = "10.20.20.4"

$vnet10 = Get-AzureRmVirtualNetwork -Name $macvnet10 -ResourceGroupName $rgName
$vnet20 = Get-AzureRmVirtualNetwork -Name $macvnet20 -ResourceGroupName $rgName

New-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -ZoneType Private -ResolutionVirtualNetworkId @($vnet40.Id)
New-AzureRmDnsZone -Name "trainer2.local" -ResourceGroupName $rgName -ZoneType Private

New-AzureRmDnsRecordSet -Name $hostname10 -RecordType A -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600
New-AzureRmDnsRecordSet -Name $hostname20 -RecordType A -ZoneName $zoneName -ResourceGroupName $rgName  -Ttl 3600

Get-AzureRmDnsRecordSet -ZoneName $zoneName -ResourceGroupName $rgName

Set-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -RegistrationVirtualNetworkId @($vnet3.Id)
Set-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -ResolutionVirtualNetworkId @($vnet10.Id)