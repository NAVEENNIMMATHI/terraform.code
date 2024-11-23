## Storage Accounts Related to Data Lake

locals {
  common_prefix_dls                 = "dls${var.location_acronym}${var.application_acronym}"
}
module "rawandcuratedsa" {
  source                                    = "../../modules/storage_account"
  storage_account_name                      = var.environment=="production" ? "copdeuskiprawcurtd01sa" : "${local.common_prefix_dls}rawcurtd01sa${var.environment_acronym}"
  resource_group_name                       = module.applicationrg.resource_group_name
  resource_group_location                   = module.applicationrg.resource_group_location
  account_tier                              = var.account_tier
  account_replication_type                  = var.replication_type
  enable_advanced_threat_protection         = "true"
  is_hns_enabled                            = var.is_hns_enabled
  virtual_network_subnet_ids                = [var.kme_appsubnet, var.kme_mgmtsubnet, var.spi_appsubnet, module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id, module.ase1subnet.subnet_id, var.spidb1subnetid, module.adxsubnet.subnet_id, var.spidatabrickssubnetid,azurerm_subnet.databricks_private_subnet.id, module.adf1subnet.subnet_id,module.privatelinksubnet.subnet_id,var.coreinfrasubnetid,var.core_aks_subnet_id,var.squid_proxy_vm_subnet_id,var.rstudio_subnet_id]
  kpmg_nat_ip_list                          = var.environment=="production" ? [var.ip_rules, var.ip_rules_raw, "52.224.25.180","52.224.25.158","52.224.25.140","20.42.39.126","52.224.25.167"] : ["199.207.253.101/30","199.206.0.5/30","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28"]
  azure_files_authentication_directory_type = "AADDS"
  tags                                      = var.tags
  
  private_link_accesses                     = var.private_link_accesses
  
}

module "datavaultsa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copdeuskipdatavult01sa" : "${local.common_prefix_dls}datavult01sa${var.environment_acronym}"
  resource_group_name               = module.applicationrg.resource_group_name
  resource_group_location           = module.applicationrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  is_hns_enabled                    = var.is_hns_enabled
  virtual_network_subnet_ids        = [var.kme_appsubnet, var.kme_mgmtsubnet, var.kme_buildsubnet, var.spi_appsubnet, module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id, module.ase1subnet.subnet_id, module.adxsubnet.subnet_id,azurerm_subnet.databricks_private_subnet.id, module.adf1subnet.subnet_id,var.squid_proxy_vm_subnet_id]
  kpmg_nat_ip_list                  = var.environment=="production" ? [var.ip_rules_datavault] : ["199.207.253.101/30","199.206.0.5/30","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28"]
  tags                              = var.tags
}

resource "azurerm_private_endpoint" "datavaultsa" {
  name                = lower("datavault-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = module.privatelinksubnet.subnet_id
  private_service_connection {
    name                           = lower("datavault-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
    private_connection_resource_id = module.datavaultsa.id
    subresource_names              = ["blob"]#,"file","queue","table","web"]
    is_manual_connection           = false
  }
  tags               = var.tags
}

resource "azurerm_private_endpoint" "rawandcuratedsa" {
  name                = lower("rawandcuratedsa-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = module.privatelinksubnet.subnet_id
  private_service_connection {
    name                           = lower("rawandcuratedsa-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
    private_connection_resource_id = module.rawandcuratedsa.id
    subresource_names              = ["blob"]#,"file","queue","table","web"]
    is_manual_connection           = false
  }
  tags               = var.tags
}


resource "azurerm_private_endpoint" "rawandcuratedsa_file" {
  name                = lower("rawandcuratedsa-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}-file")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = module.privatelinksubnet.subnet_id
  private_service_connection {
    name                           = lower("rawandcuratedsa-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}-file")
    private_connection_resource_id = module.rawandcuratedsa.id
    subresource_names              = ["file"]#,"file","queue","table","web"]
    is_manual_connection           = false
  }
  private_dns_zone_group     {
    name                           = "privatelink.file.core.windows.net"
    private_dns_zone_ids           = [data.azurerm_private_dns_zone.storage_private_link_file.id]     
  }
  tags               = var.tags
}

#ArcGIS PEP for KIP Datalake Storage Account
resource "azurerm_private_endpoint" "arcgis_pep_file" {
  name                = lower("pep-${var.location_acronym}-${var.application_acronym}-arcgisfs-${var.environment_acronym}-file")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = data.azurerm_subnet.arcgis_pep_subnet.id
  private_service_connection {
    name                           = lower("pesc-${var.location_acronym}-${var.application_acronym}-arcgisfs-${var.environment_acronym}-file")
    private_connection_resource_id = module.rawandcuratedsa.id
    subresource_names              = ["file"]#,"file","queue","table","web"]
    is_manual_connection           = false
  }
  tags               = var.tags
}