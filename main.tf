# Please make sure to update your organization and workspace information
terraform {
  backend "remote" {
    organization = "zambrana"

    workspaces {
      name = "BasicAzGovEnv"
    }
  }
  required_version = ">= 0.14.0"
  required_providers {
    azurerm = "= 2.38.0"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "genericRG" {
  name     = "${var.suffix}${var.rgName}"
  location = var.location
  tags     = var.tags
}
