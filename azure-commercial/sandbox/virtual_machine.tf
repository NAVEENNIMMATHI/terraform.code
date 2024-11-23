module "appvirtualmachine" {
    source="../modules/virtual_machine_sandbox"

    resource_group_location = "${module.applicationrg.resource_group_location}"
    resource_group_name = "${module.applicationrg.resource_group_name}"

    tags = "${var.tags}"

    count_value = 1

    application_acronym ="${var.application_acronym}"
    application_name ="${var.application_name}"
    subnet_id = "${azurerm_subnet.workersubnet.id}"
    availability_set_id = ""
    azurerm_image_id = ""
    storage_account_name = ""
    template_file = ""
    template_file_xml = ""
    data_disk_size = 200
    application_environment = "${var.application_environment}"
    loganalytics_workspace_id = ""
    loganalytics_workspace_key = ""
    diskencryption_keyvault = ""
    storage_account_key = ""
    vm_size = "${var.vm_size}"
    storage_uri = "${module.vmdiagnosticslogssa.primary_blob_endpoint}"
    client_id = ""

    #recovery_vault_name = "asdf"
    #backup_resource_group_name = "${module.applicationrg.resource_group_name}"
    #backup_policy_id = "${module.recoveryservice.backup_policy_id}"
}