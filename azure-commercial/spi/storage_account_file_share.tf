module "SPIShare" {
  source               = "../../modules/storage_share"
  storage_share_name   = "spishare"
  storage_account_name = module.spifishfileshare.storage_account_name
  share_quota          = var.spishare_size
}

module "FDDShare" {
  source               = "../../modules/storage_share"
  storage_share_name   = "fddshare"
  storage_account_name = module.spifishfileshare.storage_account_name
  share_quota          = var.fddshare_size
}

module "Installation" {
  source               = "../../modules/storage_share"
  storage_share_name   = "installation"
  storage_account_name = module.spifishfileshare.storage_account_name
  share_quota          = var.install_size
}

module "AlteryxData" {
  source               = "../../modules/storage_share"
  storage_share_name   = "alteryxdata"
  storage_account_name = module.spifishfileshare.storage_account_name
  share_quota          = var.alteryxdata_size
}