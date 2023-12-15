#
#  Add-LocalGroupMember -Group "Remote Desktop Users" -Member "hans.lamm@nackademin.local"
#

Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

#
# Windows PowerShell script for AD DS Deployment
#
$dsrmPassword = ConvertTo-SecureString -String "YXA_qwerty1234" -AsPlainText -Force


Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "nackademin.local" `
-DomainNetbiosName "NACKADEMIN" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-SafeModeAdministratorPassword $dsrmPassword `
-Force:$true `
-Confirm:$false

