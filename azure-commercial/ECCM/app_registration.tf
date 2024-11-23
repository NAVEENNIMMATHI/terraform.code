resource "azuread_application" "app_eccm" {
    name                       = "${upper(var.application_name)}-${upper(var.environment_acronym)}"
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = false
    homepage                   = "https://homepage"
    public_client              = false
    #reply_urls                 = [""]
    
    type                       = "webapp/api"
   
    #required_resource_access {
    #    resource_app_id = "00000003-0000-0000-c000-000000000000"
    #     resource_access {
    #        id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" 
    #        type = "Scope"
    #    }
    #}
}