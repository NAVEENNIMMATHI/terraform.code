terraform {
  required_version = "= 0.12.24"
}

provider "azurerm" {
  version = "= 2.35.0"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

provider "null" {
  version = "= 2.1.1"
}

provider "template" {
  version = "= 2.1.1"
}

provider "azuread" {
  version         = "= 0.11.0"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}