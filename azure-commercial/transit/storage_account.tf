resource "azurerm_storage_account" "activitylogs"{
  name                     = "co${lower(var.environment)}eus${var.applicationname}activlogsa${var.uniqueresourcesuffix1}"
  resource_group_name      = "${azurerm_resource_group.transitloganalytics.name}"
  location                 = "${azurerm_resource_group.transitloganalytics.location}"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  enable_blob_encryption   = "true"
  enable_https_traffic_only = 1
  enable_advanced_threat_protection = "true"

  tags = "${var.tags}"
}

resource "azurerm_storage_account" "diagnosticslogs"{
  name                     = "co${lower(var.environment)}eus${var.applicationname}diaglogsa${var.uniqueresourcesuffix1}"
  resource_group_name      = "${azurerm_resource_group.transitloganalytics.name}"
  location                 = "${azurerm_resource_group.transitloganalytics.location}"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  enable_blob_encryption   = "true"
  enable_https_traffic_only = 1
  enable_advanced_threat_protection = "true"

  tags = "${var.tags}"
}


resource "azurerm_storage_account" "diagnosticslogseus2"{
  name                     = "co${lower(var.environment)}eu2${var.applicationname}diaglogsa${var.uniqueresourcesuffix2}"
  resource_group_name      = "${azurerm_resource_group.transitloganalytics.name}"
  location                 = "eastus2"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  enable_blob_encryption   = "true"
  enable_https_traffic_only = 1
  enable_advanced_threat_protection = "true"

  tags = "${var.tags}"
}


resource "azurerm_storage_account" "vmdiagnosticslogs"{
  name                     = "co${lower(var.environment)}eus${var.applicationname}vmlogsa${var.uniqueresourcesuffix1}"
  resource_group_name      = "${azurerm_resource_group.transitloganalytics.name}"
  location                 = "${azurerm_resource_group.transitloganalytics.location}"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  enable_blob_encryption   = "true"
  enable_https_traffic_only = 1
  enable_advanced_threat_protection = "true"

  network_rules {
    ip_rules = ["54.173.33.56","199.207.253.0/24"]
    virtual_network_subnet_ids = ["${azurerm_subnet.mgmttransit.id}","${azurerm_subnet.trusttransit.id}","${azurerm_subnet.appgwtransit.id}","${azurerm_subnet.untrusttransit.id}"]
    default_action = "Deny"
  }
  

 tags = "${var.tags}"
}


resource "azurerm_storage_account" "recovery"{
  name                     = "co${lower(var.environment)}eus${var.applicationname}recoversa${var.uniqueresourcesuffix1}"
  resource_group_name      = "${azurerm_resource_group.transitbackuprecovery.name}"
  location                 = "${azurerm_resource_group.transitbackuprecovery.location}"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  enable_blob_encryption   = "true"
  enable_https_traffic_only = 1
  enable_advanced_threat_protection = "true"

 tags = "${var.tags}"
}



resource "azurerm_storage_account" "image"{
  name                     = "co${lower(var.environment)}eus${var.applicationname}imagesa${var.uniqueresourcesuffix1}"
  resource_group_name      = "${azurerm_resource_group.transitvmimage.name}"
  location                 = "${azurerm_resource_group.transitvmimage.location}"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  enable_blob_encryption   = "true"
  enable_https_traffic_only = 1
  enable_advanced_threat_protection = "true"

  tags = "${var.tags}"
}

# resource "azurerm_storage_account" "testsanew1"{
#   name                     = "testsanew1"
#   resource_group_name      = "${azurerm_resource_group.transitvnet.name}"
#   location                 = "${azurerm_resource_group.transitvnet.location}"
#   account_tier             = "Standard"
#   account_kind			   = "StorageV2"
#   account_replication_type = "RAGRS"
#   enable_blob_encryption   = "true"
#   enable_https_traffic_only = 1
#   enable_advanced_threat_protection = "true"

