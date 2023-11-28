install:
	curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

#
# Test it twice 
# https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli
# 
login: 
	az login
