############################
# East US Storage Accounts #
############################

resource "azurerm_storage_account" "activitylogs" {
  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${var.activity_logs_storage_account_name}${var.unique_variable_suffix}" : "sto${var.location_acronym}coreactlog1${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.loganalytics.name
  location                  = azurerm_resource_group.loganalytics.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"]
    virtual_network_subnet_ids = (var.environment_acronym == "pd") ? [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id
    ] : [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id
    ]
  }

  tags = var.tags
}

resource "azurerm_storage_account" "diagnosticslogs" {
  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${var.diagnostics_logs_storage_account_name}${var.unique_variable_suffix}" : "sto${var.location_acronym}corediaglog1${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.loganalytics.name
  location                  = azurerm_resource_group.loganalytics.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false
  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"] 
    virtual_network_subnet_ids = (var.environment_acronym == "pd") ? [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id
    ] : [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id
    ]
  }

  tags = var.tags
}

resource "azurerm_storage_account" "vmdiagnosticslogs" {
  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${var.vm_diagnostics_logs_storage_account_name}${var.unique_variable_suffix}" : "sto${var.location_acronym}corevmlog1${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.loganalytics.name
  location                  = azurerm_resource_group.loganalytics.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28", "203.199.72.210"]
    virtual_network_subnet_ids =  [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ] 
  }

  tags = var.tags
}

resource "azurerm_storage_account" "recovery" {
  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${var.recovery_storage_account_name}${var.unique_variable_suffix}" : "sto${var.location_acronym}corerecover1${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.backuprecovery.name
  location                  = azurerm_resource_group.backuprecovery.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"] 
    virtual_network_subnet_ids =  [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ] 
  }

  tags = var.tags
}

resource "azurerm_storage_account" "image" {
  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${var.image_storage_account_name}${var.unique_variable_suffix}" : "sto${var.location_acronym}coreimage1${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.vmimage.name
  location                  = azurerm_resource_group.vmimage.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"]
    virtual_network_subnet_ids = [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ]
  }

  tags = var.tags
}

resource "azurerm_storage_account" "sqlauditlogs" {
  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${var.sql_audit_logs_storage_account_name}${var.unique_variable_suffix}" : "sto${var.location_acronym}coresqlaudlog1${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.loganalytics.name
  location                  = azurerm_resource_group.loganalytics.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"]
    virtual_network_subnet_ids = [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ]
  }

  tags = var.tags
}

// resource "azurerm_storage_account" "jayantaazstorage" {
//   count = var.environment == "production" ? 1 : 0

//   name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "jayantacloudshellstorage" : "stousecorejayanta${var.environment_acronym}"
//   resource_group_name       = azurerm_resource_group.jayantabanerjee_rg.name
//   location                  = "East US"
//   access_tier               = "Hot"
//   account_kind              = "StorageV2"
//   account_tier              = "Standard"
//   account_replication_type  = "LRS"
//   enable_https_traffic_only = true
//   is_hns_enabled            = "false"
//   min_tls_version           = "TLS1_2"
//   allow_blob_public_access  = false

//   network_rules {
//     default_action = "Deny"
//     ip_rules       =  ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"] 
//     virtual_network_subnet_ids = [
//       azurerm_subnet.dmappgateway.id,
//       azurerm_subnet.corease.id,
//       azurerm_subnet.dmpe.id,
//       azurerm_subnet.dmdfir.id,
//       azurerm_subnet.dmworkers.id,
//       azurerm_subnet.bastion1.id,
//       azurerm_subnet.rdgw.id,
//       azurerm_subnet.rdcbl.id,
//       azurerm_subnet.infra1.id,
//       azurerm_subnet.hybridworker.id,
//       azurerm_subnet.cyberarkpv.id,
//       azurerm_subnet.bastion2.id,
//       azurerm_subnet.cyberarkpsm.id,
//       azurerm_subnet.cyberarkcpm.id,
//       azurerm_subnet.cyberarkhtmlgw.id,
//       azurerm_subnet.app1.id,
//       azurerm_subnet.db1.id,
//       azurerm_subnet.secmgmt.id,
//       azurerm_subnet.ase1.id,
//       azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
//       azurerm_subnet.azure-firewall-subnet.id,
//       azurerm_subnet.squidvmsubnet.id,
//       var.aks_agw_subnet_id,
//       azurerm_subnet.wucyberarkcore.id,
//       var.aks_subnet_id
//     ] 
//   }

//   queue_properties {
//     hour_metrics {
//       enabled               = "true"
//       include_apis          = "true"
//       retention_policy_days = 7
//       version               = "1.0"
//     }

//     logging {
//       delete                = "true"
//       read                  = "true"
//       retention_policy_days = 7
//       version               = "1.0"
//       write                 = "true"
//     }

//     minute_metrics {
//       enabled      = "false"
//       include_apis = "false"
//       version      = "1.0"
//     }
//   }

//   tags = var.tags
// }

resource "azurerm_storage_account" "copeuscoreartifacts01sa" {
  count = var.environment_acronym == "qa" ? 0 : 1

  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "copeuscoreartifacts01sa${var.unique_variable_suffix}" : "stousecoreartifacts01${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.CO-P-eastus-artifacts-rg.name
  location                  = "East US"
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"]
    virtual_network_subnet_ids = [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ]
  }

  tags = var.tags
}

resource "azurerm_storage_account" "copeuscorekdr01sa" {
  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "copeuscorekdr01sa${var.unique_variable_suffix}" : "stousecorekdr01${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.CO-P-eastus-kdr-rg.name
  location                  = "East US"
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"]
    virtual_network_subnet_ids = [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ]
  }

  tags = var.tags
}

