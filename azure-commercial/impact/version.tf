terraform {
  required_version = ">= 1.0.2"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "= 0.11.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.69.0"   #"= 2.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "= 1.4.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "= 2.1.2"
    }
    template = {
      source  = "hashicorp/template"
      version = "= 2.1.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  storage_use_azuread = true
}

provider "azurerm" {
  alias           = "dns"
  subscription_id = var.private_dns_zone_subscription
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

provider "azurerm" {
  alias           = "hub"
  subscription_id = var.hub_subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {
  }
}

provider "azurerm" {
  alias           = "transit"
  subscription_id = var.transit_subscription_id
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

provider "random" {
}