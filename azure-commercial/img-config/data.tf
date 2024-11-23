data "azurerm_resource_group" "rg-core-shared" {
  name = "${var.resource_group_name}"
}