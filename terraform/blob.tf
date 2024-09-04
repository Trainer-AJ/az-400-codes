terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

# provide credentials 


provider "azurerm" {
  subscription_id = "6751c795-4fa9-49cc-b593-5bfed8f41d66"
  client_id       = "98d70488-dc9b-43ff-813b-e587b6618898"
  client_secret   = "ZLf8Q~Px_S~l-Vx8pYfsiO0A5I9_eRsT_o_7Bc0m"
  tenant_id       = "05902c17-b586-4a82-a1b0-3502c27d30c2"
  features {}
}



resource "azurerm_resource_group" "rg" {
  name     = "tf-hcl-lang"
  location = "West Europe"
}

resource "azurerm_storage_account" "acc" {
  name                     = "ananaytf"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "blob-service" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.acc.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blob-1" {
  name                   = "sample data for blob"
  storage_account_name   = azurerm_storage_account.acc.name
  storage_container_name = azurerm_storage_container.blob-service.name
  type                   = "Block"
  source                 = "./sample-data-for-blob.txt"
}

output "url" {
  value = azurerm_storage_blob.blob-1
}
