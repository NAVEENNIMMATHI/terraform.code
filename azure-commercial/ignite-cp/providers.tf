terraform {
  required_version = ">= 1.0.2"
  required_providers {
      azuread = {
      source = "hashicorp/azuread"
      version = "= 0.11.0"
      }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "= 3.14.0"
    }
    local = {
      source = "hashicorp/local"
      version = "= 1.4.0"
    }
    null = {
      source = "hashicorp/null"
      version = "= 2.1.2"
    }
    template = {
      source = "hashicorp/template"
      version = "= 2.1.1"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

provider "azurerm" {
  alias           = "dns"
  subscription_id = var.private_dns_zone_subscription
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

provider "null" {

}

provider "template" {
 
}

provider "azuread" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}