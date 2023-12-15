#
# powershell.exe -File .\dns_report.ps1
# 

# Get the DNS server IP address from the local machine
$dnsServers = Get-DnsClientServerAddress | Where-Object { $_.ServerAddresses -ne $null -and $_.InterfaceAlias -ne "Loopback Pseudo-Interface 1" }

# Check if a non-loopback DNS server IP address is found
if ($dnsServers -eq $null) {
    Write-Host "Unable to determine a valid DNS server IP address. Please check your network configuration."
    exit
}

# Select the first non-loopback DNS server IP address
$dnsServer = $dnsServers[0].ServerAddresses[0]

# Specify the zone
$zone = "nackademin.local"

# Query for all DNS records in the specified zone
$dnsRecords = Get-DnsServerResourceRecord -ZoneName $zone -ComputerName $dnsServer

# Create a custom object for JSON output
$jsonOutput = [PSCustomObject]@{
    Zone = $zone
    DnsServer = $dnsServer
    Records = $dnsRecords | Select-Object HostName, RecordType, RecordData
}

# Convert the custom object to JSON format
$jsonString = $jsonOutput | ConvertTo-Json

# Display the JSON output
Write-Host $jsonString
