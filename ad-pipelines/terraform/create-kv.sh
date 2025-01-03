#!/bin/bash

# Variables (replace these with your actual values or set them dynamically)
resource_group="myResourceGroup"
location="eastus"  # Choose your desired location
base_key_vault_name="myKeyVault"  # Base name of the Key Vault (will append GUID)
SP="00000000-0000-0000-0000-000000000000"
SECRET="12345678-0000-0000-0000-000000000000"
TENANT="10000000-0000-0000-0000-000000000000"
SUB="20000000-0000-0000-0000-000000000000"

# Generate a GUID and append it to the Key Vault name to ensure uniqueness
guid=$(uuidgen)
key_vault_name="${base_key_vault_name}-${guid}"

# Create a resource group (if it doesn't exist)
az group create --name $resource_group --location $location

# Create the Key Vault
az keyvault create --name $key_vault_name --resource-group $resource_group --location $location

# Store secrets in the Key Vault
az keyvault secret set --vault-name $key_vault_name --name "ARM-Client-ID" --value $SP
az keyvault secret set --vault-name $key_vault_name --name "ARM-Client-Secret" --value $SECRET
az keyvault secret set --vault-name $key_vault_name --name "ARM-Tenant-ID" --value $TENANT
az keyvault secret set --vault-name $key_vault_name --name "ARM-Subscription-ID" --value $SUB

echo "Key Vault '$key_vault_name' created and secrets have been successfully added."
