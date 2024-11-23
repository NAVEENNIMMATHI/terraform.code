
resource "azurerm_firewall" "firewalldr" {

  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "firewall-primary-${var.firewall_environment_dr}" : "fwl-${var.location_dr_acronym}-primary-${var.firewall_environment_dr}"
  location            = azurerm_resource_group.drhubvnetrg.location
  resource_group_name = azurerm_resource_group.drhubvnetrg.name
  firewall_policy_id  = var.firewall_policy_id_dr
  sku_name            = "AZFW_VNet"
  sku_tier            = "Premium"

  ip_configuration {
    name                 = var.ip_confi_dr_name1
    subnet_id            = azurerm_subnet.azure-firewall-subnet-dr.id
    public_ip_address_id = azurerm_public_ip.fw_pip_dr_1.id

  }
  ip_configuration {
    name                 = var.ip_confi_dr_name2
    public_ip_address_id = azurerm_public_ip.fw_pip_dr_2.id
  }
  ip_configuration {
    name                 = var.ip_confi_dr_name3
    public_ip_address_id = azurerm_public_ip.fw_pip_dr_3.id
  }


  #dns_servers = var.hub_vnet_dns_servers

  tags = var.tags_dr_Networking
  # zones = var.environment_acronym == "dv" || var.environment_acronym == "qa" ? var.firewall_avail_zones : null

  depends_on = [
    azurerm_firewall_policy.firewall_policy_dr,
    azurerm_subnet.azure-firewall-subnet-dr,
    azurerm_public_ip.fw_pip_dr_1,
    azurerm_public_ip.fw_pip_dr_2,
    azurerm_public_ip.fw_pip_dr_3
  ]
}

resource "azurerm_firewall_policy" "firewall_policy_dr" {

    name                = var.firewall_policy_dr_name
    resource_group_name = var.firewall_policy_dr_resource_group_name
    location            = var.firewall_policy_dr_location
    sku                 = "Premium"
    tags                = var.tags_firewall_policy_dr
    dns {
        proxy_enabled   = "true"
        servers         = var.dns_servers_dr
        }
    threat_intelligence_mode  = "Alert"
}