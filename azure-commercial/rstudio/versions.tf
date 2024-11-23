terraform {
  required_version = ">= 1.0.2"
  required_providers {
      azuread = {
      source = "hashicorp/azuread"
      version = "= 0.11.0"
      }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "= 2.84.0"
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
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "1.0.0"
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

provider "azurerm" {
  alias           = "pvt_dns_subscription"
  subscription_id = var.pvt_dns_subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {
  }
}

# MongoDB Atlas Account - API Keys
provider "mongodbatlas" {
  public_key   = "__MongoDBAtlasPublicKey__"
  private_key  = "__MongoDBAtlasPrivateKey__"
}