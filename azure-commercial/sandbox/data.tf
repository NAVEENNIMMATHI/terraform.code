data "azurerm_subscription" "current" {
    subscription_id = "70651883-5bd5-4a67-b00b-61db5c35825d"
}

data "azurerm_subnet" "wvd" {
  provider             = "azurerm.wvd"
  name                 = "sub-use-wvd-cope-np"
  virtual_network_name = "vnet-use-wvd-np"
  resource_group_name  = "RGP-USE-WVD-VNET-NP"
}