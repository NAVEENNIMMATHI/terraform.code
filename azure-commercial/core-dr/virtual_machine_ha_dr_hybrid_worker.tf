#
module "dr-sample-workoload_vms" {
  source                  = "../../modules/windowsvm_sample_workloads"
  count_value             = var.ha_dr_hybwrk["count_value"]
  need_zones              = true
  resource_group_name     = azurerm_resource_group.uswcoredr.name
  resource_group_location = var.ha_dr_hybwrk["location_ha_dr"]
  subnet_id               = var.ha_dr_hybwrk["subnet_id_ha_dr"]
  tags                    = var.tags
  vm_size                 = var.ha_dr_hybwrk["vm_size_ha_dr"]
  availability_set_id     = null
  storage_uri             = var.ha_dr_hybwrk["storage_uri_ha_dr"]
  data_disk_count         = "1"
  application_acronym     = var.ha_dr_hybwrk["application_acronym_ha_dr"]
  vm_environment          = var.ha_dr_hybwrk["vm_environment_ha_dr"]
  data_disk_size          = [128]
  project_name            = var.ha_dr_hybwrk["project_name_ha_dr"]
  admin_password          = var.ha_dr_hybwrk["admin_password"]
  depends_on              = [azurerm_virtual_network.dr_workload, azurerm_virtual_network.dr, azurerm_subnet.dr-core1-subnet, azurerm_subnet.workload-subnet]

}