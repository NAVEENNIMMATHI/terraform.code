module "sharedvnet"{
    source                  = "../../modules/virtual_network"
    virtual_network_name    = "vnet-${lower(var.location_acronym)}-shared-${lower(var.application_acronym)}${lower(var.vnet_environment_suffix)}"
    resource_group_location = module.applicationrg.resource_group_location
    resource_group_name     = module.applicationrg.resource_group_name
    address_space           = var.vnet_address_space
    dns_server              = var.environment_acronym == "dev" ? [data.azurerm_firewall.firewall.ip_configuration[0].private_ip_address] : var.dns_servers
    tags                    = var.tags
    # ddos_info = {
    #     ddos_plan_id = "/subscriptions/a1c29afb-42e6-465f-a94b-3e02a3f8bfb4/resourceGroups/kpmgjayrg1/providers/Microsoft.Network/ddosProtectionPlans/ddospplan1"
    #     ddos_plan_enabled = true
    # }

}
# module "ddosplanvnet" {
#     source                  = "../../modules/ddos_protection_plan"
#     ddos_plan_name          = "ddos-usc-${lower(var.application_acronym)}-${lower(var.deployment_environment)}"
#     resource_group_location = module.applicationrg.resource_group_location
#     resource_group_name     = module.applicationrg.resource_group_name
#     tags                    = var.tags
# }