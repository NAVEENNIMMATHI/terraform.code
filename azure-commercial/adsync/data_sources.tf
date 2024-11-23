data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}

data "azurerm_subnet" "core_ase" {
    name                 = var.coreasesubnet
    virtual_network_name = var.corevnetname
    resource_group_name  = var.corevnetresourcegroup
}