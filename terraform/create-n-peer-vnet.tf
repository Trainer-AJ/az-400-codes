# to give command line argument 

# run the below command in terminal 

#  terraform plan -var="vnet-2=192.168.0.0"



resource "azurerm_resource_group" "rg" {
  name     = "TF-resources"
  location = "West Europe"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "example-security-group"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}


resource "azurerm_virtual_network" "vnet-1" {
  name                = "example-network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["${var.address_prefix}/16"]


  subnet {
    name           = "subnet1"
    address_prefix = var.prefix
  }

  subnet {
    name           = "subnet2"
    address_prefix = var.sub-2
    security_group = azurerm_network_security_group.nsg.id
  }

  tags = {
    environment = "Production"
    manager     = "ananay"
  }
}

# Creating vnet=2

resource "azurerm_virtual_network" "vnet-2" {
  name                = "example-network"
  location            = "centralindia"
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["${var.vnet-2}/16"]

/*
  subnet {
    name           = "subnet1"
    address_prefix = ["${var.vnet-2}/24"]
  }
  */
}

resource "azurerm_virtual_network_peering" "example-1" {
  name                      = "peer1to2"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet-1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet-2.id
}

resource "azurerm_virtual_network_peering" "example-2" {
  name                      = "peer2to1"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet-2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet-1.id
}