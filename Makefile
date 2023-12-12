#  https://learn.microsoft.com/en-us/cli/azure/ + ChatGPT 
#  https://github.com/Azure-Samples/azure-cli-samples/
#  https://learn.microsoft.com/en-us/entra/identity-platform/app-objects-and-service-principals?source=recommendations&tabs=browser
#  https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli
# 
#
#  1. Create a Resource Group
#  2. Create a Virtual Network
#  3. Create a Subnet 
#  4. Create a Network Security Group 
#  5. Create a Virtual Machine
#  5.1.  Create a Public IP Address 
#  5.2.  Create a Network Interface
#  5.3.  Create a Disk 
#  6. Create a Firewall rule for Remote desktop 
#
##################################################################
#   
#  CRUD Design pattern , but skip Update 
#  1. create 
#  2. remove 
#  3. display 




SHELL=/usr/bin/bash


deploy_net:  create_virtual_net create_subnet create_nsg   
deploy_vm:   create_vm firewall
deploy:  deploy_net deploy_vm

delete: stop_vm delete_res_grp


install:
	curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash



include config.SQL
include secrets

login: 
	az login # --tenant $(TENANT_ID)

create_sp:
	az ad sp create-for-rbac --name $(SP_GRP_NAME) --role $(SP_ROLE) --scopes /subscriptions/$(SUBSCRIPTION_ID)/resourceGroups/$(RESOURCE_GRP) 

update_sp:
	az ad sp create-for-rbac --name $(SP_GRP_NAME) --role $(SP_ROLE) --scopes /subscriptions/$(SUBSCRIPTION_ID)/resourceGroups/$(RESOURCE_GRP) 

sp_login:
	az login --service-principal -u $(CLIENT_ID) -p $(CLIENT_SECRET) --tenant $(TENANT_ID)

logout: 
	az logout

#
#  1. Resource Group  
#

create_res_grp:
	@az group create --name $(RESOURCE_GRP)  --location $(REGION)

remove_res_grp: 
	az group delete --name $(RESOURCE_GRP)  --yes --force-deletion-types Microsoft.Compute/virtualMachines

# Keep the resource group, but delete resources 
delete_res_grp: 
	az  resource delete --ids $(shell az resource list --resource-group  $(RESOURCE_GRP) --query "[].id" --output tsv) 

display_res_grp: 
	@az group list  --output table


#
#  2. Virtual Network   
#
create_virtual_net:
	@az network vnet create --resource-group  $(RESOURCE_GRP)  --name $(RESOURCE_GRP)-vnet --address-prefixes $(vnetAddressPrefix) 

remove_virtual_net: 
	@az network vnet delete --resource-group $(RESOURCE_GRP)  --name  $(RESOURCE_GRP)-vnet 

display_virtual_net: 
	@az network vnet list --resource-group  $(RESOURCE_GRP)  --output table




#
#  3. Subnet 
#
create_subnet:
	@az network vnet subnet create --resource-group  $(RESOURCE_GRP)  --vnet-name $(RESOURCE_GRP)-vnet --name $(RESOURCE_GRP)-sub --address-prefixes $(subnetAddressPrefix) 

remove_subnet: 
	@az network vnet subnet delete --resource-group $(RESOURCE_GRP) --vnet-name $(RESOURCE_GRP)-vnet  --name   $(RESOURCE_GRP)-sub  

display_subnet: 
	@az network vnet subnet list --resource-group  $(RESOURCE_GRP) --vnet-name $(RESOURCE_GRP)-vnet   --output table


#
#  4.  Network Security Group
#
create_nsg:
	@az network nsg create --resource-group  $(RESOURCE_GRP)  --name $(RESOURCE_GRP)-nsg

remove_nsg: 
	@az network nsg delete --resource-group $(RESOURCE_GRP)  --name   $(RESOURCE_GRP)-nsg

