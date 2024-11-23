locals {
  common_prefix_sto                 = "sto${var.location_acronym}${var.application_acronym}"
  storage_account_virtual_network_subnet_ids = [azurerm_subnet.spiappgw_subnet.id, azurerm_subnet.spiase1_subnet.id, azurerm_subnet.spiinfra1_subnet.id, azurerm_subnet.spiweb1_subnet.id, azurerm_subnet.spiapp1_subnet.id, azurerm_subnet.spidb1_subnet.id, azurerm_subnet.bstn_subnet.id, azurerm_subnet.GatewaySubnet.id]
  storage_account_virtual_network_subnet_ids_dev = concat(local.storage_account_virtual_network_subnet_ids,[
    "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np",
    "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet/subnets/co-np-eastus-infra1-subnet",
    "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/co-dv-eastus-infra1-subnet",
    "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"
  ])
}
resource "azurerm_storage_account" "copeuscospivmlog01sa" {
  name                              = var.environment=="production" ? "copeuscospivmlog01sa" : "${local.common_prefix_sto}02sa${var.environment_acronym}"
  resource_group_name               = azurerm_resource_group.cospiloganalytics.name
  location                          = azurerm_resource_group.cospiloganalytics.location
  account_kind                      = "StorageV2"
  account_tier                      = "Standard"
  account_replication_type          = "RAGRS"
  enable_https_traffic_only         = true

  network_rules {
    default_action                  = "Deny"
    virtual_network_subnet_ids      = local.storage_account_virtual_network_subnet_ids
  }

  tags = var.tags
}

module "copeastuscospivnetrg140" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastuscospivnetrg140" : "${local.common_prefix_sto}140${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  account_kind                      = "StorageV2"
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = false
  network_rule_default_action       = "Allow"
  virtual_network_subnet_ids        = []

  tags                              = var.tags
}

module "copeastuscospivnetrg209" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastuscospivnetrg209" : "${local.common_prefix_sto}209${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  virtual_network_subnet_ids        = []
  account_kind                      = "StorageV2"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = false
  network_rule_default_action       = "Allow"

  tags                              = var.tags
}

module "copeastuscospivnetrg271" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastuscospivnetrg271" : "${local.common_prefix_sto}271${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  virtual_network_subnet_ids        = []
  account_kind                      = "StorageV2"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = false
  network_rule_default_action       = "Allow"

  tags                              = var.tags
}

module "copeastuscospivnetrg293" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastuscospivnetrg293" : "${local.common_prefix_sto}293${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  virtual_network_subnet_ids        = []
  account_kind                      = "StorageV2"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = false
  network_rule_default_action       = "Allow"

  tags                              = var.tags
}

module "copeastuscospivnetrg363" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastuscospivnetrg363" : "${local.common_prefix_sto}363${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  virtual_network_subnet_ids        = []
  account_kind                      = "StorageV2"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = false
  network_rule_default_action       = "Allow"

  tags                              = var.tags
}

module "copeastuscospivnetrg401" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastuscospivnetrg401" : "${local.common_prefix_sto}401${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  virtual_network_subnet_ids        = []
  account_kind                      = "StorageV2"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = false
  network_rule_default_action       = "Allow"

  tags                              = var.tags
}

module "copeastuscospivnetrg427" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastuscospivnetrg427" : "${local.common_prefix_sto}472${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  virtual_network_subnet_ids        = []
  account_kind                      = "StorageV2"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = false
  network_rule_default_action       = "Allow"

  tags                              = var.tags
}

module "copeastuscospivnetrg466" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastuscospivnetrg466" : "${local.common_prefix_sto}466${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  virtual_network_subnet_ids        = []
  account_kind                      = "StorageV2"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = false
  network_rule_default_action       = "Allow"

  tags                              = var.tags
}

module "copeastuscospivnetrg577" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastuscospivnetrg577" : "${local.common_prefix_sto}577${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  virtual_network_subnet_ids        = []
  account_kind                      = "StorageV2"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = false
  network_rule_default_action       = "Allow"

  tags                              = var.tags
}

module "copeastuscospivnetrg665" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastuscospivnetrg665" : "${local.common_prefix_sto}665${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  virtual_network_subnet_ids        = []
  account_kind                      = "StorageV2"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = false
  network_rule_default_action       = "Allow"

  tags                              = var.tags
}

module "copeastuscospivnetrg685" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastuscospivnetrg685" : "${local.common_prefix_sto}685${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  virtual_network_subnet_ids        = []
  account_kind                      = "StorageV2"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = false
  network_rule_default_action       = "Allow"

  tags                              = var.tags
}

module "copeastuscospivnetrg706" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastuscospivnetrg706" : "${local.common_prefix_sto}706${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  virtual_network_subnet_ids        = []
  account_kind                      = "StorageV2"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = false
  network_rule_default_action       = "Allow"

  tags                              = var.tags
}

module "copeastuscospivnetrg750" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastuscospivnetrg750" : "${local.common_prefix_sto}750${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  virtual_network_subnet_ids        = []
  account_kind                      = "StorageV2"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = false
  network_rule_default_action       = "Allow"

  tags                              = var.tags
}

module "copeastuscospivnetrg900" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastuscospivnetrg900" : "${local.common_prefix_sto}900${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  virtual_network_subnet_ids        = []
  account_kind                      = "StorageV2"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = false
  network_rule_default_action       = "Allow"

  tags                              = var.tags
}

module "eastuscospivnetrgdiag" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "eastuscospivnetrgdiag" : "${local.common_prefix_sto}diag${var.environment_acronym}"
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  account_kind                      = "StorageV2"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = true
  network_rule_default_action       = "Allow"
  virtual_network_subnet_ids        = local.storage_account_virtual_network_subnet_ids

  tags                              = var.tags
}

module "spifishfileshare" {
  source                            = "../../modules/storage_account"
  storage_account_name              = lower("${local.common_prefix_sto}pe${var.environment_acronym}")
  resource_group_location           = azurerm_resource_group.cospivnetrg.location
  resource_group_name               = azurerm_resource_group.cospivnetrg.name
  virtual_network_subnet_ids        = var.environment=="development" ? local.storage_account_virtual_network_subnet_ids_dev : local.storage_account_virtual_network_subnet_ids
  account_kind                      = "FileStorage"
  account_tier                      = "Premium"
  account_replication_type          = "ZRS"
  enable_advanced_threat_protection = true
  enable_https_traffic_only         = true
  network_rule_default_action       = "Allow"
  azure_files_authentication_directory_type = "AADDS"
 

  tags                              = var.tags
}

#Consulting storage_account

module "consspistorageaccount" {
  source                                    = "../../modules/storage_account"
  storage_account_name                      = lower("${local.common_prefix_sto}conspe${var.environment_acronym}")
  resource_group_location                   = azurerm_resource_group.cospivnetrg.location
  resource_group_name                       = azurerm_resource_group.cospivnetrg.name
  account_tier                              = "Standard"
  account_kind                              = "StorageV2"
  account_replication_type                  = "GRS"
  enable_advanced_threat_protection         = true
  enable_https_traffic_only                 = true
  virtual_network_subnet_ids                = var.environment=="development" ? local.storage_account_virtual_network_subnet_ids_dev : local.storage_account_virtual_network_subnet_ids
  azure_files_authentication_directory_type = "AADDS"
  kpmg_nat_ip_list                          = []
  tags                                      = var.tags_cons
}
