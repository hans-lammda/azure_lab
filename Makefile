install:
	curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

SUBSCRIPTION_ID=dcf325b5-3e47-48b8-a84d-0f58b01b7864
SUBSCRIPTION_ID=64906a88-9fc7-4d8e-812b-9d222c84be1f


RESOURCE_GRP="Labbmiljo"

subnetName=Subnet
vnetAddressPrefix=10.0.0.0/16
subnetAddressPrefix=10.0.0.0/24

REGION=westeurope

#
# https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli
# 
login: 
	az login

logout: 
	az logout

subscriptions: 
	az account list --all 

subid:
	az account list --all --query '[].{Name:name, ID:id, State:state, Default:isDefault}' --output table


set: 
	az account set --subscription $(SUBSCRIPTION_ID) 

regions: 
	#az account list-locations --query '[].name' --output table
	az account list-locations --output table

add_res_grp:
	@az group create --name $(RESOURCE_GRP)  --location $(REGION)

list_images: 
	az vm image list --location $(REGION) --publisher MicrosoftWindowsServer --output table

list_res_grp: 
	@az group list  


create_net: 
	az network vnet create \
	--name $(RESOURCE_GRP)-vnet \
	--resource-group $(RESOURCE_GRP) \
	--address-prefixes $(vnetAddressPrefix) \
	--subnet-name $(subnetName) \
	--subnet-prefixes $(subnetAddressPrefix)


list_net:
	az network vnet list 

list_vm_size:
	az vm list-sizes --location $(REGION) --output table


create_vm: 
	az vm create \
	  --resource-group $(RESOURCE_GRP)  \
	  --name NCK-SQL-DC1 \
	  --image MicrosoftWindowsServer:WindowsServer:2019-datacenter-gensecond:latest \
	  --size Standard_B1ms \
	  --admin-username hans \
	  --admin-password YXA_qwerty1234 | jq . 

sku:
	#az vm list-skus --location $(REGION)  --size Standard_B1ms --all --output table
	az vm list-skus --location $(REGION)  --all --output table


#  --public-ip-address pubip \
#  --ports 3389
#  --data-disk-sizes-gb 100 \
#  --data-disk-storage-account-type Standard_LRS



atoken: 
	az account get-access-token --query accessToken -o tsv | tee access_token

stored_token:
	cat $$HOME/.azure/msal_token_cache.json | jq . 


dump:
	@cat access_token   |  awk -F. '{print $$2}' |  base64 -d 2> /dev/null | jq '.'