# }

resource "azurerm_storage_account" "copeustransitkdr01sa"{
  name                     = "co${lower(var.environment)}eus${var.applicationname}kdrsa${var.uniqueresourcesuffix1}"
  resource_group_name      = "${azurerm_resource_group.transitkdr.name}"
  location                 = "${azurerm_resource_group.transitkdr.location}"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  enable_blob_encryption   = "true"
  enable_https_traffic_only = 1
  enable_advanced_threat_protection = "true"

  tags = "${var.tags}"

}

resource "azurerm_storage_account" "copeustransittestlog02sa"{
  name                     = "co${lower(var.environment)}eus${var.applicationname}testlogsa${var.uniqueresourcesuffix1}"
  resource_group_name      = "${azurerm_resource_group.transitloganalytics.name}"
  location                 = "${azurerm_resource_group.transitloganalytics.location}"
  account_tier             = "Standard"
  account_kind			   = "StorageV2"
  account_replication_type = "RAGRS"
  enable_blob_encryption   = "true"
  enable_https_traffic_only = 1
  enable_advanced_threat_protection = "true"

  tags = "${var.tags}"

}

resource "azurerm_storage_account" "copeu2transitdiaglog01sa"{
  name                     = "co${lower(var.environment)}eu2${var.applicationname}diaglogsa${var.uniqueresourcesuffix1}"
  resource_group_name      = "${azurerm_resource_group.transitloganalytics.name}"
  location                 = "eastus2"
  account_tier             = "Standard"
  account_kind			   = "StorageV2"
  account_replication_type = "RAGRS"
  enable_blob_encryption   = "true"
  enable_https_traffic_only = 1
  enable_advanced_threat_protection = "true"

  tags = "${var.tags}"

}
resource "azurerm_storage_account" "copeustransitdiaglog01sa"{
  name                     = "co${lower(var.environment)}eus${var.applicationname}diaglogsa${var.uniqueresourcesuffix2}"
  resource_group_name      = "${azurerm_resource_group.transitloganalytics.name}"
  location                 = "eastus"
  account_tier             = "Standard"
  account_kind			   = "StorageV2"
  account_replication_type = "RAGRS"
  enable_blob_encryption   = "true"
  enable_https_traffic_only = 1
  enable_advanced_threat_protection = "true"

  tags = "${var.tags}"

}


resource "azurerm_storage_account" "copeustransitvmlog01sa"{
  name                     = "co${lower(var.environment)}eus${var.applicationname}vmlogsa${var.uniqueresourcesuffix2}"
  resource_group_name      = "${azurerm_resource_group.transitloganalytics.name}"
  location                 = "eastus"
  account_tier             = "Standard"
  account_kind			   = "StorageV2"
  account_replication_type = "RAGRS"
  enable_blob_encryption   = "true"
  enable_https_traffic_only = 1
  enable_advanced_threat_protection = "true"

  tags = "${var.tags}"

}

resource "azurerm_storage_account" "temprg1storage"{
  name                     = "temprg1storage${var.uniqueresourcesuffix1}"
  resource_group_name      = "${azurerm_resource_group.temprg1.name}"
  location                 = "${azurerm_resource_group.temprg1.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_blob_encryption   = "true"
  enable_https_traffic_only = 0
  enable_advanced_threat_protection = "true"

  tags = "${var.tags}"

}

resource "azurerm_storage_account" "tempstorageeast2"{
  name                     = "tempstorageeast2${var.uniqueresourcesuffix1}"
  resource_group_name      = "${azurerm_resource_group.temprg1.name}"
  location                 = "eastus"
  account_tier             = "Standard"
  account_kind			   = "StorageV2"
  account_replication_type = "RAGRS"
  enable_blob_encryption   = "true"
  enable_https_traffic_only = 1
  enable_advanced_threat_protection = "true"

  tags = "${var.tags}"

}