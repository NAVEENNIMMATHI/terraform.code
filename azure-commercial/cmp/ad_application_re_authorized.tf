resource "azuread_application_pre_authorized" "cmp_pre_authorized_api" {
  for_each = var.cmp_clients

  application_object_id = azuread_application.cmp_api_registration[each.key].object_id
  authorized_app_id     = azuread_application.cmp_spa_registration[each.key].application_id
  permission_ids        = [
            random_uuid.Users_Write_all_id.result,     
            random_uuid.Users_Read_all_id.result,  
            random_uuid.Communication_Templates_Write_all_id.result,    
            random_uuid.Communication_Templates_Read_all_id.result,
            random_uuid.Communications_Write_all_id.result,
            random_uuid.Communications_Read_all_id.result, 
            random_uuid.Milestones_Write_all_id.result,
            random_uuid.Milestones_Read_all_id.result, 
            random_uuid.Tminus_Templates_Write_all_id.result,
            random_uuid.Tminus_Templates_Read_all_id.result, 
            random_uuid.Migrations_Write_all_id.result,
            random_uuid.Migrations_Read_all_id.result,
            random_uuid.Applications_Write_all_id.result,
            random_uuid.Applications_Read_all_id.result,  
            random_uuid.Nomenclatures_Read_all_id.result,   
            random_uuid.Tminus_Schedules_Read_all_id.result,    
            random_uuid.Tminus_Schedules_Write_all_id.result,  
            random_uuid.access_as_user_id.result
      ]
}