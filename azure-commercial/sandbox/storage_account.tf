module "vmdiagnosticslogssa"
{
  source = "../../modules/storage_account"
  storage_account_name = "${local.storage-account-vm-diagnostics-name}"
  resource_group_name     = "${module.applicationrg.resource_group_name}" 
  resource_group_location = "${module.applicationrg.resource_group_location}"
  virtual_network_subnet_ids = ["${data.azurerm_subnet.wvd.id}"]
  tags = "${var.tags}"
}