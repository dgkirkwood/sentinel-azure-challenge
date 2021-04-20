provider "azurerm" {
  version = "=2.28.0"
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "dk-azure-storage"
  location = "Australia East"
}

variable "prefix" {
    default = "dkdev"
}

resource "azurerm_virtual_network" "example" {
  name                = "${var.prefix}virtnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "${var.prefix}subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}

resource "azurerm_storage_account" "example" {
  name                = "${var.prefix}storage"
  resource_group_name = azurerm_resource_group.example.name

  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.example.id]
  }


  tags = {
    environment = "staging"
  }
}