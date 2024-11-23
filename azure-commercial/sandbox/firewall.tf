module "firewallnetwork" {
    source="../modules/firewall_network"
    application_acronym="${var.application_acronym}"
    application_resource_group_location = "${module.applicationrg.resource_group_location}"
    resource_group_name = "${module.applicationrg.resource_group_name}" 
    subnet_id = "${azurerm_subnet.firewallsubnet.id}"
    worker_subnet_adress_space = "${var.worker_subnet_adress_space}"
    tags = {}
}