$rgName = "mac-vnet-rg"
$zoneName = "trainer.local"

$macvnet3 = "macvnet03"
$hostname1 = "macwin2k1603"
$hostip1 = "10.3.0.5"

$macvnet4 = "macvnet04"
$hostname2 ="macwin2k1604"
$hostip2 = "10.4.0.5"

$vnet3 = Get-AzureRmVirtualNetwork -Name $macvnet3 -ResourceGroupName $rgName
$vnet4 = Get-AzureRmVirtualNetwork -Name $macvnet4 -ResourceGroupName $rgName

New-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -ZoneType Private -ResolutionVirtualNetworkId @($vnet3.Id)
New-AzureRmDnsZone -Name "trainer2.local" -ResourceGroupName $rgName -ZoneType Private

New-AzureRmDnsRecordSet -Name $hostname1 -RecordType A -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600
New-AzureRmDnsRecordSet -Name $hostname2 -RecordType A -ZoneName $zoneName -ResourceGroupName $rgName  -Ttl 3600

Get-AzureRmDnsRecordSet -ZoneName $zoneName -ResourceGroupName $rgName

Set-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -RegistrationVirtualNetworkId @($vnet3.Id)
Set-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -ResolutionVirtualNetworkId @($vnet4.Id)