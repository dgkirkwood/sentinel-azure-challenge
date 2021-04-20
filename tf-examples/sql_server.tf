provider "azurerm" {
  version = "=2.28.0"
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "dk-azure-storage"
  location = "Australia East"
}



resource "azurerm_mssql_server" "example" {
  name                         = "hashicorp-payments-myproject01"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  }


  tags = {
    environment = "production"
  }
}