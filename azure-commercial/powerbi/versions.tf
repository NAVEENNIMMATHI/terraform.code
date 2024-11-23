terraform {
  required_version = ">=1.0"
  required_providers {
      azuread = {
      source = "hashicorp/azuread"
      version = "= 0.11.0"
      }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "= 2.69.0"
    }
  }   	  
} 

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "azuread" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}