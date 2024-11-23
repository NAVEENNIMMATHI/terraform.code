provider "azurerm" {
  features {
  }
  version     = "= 2.44.0"
  environment = "usgovernment"
}

provider "azuread" {
  version     = "= 0.8.0"
  environment = "usgovernment"
}
