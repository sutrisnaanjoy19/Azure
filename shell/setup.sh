curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az login
az get projects
az account list
az account --output json
az account show
az account show --query name
az account show --query user.name
az account list --query "[].{subscription_id:id, name:name, isDefault:isDefault}" -o table

#create a new resourcegroup
location="East US"
resourceGroup='Azure-testing'
az group create --name "Azure-testing" --location "East US" --tags cluster-agent=testing
#delete a resourcegroup
az group delete --name $resourceGroup -y

#create RBAC
az ad sp create-for-rbac --skip-assignment
