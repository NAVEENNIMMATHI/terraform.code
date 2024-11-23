
resource "azurerm_resource_group" "transitvnet" {
  name     = "CO-${var.environment}-${var.location}-${var.applicationname}vnet-rg"
  location = "${var.location}"


  tags = "${var.tags}"

}

resource "azurerm_resource_group" "transitpalofw" {
  name     = "CO-${var.environment}-${var.location}-${var.applicationname}palofw-rg"
  location = "${var.location}"


  tags = "${var.tags}"

}


resource "azurerm_resource_group" "networkwatcher" {
  name     = "${var.networkwatcherrgname}"
  location = "${var.location}"


  tags = "${var.tags}"

}
resource "azurerm_resource_group" "transitloganalytics" {
  name     = "CO-${var.environment}-${var.location}-${var.applicationname}loganalytics-rg"
  location = "${var.location}"


  tags = "${var.tags}"

}
resource "azurerm_resource_group" "transitbackuprecovery" {
  name     = "CO-${var.environment}-${var.location}-${var.applicationname}backuprecovery-rg"
  location = "${var.location}"


  tags = "${var.tags}"

}

resource "azurerm_resource_group" "transitvmimage" {
  name     = "CO-${var.environment}-${var.location}-${var.applicationname}vmimage-rg"
  location = "${var.location}"


  tags = "${var.tags}"

}
resource "azurerm_resource_group" "transitkdr" {
  name     = "CO-${var.environment}-${var.location}-${var.applicationname}kdr-rg"
  location = "${var.location}"


  tags = "${var.tags}"

}
resource "azurerm_resource_group" "temprg1" {
  name     = "temprg1"
  location = "eastus2"
  
  tags = "${var.tags}"
}

resource "azurerm_resource_group" "AzureBackupRG_eastus_1" {
  name     = "AzureBackupRG_eastus_1"
  location = "eastus"

  tags = "${var.tags}"
}