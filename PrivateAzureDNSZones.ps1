$rgName = "mac-network-rg"
$zoneName = "mac.local"

$macvnet40 = "macvnet40"
$hostname40 = "macwin2k1640"
$hostip1 = "10.40.40.4"

$macvnet50 = "macvnet50"
$hostname50 ="macwin2k1650"
$hostip2 = "10.50.50.4"

$macvnet40 = Get-AzureRmVirtualNetwork -Name $macvnet40 -ResourceGroupName $rgName
$macvnet50 = Get-AzureRmVirtualNetwork -Name $macvnet50 -ResourceGroupName $rgName

New-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -ZoneType Private -ResolutionVirtualNetworkId @($vnet40.Id)
New-AzureRmDnsZone -Name "trainer2.local" -ResourceGroupName $rgName -ZoneType Private

New-AzureRmDnsRecordSet -Name $hostname40 -RecordType A -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600
New-AzureRmDnsRecordSet -Name $hostname50 -RecordType A -ZoneName $zoneName -ResourceGroupName $rgName  -Ttl 3600

Get-AzureRmDnsRecordSet -ZoneName $zoneName -ResourceGroupName $rgName

Set-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -RegistrationVirtualNetworkId @($vnet3.Id)
Set-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -ResolutionVirtualNetworkId @($vnet10.Id)