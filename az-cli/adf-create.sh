# Ask me for location 
read -p "Put Location: " region
read -p "Resource Group Name: " RG
read -p "Azure Data Factory Name: " adf_name

# Creates a Resource Group
az group create -n $RG -l $region -o table

# Creates ADF for me
az datafactory create --location $region --name $adf_name --resource-group $RG
