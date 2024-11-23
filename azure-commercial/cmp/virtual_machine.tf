
module "buildvm_cmp_client" {
  for_each                   = var.cmp_clients

  source                     = "../../modules/windowsvm"
  vm_region                  = upper(var.location_acronym)  #USE
  project_name               = "CMP"
  application_acronym        = ""
  os_type_letter             = "w"
  vm_workload_desc           = upper("${each.value.vm_acronym}")
  vm_environment             = upper(var.environment_acronym)

  resource_group_name         = module.cmp_rg_client[each.key].resource_group_name
  resource_group_location     = var.location

  tags                       = var.tags
  subnet_id                  = module.cmp_subnet_client_vm[each.key].subnet_id

  count_value                = var.vm_count_cmp_client  /* if this value is zero VM will not create */
  data_disk_count            = 0
  vm_size                    = var.vm_size_build

  availability_set_id        = module.aset_clientvm[each.key].availability_set_id
  azurerm_image_id           = ""
  storage_uri                = ""
  data_disk_size             = [0]  /*if you keep this array blank no extra disk will get created */
  data_disk_storage_account_type = "Premium_LRS"
  template_file              = ""
  template_file_xml          = ""

  loganalytics_workspace_id  = ""
  loganalytics_workspace_key = ""

  sku                        = var.clientvm_sku
  storage_account_name       = ""
  storage_account_key        = ""
  client_id                  = ""
  diskencryption_keyvault    = ""
  backup_resource_group_name = ""
  recovery_vault_name        = ""
  backup_policy_id           = ""
  custom_emails              = "go-fmmanagedservices@kpmg.com"
 
  admin_password             = var.vm_admin_password
  

#Add a OS disk block for different managed_disk_type other than Standard_LRS
  os_disk_override           = {
    storage_account_type = "Premium_LRS"
    os_disk_size        = "127"
  }

  user_assigned_identity       = {
    type = "SystemAssigned"
    identity_ids = []
  }
}