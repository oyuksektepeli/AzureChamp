$rgName = "mac-dns-rg"
$zoneName = "mac.local"

$macvnet1 = "macvnet1"
$hostname1 = "mac-win2k19-01"
$hostip1 = "10.1.1.4"

$macvnet2 = "macvnet2"
$hostname2 ="mac-win2k19-02"
$hostip2 = "10.2.1.4"

$vnet1 = Get-AzureRmVirtualNetwork -Name $macvnet1 -ResourceGroupName $rgName
$vnet2 = Get-AzureRmVirtualNetwork -Name $macvnet2 -ResourceGroupName $rgName

New-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -ZoneType Private -ResolutionVirtualNetworkId @($vnet1.Id)

New-AzureRmDnsRecordSet -Name $hostname1 -RecordType A -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600
New-AzureRmDnsRecordSet -Name $hostname2 -RecordType A -ZoneName $zoneName -ResourceGroupName $rgName  -Ttl 3600

Get-AzureRmDnsRecordSet -ZoneName $zoneName -ResourceGroupName $rgName

Set-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -RegistrationVirtualNetworkId @($macvnet1.Id)
Set-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName -ResolutionVirtualNetworkId @($macvnet2.Id)