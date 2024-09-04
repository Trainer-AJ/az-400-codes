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
  subscription_id = "95598785-9247-4f61-addb-aba61df1478d"
  client_id       = "c13a32cd-bc38-458e-9602-14f869f44dc4"
  client_secret   = "5Zf8Q~r7YX40w.8NY0KDeZpc2C7w8_UUT12Uvc.x"
  tenant_id       = "2b49a086-c973-47b8-b66a-804a13e48102"
  features {}
}
