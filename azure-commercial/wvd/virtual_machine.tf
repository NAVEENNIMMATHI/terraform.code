module "ablavmadmin"{
    source                     = "../../modules/virtual_machine"
    application_name           = "ADM"
    application_acronym        = "${var.application_acronym}"
    application_environment    = "${var.environment}"
    resource_group_location    = "${module.applicationrg.resource_group_location}"
    resource_group_name        = "${module.applicationrg.resource_group_name}"
    subnet_id                  = "${module.ablaapp1subnet.subnet_id}"
    count_value                = "${var.count_value_ablaadminvm}"
    vm_size                    = "Standard_D16s_v3"
    availability_set_id        = "${module.ablaapp1as.availability_set_id}"
    azurerm_image_id           = "${data.azurerm_image.eu-cis-hardened-win2016-20190111-image.id}"
    storage_uri                = "${module.ablasa.primary_blob_endpoint}"
    data_disk_size             = "200"
    template_file              = "${data.template_file.ps1.rendered}"
    template_file_xml          = "${data.template_file.xml.rendered}"
    loganalytics_workspace_id  = "${data.azurerm_log_analytics_workspace.cospi.workspace_id}"
    loganalytics_workspace_key = "${data.azurerm_log_analytics_workspace.cospi.primary_shared_key}"
    storage_account_name       = "${module.ablasa.storage_account_name}"
    storage_account_key        = "${module.ablasa.primary_access_key}"
    client_id                  = "${data.azurerm_azuread_service_principal.encryptappsp.application_id}"
    diskencryption_keyvault    = "${var.abla_keyvault_name}"
    backup_resource_group_name = "${module.backuprecoveryrg.resource_group_name}"
    recovery_vault_name        = "${module.recoveryservice.services_vault_name}"
    backup_policy_id           = "${module.recoveryservice.backup_policy_id}"
    custom_emails              = "${var.custom_emails}"
    domain_name                = "${var.domain_name}"
    ou_path                    = "${var.ou_path}"
    domain_user_name           = "${var.domain_user_name}"
    domain_user_password       = "${var.domain_user_password}"
    admin_password             = "${var.admin_password}"
    encryptappsp_key_password  = "${var.encryptappsp_key_password}"
    tags                       = "${var.tags}"
}

module "ablavmbuild"{
    source                     = "../../modules/virtual_machine"
    application_name           = "BLD"
    application_acronym        = "${var.application_acronym}"
    application_environment    = "${var.environment}"
    resource_group_location    = "${module.applicationrg.resource_group_location}"
    resource_group_name        = "${module.applicationrg.resource_group_name}"
    subnet_id                  = "${module.ablaapp1subnet.subnet_id}"
    count_value                = "${var.count_value_ablabuildvm}"
    vm_size                    = "Standard_D16s_v3"
    availability_set_id        = "${module.ablaapp2as.availability_set_id}"
    azurerm_image_id           = "${data.azurerm_image.eu-cis-hardened-win2016-20190111-image.id}"
    storage_uri                = "${module.ablasa.primary_blob_endpoint}"
    data_disk_size             = "512"
    template_file              = "${data.template_file.ps1.rendered}"
    template_file_xml          = "${data.template_file.xml.rendered}"
    loganalytics_workspace_id  = "${data.azurerm_log_analytics_workspace.cospi.workspace_id}"
    loganalytics_workspace_key = "${data.azurerm_log_analytics_workspace.cospi.primary_shared_key}"
    storage_account_name       = "${module.ablasa.storage_account_name}"
    storage_account_key        = "${module.ablasa.primary_access_key}"
    client_id                  = "${data.azurerm_azuread_service_principal.encryptappsp.application_id}"
    diskencryption_keyvault    = "${var.abla_keyvault_name}"
    backup_resource_group_name = "${module.backuprecoveryrg.resource_group_name}"
    recovery_vault_name        = "${module.recoveryservice.services_vault_name}"
    backup_policy_id           = "${module.recoveryservice.backup_policy_id}"
    custom_emails              = "${var.custom_emails}"
    domain_name                = "${var.domain_name}"
    ou_path                    = "${var.ou_path}"
    domain_user_name           = "${var.domain_user_name}"
    domain_user_password       = "${var.domain_user_password}"
    admin_password             = "${var.admin_password}"
    encryptappsp_key_password  = "${var.encryptappsp_key_password}"
    tags                       = "${var.tags}"
}
