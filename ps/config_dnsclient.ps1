# Configure DNS Resolver. Note: The Ethernet adapter name may depend on the VM Size 

Set-DnsClientServerAddress -InterfaceAlias "Ethernet 2" -ServerAddresses "10.0.0.4"
