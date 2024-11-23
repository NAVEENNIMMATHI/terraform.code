# Sample Workload VM
module "dr_sample-workoload_vms" {
  source                  = "../../modules/windowsvm_sample_workloads"
  count_value             = var.dr_sample_workload_vms["count_value"]
  application_acronym     = var.application_acronym
  project_name            = var.project_name
  vm_region               = var.location_dr_acronym
  vm_environment          = var.environment_acronym
  availability_set_id     = var.dr_sample_workload_vms["availability_set_id"]
  resource_group_name     = var.dr_sample_workload_vms["resource_group_name"]
  resource_group_location = var.dr_sample_workload_vms["resource_group_location"]
  subnet_id               = var.dr_sample_workload_vms["subnet_id"]
  storage_uri             = var.dr_sample_workload_vms["storage_uri"]
  vm_size                 = var.dr_sample_workload_vms["vm_size"]
  tags                    = var.tags
  depends_on              = [azurerm_virtual_network.dr_workload, azurerm_virtual_network.dr, azurerm_subnet.dr-core1-subnet, azurerm_subnet.workload-subnet]

}
