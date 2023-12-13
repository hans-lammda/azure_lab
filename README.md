# installation of az 
All commands are included in a Makefile 
just exectute the target ( $ make install ) 

<strong>make install</strong>
<pre>
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
</pre>

# Login as a human user 
<strong>make login</strong>
<pre>
az login 
A web browser has been opened at https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize. 
[
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "20e9e658-d844-4d9c-a0b7-36389d71736f",
    "id": "dcf325b5-3e47-48b8-a84d-0f58b01b7864",
    "isDefault": false,
    "managedByTenants": [],
    "name": "Azure for Students",
    "state": "Disabled",
    "tenantId": "20e9e658-d844-4d9c-a0b7-36389d71736f",
    "user": {
      "name": "hans.lamm@nackademin.se",
      "type": "user"
    }
  }
]
</pre>
# Login with service principal 
<pre>
  az ad sp create-for-rbac --name sp_resgrp --role contributor --scopes /subscriptions/<subscription uuid>/resourceGroups/<Resource group string>
    
  This command will create and return credentials that must be encrypted. <a href="https://github.com/getsops/sops">SOPS</a> supports secrets handling.
</pre>



