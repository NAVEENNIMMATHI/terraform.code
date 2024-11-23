module "smbshare" {
  source               = "../../modules/storage_share"
  storage_share_name   = "smbshare"
  storage_account_name = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}smb${lower(var.environment_acronym)}"
  share_quota          = "102400"
}
