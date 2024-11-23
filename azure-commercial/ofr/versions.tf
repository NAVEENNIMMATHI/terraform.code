terraform {
  required_version = ">= 0.14"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "= 0.11.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.64.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "= 2.1.1"
    }
    template = {
      source  = "hashicorp/template"
      version = "= 2.1.1"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {
  }
}

provider "azuread" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "null" {
}

provider "template" {
}
