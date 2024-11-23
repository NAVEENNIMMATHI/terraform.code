resource "azurerm_network_security_group" "bastionnsg" {
        name                = "co${var.environment}${var.application_rg_location}${var.application_acronym}bastiannsg" 
        location            = "${module.applicationrg.resource_group_location}"
        resource_group_name = "${module.applicationrg.resource_group_name}"

  tags = "${var.tags}"
}
resource "azurerm_network_security_group" "workernsg" {
        name                = "co${var.environment}${var.application_rg_location}${var.application_acronym}workernsg" 
        location            = "${module.applicationrg.resource_group_location}"
        resource_group_name = "${module.applicationrg.resource_group_name}"

  tags = "${var.tags}"

}
