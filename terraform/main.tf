
terraform {
  required_version = "> 0.12.0"
}

provider "azurerm" {
  version = ">=2.0.0"
  features {}
}


# resource "azurerm_resource_group" "example" {
#   name     = "example-resources"
#   location = "West Europe"
# }

#Concierge subscription

data "azurerm_resource_group" "azure_apps_rg" {
  name = "learn-9c26e120-0646-47e4-aeec-9adb5640573b"
}

output "resource_group_id" {
  value = data.azurerm_resource_group.azure_apps_rg.id
}


resource "azurerm_app_service_plan" "serviceplan" {
  name                = "ASP-${data.azurerm_resource_group.azure_apps_rg.name}"
  location            = "centralus"
  resource_group_name = data.azurerm_resource_group.azure_apps_rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Free"
    size = "F1"
  }
  
}

# data "azurerm_app_service_plan" "serviceplan" {
#   name = "learn-9c26e120-0646-47e4-aeec-9adb5640573b"
# }

# output "resource_group_idser" {
#   value = data.azurerm_app_service_plan.serviceplan.id
# }

resource "azurerm_app_service" "appservice" {
  name                = "walxarappservicetest2"
  location            = "centralus"
  resource_group_name = data.azurerm_resource_group.azure_apps_rg.name
  app_service_plan_id = azurerm_app_service_plan.serviceplan.id


  site_config {
    //dotnet_framework_version = "v4.0"
    linux_fx_version         = "NODE|10.14"
    //scm_type                 = "LocalGit"
  }

#   app_settings = {
#     "SOME_KEY" = "some-value"
#   }

#   connection_string {
#     name  = "Database"
#     type  = "SQLServer"
#     value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
#   }
}