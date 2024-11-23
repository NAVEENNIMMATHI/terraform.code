resource "azuread_application" "ad_repgenrestapp_spipaas" {
    for_each = var.application_rg
    name                       = "${upper(var.application_acronym)}RepgenRest${upper(each.value.region)}${upper(var.environment_acronym)}"
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = false
    public_client              = false
   #reply_urls                 = ["https://localhost/signin-oidc","https://${lower(var.application_name)}repgenrest${each.value.region}${lower(var.app_url_acronym)}.kpmgcloudops.com/signin-oidc"]
    reply_urls                 = each.value.region == "cn" ? ["https://localhost/signin-oidc","https://spigorepgenrestca.kpmgcloudops.com/signin-oidc"] : ["https://localhost/signin-oidc","https://${lower(var.application_name)}repgenrest${each.value.region}${lower(var.app_url_acronym)}.kpmgcloudops.com/signin-oidc"]
    type                       = "webapp/api"
   
    required_resource_access {
        resource_app_id = "00000003-0000-0000-c000-000000000000"

        resource_access {
            id   = "37f7f235-527c-4136-accd-4a02d197296e" //Microsoft graph sign users in 
            type = "Scope"
        }
         resource_access {
            id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" //Sign in and read user profile
            type = "Scope"
        }
    }
}

resource "azuread_service_principal" "ad_spipaas_repgenrestapp" {
    for_each = var.application_rg
    app_role_assignment_required = true
    application_id               =   azuread_application.ad_repgenrestapp_spipaas[each.key].application_id
        tags                         = [
        "WindowsAzureActiveDirectoryIntegratedApp",
    ]

}
