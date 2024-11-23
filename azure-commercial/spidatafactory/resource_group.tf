locals {
  legacy_prefix_dfrg  = "co-${var.environment_acronym}-${var.location}-${var.application_acronym}datafactory"
  legacy_prefix_dlrg  = "co-${var.environment_acronym}-${var.location}-${var.application_acronym}datalakestore"
  common_prefix_dl_rg = "RGP-${upper(var.location_acronym)}-DL-${upper(var.application_acronym)}-${upper(var.environment_acronym)}"
  common_prefix_df_rg = "RGP-${upper(var.location_acronym)}-DF-${upper(var.application_acronym)}-${upper(var.environment_acronym)}"
                          
}

resource "azurerm_resource_group" "cospidatafactoryrg" {
  name                  = var.environment ==  "production" ? "${local.legacy_prefix_dfrg}-rg" : "${local.common_prefix_df_rg}"
  location              = var.location

  tags                  = var.environment ==  "production" ?  var.tags_rg :var.tags

}

resource "azurerm_resource_group" "cospidatalakerg" {
  name                  = var.environment ==  "production" ? "${local.legacy_prefix_dlrg}-rg" : "${local.common_prefix_dl_rg}"
  location              = var.location

  tags                  = var.environment ==  "production" ? var.tags_rg : var.tags
}