resource "azurerm_storage_account" "copeusopsgen01sa" {
  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "copeusopsgen01sa${var.unique_variable_suffix}" : "stouseopsgen01${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.opscore.name
  location                  = "East US"
  access_tier               = "Hot"
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"]
    virtual_network_subnet_ids = [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ]
  }

  tags = var.tags
}

resource "azurerm_storage_account" "cs24c9dc04801dcx4854x906" {
  count = var.environment_acronym == "qa" ? 0 : 1

  name                      = var.environment == "production" ? "cs24c9dc04801dcx4854x906" : var.environment_acronym == "dv" ? "cs24c9dc04801dcx4854x${var.unique_variable_suffix}" : "stousecorecs24${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.cloud-shell-storage-eastus.name
  location                  = "East US"
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"]
    virtual_network_subnet_ids = [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ]
  }

  tags = var.tags
}

resource "azurerm_storage_account" "eastushubvnetrgdiag" {
  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "eastushubvnetrgdiag${var.unique_variable_suffix}" : "stousecorevnetdiag${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.hubvnet.name
  location                  = "East US"
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = false #tfsec:ignore:AZU010 tfsec:ignore:AZU014
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"]
    virtual_network_subnet_ids = [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ]
  }

  tags = var.tags
}

resource "azurerm_storage_account" "azureshellstoragekpmg" {
  count = var.environment_acronym == "qa" ? 0 : 1

  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "azureshellstoragekpmg${var.unique_variable_suffix}" : "stousecoreazshell${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.cloud-shell-storage-eastus.name
  location                  = "East US"
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"]
    virtual_network_subnet_ids = [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ]
  }

  tags = var.tags
}

resource "azurerm_storage_account" "stousecorebinary" {
  name                      = "sto${var.location_acronym}corebinary${var.legacy_env_acronym}"
  resource_group_name       = azurerm_resource_group.loganalytics.name
  location                  = "East US"
  access_tier               = "Hot"
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = true


  tags = var.tags_NodeMgmt
}

############################
# West US Storage Accounts #
############################

resource "azurerm_storage_account" "wuimage" {
  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${var.wu_image_storage_account_name}${var.unique_variable_suffix}" : "sto${var.location_dr_acronym}coreimage1${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.wuvmimage.name
  location                  = azurerm_resource_group.wuvmimage.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"]
    virtual_network_subnet_ids = [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ]
  }

  tags = var.tags
}

resource "azurerm_storage_account" "wudiagnosticslogs" {
  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${var.wu_diagnostics_logs_storage_account_name}${var.unique_variable_suffix}" : "sto${var.location_dr_acronym}corediaglog1${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.wuloganalytics.name
  location                  = azurerm_resource_group.wuloganalytics.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false 

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"]
    virtual_network_subnet_ids = [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ]
  }

  tags = var.tags
}

resource "azurerm_storage_account" "wuvmdiagnosticslogs" {
  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${var.wu_vm_diagnostics_logs_storage_account_name}${var.unique_variable_suffix}" : "sto${var.location_dr_acronym}corevmlog1${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.wuloganalytics.name
  location                  = azurerm_resource_group.wuloganalytics.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"] 
    virtual_network_subnet_ids = [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ]
  }

  tags = var.tags
}

resource "azurerm_storage_account" "hub_kv_diaglogs" {
  name                      = "hubkvdiaglogs${var.legacy_env_acronym}"
  resource_group_name       = azurerm_resource_group.backuprecovery.name
  location                  = azurerm_resource_group.backuprecovery.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28",  "203.199.72.210"]
    virtual_network_subnet_ids =  [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ] 
  }

  tags = var.tags
}

resource "azurerm_storage_account" "opskeys01hubdiaglogs" {
  name                      = "opskeys01hubdiaglogs${var.legacy_env_acronym}"
  resource_group_name       = azurerm_resource_group.opscore.name
  location                  = azurerm_resource_group.opscore.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28",  "203.199.72.210"]
    virtual_network_subnet_ids = [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ] 
  }

  tags = var.tags
}

resource "azurerm_storage_account" "dsg-pip-scraper-kv" {
  name                      = "dsgpipscraperkv${var.legacy_env_acronym}"
  resource_group_name       = azurerm_resource_group.co-p-eastus-DSG-PIP-scraper-rg.name
  location                  = azurerm_resource_group.co-p-eastus-DSG-PIP-scraper-rg.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Deny"
    ip_rules       = ["199.207.253.0/24","199.206.0.5","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28",  "203.199.72.210"]
    virtual_network_subnet_ids = [
      azurerm_subnet.dmappgateway.id,
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmdfir.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.bastion1.id,
      azurerm_subnet.rdgw.id,
      azurerm_subnet.rdcbl.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.cyberarkpv.id,
      azurerm_subnet.bastion2.id,
      azurerm_subnet.cyberarkpsm.id,
      azurerm_subnet.cyberarkcpm.id,
      azurerm_subnet.cyberarkhtmlgw.id,
      azurerm_subnet.app1.id,
      azurerm_subnet.db1.id,
      azurerm_subnet.secmgmt.id,
      azurerm_subnet.ase1.id,
      azurerm_subnet.co-p-eastus-rdssspr-subnet.id,
      azurerm_subnet.azure-firewall-subnet.id,
      azurerm_subnet.squidvmsubnet.id,
      var.aks_agw_subnet_id,
      azurerm_subnet.wucyberarkcore.id,
      var.aks_subnet_id
    ] 
  }

  tags = var.tags
}

/*
resource "azurerm_storage_account" "artifactory-stg" {}
resource "azurerm_private_endpoint" "artifactory-pe" {}
resource "azurerm_storage_account" "cloudockit-stg" {}
resource "azurerm_private_endpoint" "cloudockit-pe" {}
*/
## Moved to Core-AKS folder ##