terraform {
  required_version = ">=1.3.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }

  cloud {

    organization = "Giuks_Labs"
    workspaces {
      name = "Lab7"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
  subscription_id = "9734ed68-621d-47ed-babd-269110dbacb1"
}

resource "azurerm_resource_group" "rg" {
  location = "eastus"
  name     = "813-92b5e616-hands-on-with-terraform-on-azure"
}

module "lab7" {
  source  = "app.terraform.io/Giuks_Labs/lab7/azurerm"
  version = "1.0.0"
  # insert required variables here
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  #   account_replication_type = "GRS"
  #   name = labstr2024090802
}