display_nsg: 
	@az network nsg list --resource-group  $(RESOURCE_GRP)  --output table

#
#  5.   Virtual machine
#
create_vm:
	az vm create \
	  --resource-group $(RESOURCE_GRP)  \
	  --name $(VM_NAME) \
	  --image $(VM_IMAGE) \
	  --admin-username $(ADMIN_USERNAME) \
	  --admin-password $(ADMIN_PASSWORD) \
	  --size $(VM_SIZE) \
          --vnet-name $(RESOURCE_GRP)-vnet \
          --subnet $(RESOURCE_GRP)-sub \
          --nsg $(RESOURCE_GRP)-nsg \
          --public-ip-address  $(RESOURCE_GRP)-$(VM_NAME)-ip \
          --os-disk-size-gb $(DISK_SIZE) \
          --os-disk-name  $(RESOURCE_GRP)-$(VM_NAME)-disk 


stop_vm: 
	@az vm  stop --resource-group $(RESOURCE_GRP)  --name $(VM_NAME) 

remove_vm: 
	@az vm deallocate --resource-group $(RESOURCE_GRP)  --name $(VM_NAME)

display_vm: 
	@az vm list --resource-group  $(RESOURCE_GRP)  --output table

#
#  5.1  Public IP 
#
create_public_ip:
	@az network public-ip create --resource-group $(RESOURCE_GRP)  --name $(RESOURCE_GRP)-ip \
	--version IPv4  --sku Standard --zone 1 2 3 

remove_public_ip: 
	@az network public-ip  delete --resource-group $(RESOURCE_GRP)  --name $(RESOURCE_GRP).ip

display_public_ip: 
	#@az network public-ip  list --resource-group  $(RESOURCE_GRP)  --output table
	@az vm show --resource-group $(RESOURCE_GRP)   --name $(VM_NAME)  --show-details --query 'publicIps' --output tsv


#
#  5.2  Network Interface
#
create_nif:
	@az network nic create --resource-group $(RESOURCE_GRP)  --name $(RESOURCE_GRP)-nic \
	--vnet-name $(RESOURCE_GRP)-vnet --subnet  $(RESOURCE_GRP)-sub \
	--network-security-group $(RESOURCE_GRP)-nsg # --public-ip-address $(RESOURCE_GRP)-ip

remove_nif: 
	@az network nic  delete --resource-group $(RESOURCE_GRP)  --name $(RESOURCE_GRP)-nic

display_nif: 
	@az network nic  list --resource-group  $(RESOURCE_GRP)  --output table


#
#  5.3   Storage Account 
#
create_storage:
	@az disk create --resource-group $(RESOURCE_GRP) --name $(RESOURCE_GRP)-disk --size-gb 100  --sku Standard_LRS

remove_storage: 
	@az disk  delete --resource-group $(RESOURCE_GRP)  --name $(RESOURCE_GRP)-disk --yes

display_storage: 
	@az disk   list --resource-group  $(RESOURCE_GRP)  --output table



#
#  6.   Firewall , open up incoming  tcp traffic 
#
firewall: 
	az network nsg rule create \
	  --resource-group $(RESOURCE_GRP)  \
	  --nsg-name $(RESOURCE_GRP)-nsg \
	  --name Allow-$(INBOUND_PORT)-Inbound \
	  --priority 1000 \
	  --direction Inbound \
	  --access Allow \
	  --protocol Tcp \
	  --source-address-prefix $(shell curl --silent 'https://api.ipify.org?format=txt' ) \
	  --source-port-range '*' \
	  --destination-address-prefix '*' \
	  --destination-port-range $(INBOUND_PORT)

#
# Remote execution of commands 
#
test: 
	az vm run-command invoke --resource-group $(RESOURCE_GRP)  --name $(VM_NAME)  --command-id RunPowerShellScript --scripts "Get-Date"

decrypt:
	 sops --decrypt secrets.enc > secrets 
