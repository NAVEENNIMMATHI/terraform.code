#LatestVersion
terraform {
  required_version = ">= 1.0.2"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "= 2.29.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.25.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "= 2.2.3"
    }
    null = {
      source  = "hashicorp/null"
      version = "= 3.1.1"
    }
    template = {
      source  = "hashicorp/template"
      version = "= 2.2.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
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
  #subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "random" {
}

provider "azurerm" {
  alias           = "firewall"
  subscription_id = var.azfwsubscriptionid
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {
  }
}