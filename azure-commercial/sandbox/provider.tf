terraform {
  required_version = "= 0.11.14"
}

# The default provider configuration
provider "azurerm" {
  version = "= 1.44.0"
  subscription_id = "${var.default_subscription_id}"
}

# Additional provider configuration for WVD admin subscription
provider "azurerm" {
  alias  = "wvd"
  subscription_id = "37d718b4-71be-4555-bbcc-d275927e8b67"
}

provider "null" {
  version = "= 2.1.1"
}

provider "template" {
  version = "= 2.1.1"
}