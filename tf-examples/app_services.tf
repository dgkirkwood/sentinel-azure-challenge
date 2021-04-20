provider "azurerm" {
  version = "=2.28.0"
  features {
  }
}

resource "azurerm_resource_group" "learning" {
  name     = "${var.prefix}-rg"
  location = var.location
}



resource azurerm_app_service "learning-api" {
  name                = "${var.prefix}-api"
  location            = azurerm_resource_group.learning.location
  resource_group_name = azurerm_resource_group.learning.name
  app_service_plan_id = azurerm_app_service_plan.learning.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
    ip_restriction {
      ip_address = "10.0.0.0/24"
    }
  }



}


resource azurerm_app_service_plan "learning" {
  name                = "${var.prefix}servicePlan"
  location            = azurerm_resource_group.learning.location
  resource_group_name = azurerm_resource_group.learning.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}