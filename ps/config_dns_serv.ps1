
Set-DnsServer -InterfaceListenIPAddress "10.0.0.4"
Restart-Service -Name "dns"
