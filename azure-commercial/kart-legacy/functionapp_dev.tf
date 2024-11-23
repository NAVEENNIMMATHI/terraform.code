#resource "azurerm_function_app" "funapp_elasticpool_scaleup" {
#  name                      = "krt-elspoolscluptask-dev"
#  resource_group_name = "${module.applicationrg.resource_group_name}"
#  location            = "${module.applicationrg.resource_group_location}"
#  app_service_plan_id = "${azurerm_app_service_plan.appserviceplan.id}"
#  storage_connection_string = "${module.functionappsa.primary_connection_string}"
#  tags     = "${var.tags}"
#}
