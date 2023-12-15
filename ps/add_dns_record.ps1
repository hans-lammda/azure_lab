$zoneName = "nackademin.local"
$recordName = "NCK-SOL-SRV1"
$ipAddress = "10.0.0.5"

Add-DnsServerResourceRecordA -ZoneName $zoneName -Name $recordName -IPv4Address $ipAddress


$aliasName = "crl"
$targetName = "NCK-SOL-DC1.nackademin.local."

Add-DnsServerResourceRecordCName -ZoneName $zoneName -Name $aliasName -HostNameAlias $targetName

