terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

terraform {
  backend "azurerm" {
   resource_group_name  = "az-801"
    storage_account_name = "az801testy"
    container_name       = "tf-b"
    key                  = "rg-pipeline.tfstate"
  }
}

provider "azurerm" {
  # Configuration options
  features{}
}

resource "azurerm_resource_group" "example" {
  name     = "tf"
  location = "West Europe"
}
