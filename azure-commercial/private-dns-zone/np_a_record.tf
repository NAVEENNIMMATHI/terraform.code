###SQL###
resource "azurerm_private_dns_a_record" "mssqlsrv-use-idp-dv" {
  name                = "mssqlsrv-use-idp-dv"
  zone_name           = module.azure_sql.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.7.244"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
#resource "azurerm_private_dns_a_record" "mssqlsrv-use-idp-qa" {
#  name                = "mssqlsrv-use-idp-qa"
#  zone_name           = module.azure_sql.private_dns_zone_name
#  resource_group_name = module.applicationrg.resource_group_name
#  ttl                 = 3600
#  records             = ["10.70.7.244"]
#  count               = var.environment_acronym == "dv" ? 1 : 0
#}
resource "azurerm_private_dns_a_record" "clonpsqlserver" {
  name                = "clonpsqlserver"
  zone_name           = module.azure_sql.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.20.71"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "mssqlsrv-use-kpiq-dv" {
  name                = "mssqlsrv-use-kpiq-dv"
  zone_name           = module.azure_sql.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.19.6"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "mssqlsrv-use-kpiq-qa" {
  name                = "mssqlsrv-use-kpiq-qa"
  zone_name           = module.azure_sql.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.19.6"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "wvdsqlsrvr1" {
  name                = "wvdsqlsrvr1"
  zone_name           = module.azure_sql.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.1.21.53"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}

###Blob###
resource "azurerm_private_dns_a_record" "stouseartdv" {
  name                = "stouseartdv"
  zone_name           = module.azure_storage_blob.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.100.0.191"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "stouseartqa" {
  name                = "stouseartqa"
  zone_name           = module.azure_storage_blob.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.12.4"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "stouse1aadsyncnp" {
  name                = "stouse1aadsyncnp"
  zone_name           = module.azure_storage_blob.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.24.1.5"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "stousecmbsdev" {
  name                = "stousecmbsdev"
  zone_name           = module.azure_storage_blob.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.6.4"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "stousecmbsqa" {
  name                = "stousecmbsqa"
  zone_name           = module.azure_storage_blob.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.70.6.4"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "stouseidpdv" {
  name                = "stouseidpdv"
  zone_name           = module.azure_storage_blob.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.7.246"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
#resource "azurerm_private_dns_a_record" "stouseidpqa" {
#  name                = "stouseidpqa"
#  zone_name           = module.azure_storage_blob.private_dns_zone_name
#  resource_group_name = module.applicationrg.resource_group_name
#  ttl                 = 3600
#  records             = ["10.70.7.246"]
#  count               = var.environment_acronym == "dv" ? 1 : 0
#}
resource "azurerm_private_dns_a_record" "stousekpiqdv" {
  name                = "stousekpiqdv"
  zone_name           = module.azure_storage_blob.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.19.5"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "stousekpiqqa" {
  name                = "stousekpiqqa"
  zone_name           = module.azure_storage_blob.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.19.5"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}

###File###

resource "azurerm_private_dns_a_record" "stousedasmbdev" {
  name                = "stousedasmbdev"
  zone_name           = module.azure_storage_file.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.19.4"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "stousedasmbqa" {
  name                = "stousedasmbqa"
  zone_name           = module.azure_storage_file.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.19.4"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "stousespiazfnp" {
  name                = "stousespiazfnp"
  zone_name           = module.azure_storage_file.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.3.35"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "stousespipedv" {
  name                = "stousespipedv"
  zone_name           = module.azure_storage_file.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.39.36","10.51.85.14"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "stousespipeqa" {
  name                = "stousespipeqa"
  zone_name           = module.azure_storage_file.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.39.36","10.71.85.9"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "stousewvdfslogixprofiles" {
  name                = "stousewvdfslogixprofiles"
  zone_name           = module.azure_storage_file.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.1.21.55"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "stousewvdtest2" {
  name                = "stousewvdtest2"
  zone_name           = module.azure_storage_file.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.1.21.54"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "dlsusekiprawcurtd01sadv" {
  name                = "dlsusekiprawcurtd01sadv"
  zone_name           = module.azure_storage_file.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.10.151","10.51.85.16"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}

#resource "azurerm_private_dns_a_record" "dlsusekiprawcurtd01saqa" {
#  name                = "dlsusekiprawcurtd01saqa"
#  zone_name           = module.azure_storage_file.private_dns_zone_name
#  resource_group_name = module.applicationrg.resource_group_name
#  ttl                 = 3600
#  records             = ["10.71.85.10","10.71.9.142"]
#  count               = var.environment_acronym == "dv" ? 1 : 0
#}

##PostGres##

resource "azurerm_private_dns_a_record" "pgs-use-core-aks-dv" {
  name                = "pgs-use-core-aks-dv"
  zone_name           = module.azure_postgresqlserver.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.100.0.192"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "pgs-use-core-aks-qa" {
  name                = "pgs-use-core-aks-qa"
  zone_name           = module.azure_postgresqlserver.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.12.5"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}

##Queue##

resource "azurerm_private_dns_a_record" "stouse1aadsyncnp-queue" {
  name                = "stouse1aadsyncnp"
  zone_name           = module.azure_storage_queue.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.12.5"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}

##Vault##

resource "azurerm_private_dns_a_record" "kvl-use-adsync1-dv" {
  name                = "kvl-use-adsync1-dv"
  zone_name           = module.azure_keyvault.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.24.1.8"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kvl-use-app-kpiq-dv" {
  name                = "kvl-use-app-kpiq-dv"
  zone_name           = module.azure_keyvault.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.19.7"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kvl-use-app-kpiq-qa" {
  name                = "kvl-use-app-kpiq-qa"
  zone_name           = module.azure_keyvault.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.19.7"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kvl-use-idp-dv" {
  name                = "kvl-use-idp-dv"
  zone_name           = module.azure_keyvault.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.7.245"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
#resource "azurerm_private_dns_a_record" "kvl-use-idp-qa" {
#  name                = "kvl-use-idp-qa"
#  zone_name           = module.azure_keyvault.private_dns_zone_name
#  resource_group_name = module.applicationrg.resource_group_name
#  ttl                 = 3600
#  records             = ["10.70.7.245"]
#  count               = var.environment_acronym == "dv" ? 1 : 0
#}

##Search##
resource "azurerm_private_dns_a_record" "azsusekipkipdv" {
  name                = "azsusekipkipdv"
  zone_name           = module.azure_search.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.10.134"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "azsusekipkipqa" {
  name                = "azsusekipkipqa"
  zone_name           = module.azure_search.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.9.134"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "co-dv-eastus-kipcognitivesrch" {
  name                = "co-dv-eastus-kipcognitivesrch"
  zone_name           = module.azure_search.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["20.0.0.70"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "co-np-eus-kip-acs" {
  name                = "co-np-eus-kip-acs"
  zone_name           = module.azure_search.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.12.0.71"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}

##AppServiceEnvironment##
resource "azurerm_private_dns_a_record" "aseusecore1dv" {
  name                = "aseusecore1dv"
  zone_name           = module.ase.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.24.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "aseusecore1dv_scm" {
  name                = "aseusecore1dv.scm"
  zone_name           = module.ase.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.24.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "ase-use-core3-dv" {
  name                = "ase-use-core3-dv"
  zone_name           = module.ase.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.35.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "ase-use-core3-dv_scm" {
  name                = "ase-use-core3-dv.scm"
  zone_name           = module.ase.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.35.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}

##kpmgcloudops.com Zone records##

resource "azurerm_private_dns_cname_record" "actdev" {
  name                = "actdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "82b6704d-7a79-4eea-bcd2-a60965e0ff75.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}

resource "azurerm_private_dns_cname_record" "ad-dev" {
  name                = "ad-dev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "345bfd18-b43d-455a-91d3-61c1689e1fa5.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "ad-qa" {
  name                = "ad-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "412435f2-36bb-42e7-9ca9-551b65ea9f7d.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "adminfastpathdev" {
  name                = "adminfastpathdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "8bcc13aa-3e70-485b-b430-a98ea2db3e31.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "apiadminfastpathdev" {
  name                = "apiadminfastpathdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "8bcc13aa-3e70-485b-b430-a98ea2db3e31.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "apifastpathdev" {
  name                = "apifastpathdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "8bcc13aa-3e70-485b-b430-a98ea2db3e31.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "auth-dev" {
  name                = "auth-dev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "345bfd18-b43d-455a-91d3-61c1689e1fa5.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "auth-qa" {
  name                = "auth-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "412435f2-36bb-42e7-9ca9-551b65ea9f7d.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "bmpdev" {
  name                = "bmpdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "82b6704d-7a79-4eea-bcd2-a60965e0ff75.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "bmpkpimdev" {
  name                = "bmpkpimdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "82b6704d-7a79-4eea-bcd2-a60965e0ff75.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "changeframeqa" {
  name                = "changeframeqa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "d0943052-cd22-401d-91b1-6463a1e49e0f.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "cmadev" {
  name                = "cmadev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "dbb8458a-82db-4007-93c3-c48703d5e126.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "dasavizdev" {
  name                = "dasavizdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "apg-use-tab-dv.eastus.cloudapp.azure.com"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "dasnp" {
  name                = "dasnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "90a342ae-5d52-4503-9288-56242332cf34.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "dasrestnp" {
  name                = "dasrestnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "90a342ae-5d52-4503-9288-56242332cf34.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "devops-dev" {
  name                = "devops-dev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "345bfd18-b43d-455a-91d3-61c1689e1fa5.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "devops-qa" {
  name                = "devops-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "412435f2-36bb-42e7-9ca9-551b65ea9f7d.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "digitalmatrix-dev" {
  name                = "digitalmatrix-dev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "345bfd18-b43d-455a-91d3-61c1689e1fa5.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "digitalmatrix-qa" {
  name                = "digitalmatrix-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "412435f2-36bb-42e7-9ca9-551b65ea9f7d.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "fastpathdev" {
  name                = "fastpathdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "8bcc13aa-3e70-485b-b430-a98ea2db3e31.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
#resource "azurerm_private_dns_cname_record" "kartdev" {
#  name                = "kartdev"
#  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
#  resource_group_name = module.applicationrg.resource_group_name
#  ttl                 = 300
#  record              = "eca0cb76-a6ca-47df-91d7-59248faa73dd.cloudapp.net"
#  count               = var.environment_acronym == "dv" ? 1 : 0
#}
resource "azurerm_private_dns_a_record" "kartngdev" {
  name                = "kartngdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kartngqa" {
  name                = "kartngqa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kartngrestdev" {
  name                = "kartngrestdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kartngrestqa" {
  name                = "kartngrestqa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "kipd" {
  name                = "kipd"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "9df34ca9-c30c-4225-a929-f9cd1d254ee5.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "kipdev" {
  name                = "kipdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "90a342ae-5d52-4503-9288-56242332cf34.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "kipq" {
  name                = "kipq"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "8443767a-efad-4f51-9ea7-bf156b50863c.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "kipqa" {
  name                = "kipqa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "90a342ae-5d52-4503-9288-56242332cf34.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "kiprestd" {
  name                = "kiprestd"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "9df34ca9-c30c-4225-a929-f9cd1d254ee5.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "kiprestdev" {
  name                = "kiprestdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "90a342ae-5d52-4503-9288-56242332cf34.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "kiprestq" {
  name                = "kiprestq"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "8443767a-efad-4f51-9ea7-bf156b50863c.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "kiprestqa" {
  name                = "kiprestqa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "90a342ae-5d52-4503-9288-56242332cf34.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "kpiqrestdev" {
  name                = "kpiqrestdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "e44ce2da-fa92-46ad-9eb1-32a08995210a.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "mep-kipd" {
  name                = "mep-kipd"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "9df34ca9-c30c-4225-a929-f9cd1d254ee5.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "mep-kipdev" {
  name                = "mep-kipdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "90a342ae-5d52-4503-9288-56242332cf34.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "mep-kipq" {
  name                = "mep-kipq"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "8443767a-efad-4f51-9ea7-bf156b50863c.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "mepdev" {
  name                = "mepdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "82b6704d-7a79-4eea-bcd2-a60965e0ff75.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "meprest-kipd" {
  name                = "meprest-kipd"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "9df34ca9-c30c-4225-a929-f9cd1d254ee5.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "meprest-kipdev" {
  name                = "meprest-kipdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "90a342ae-5d52-4503-9288-56242332cf34.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "meprest-kipq" {
  name                = "meprest-kipq"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "8443767a-efad-4f51-9ea7-bf156b50863c.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "meprest-kipqa" {
  name                = "meprest-kipqa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "90a342ae-5d52-4503-9288-56242332cf34.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "meprestdev" {
  name                = "meprestdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "82b6704d-7a79-4eea-bcd2-a60965e0ff75.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "ofrdev" {
  name                = "ofrdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "b7460774-6a31-4f05-8aca-cab1a83475a4.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "powerbi-dev" {
  name                = "powerbi-dev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "345bfd18-b43d-455a-91d3-61c1689e1fa5.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "powerbi-qa" {
  name                = "powerbi-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "412435f2-36bb-42e7-9ca9-551b65ea9f7d.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "spidev" {
  name                = "spidev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "edeeb6bb-3c3a-4c75-b57a-c9cbcfbcd00b.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "spiqa" {
  name                = "spiqa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "752e691a-e912-413f-9779-772cb5e4ca88.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "workspace-dev" {
  name                = "workspace-dev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "345bfd18-b43d-455a-91d3-61c1689e1fa5.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "workspace-qa" {
  name                = "workspace-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "412435f2-36bb-42e7-9ca9-551b65ea9f7d.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "mep-kipqa" {
  name                = "mep-kipqa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "90a342ae-5d52-4503-9288-56242332cf34.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "dasrestdev" {
  name                = "dasrestdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "82b6704d-7a79-4eea-bcd2-a60965e0ff75.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "dashdev" {
  name                = "dashdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "82b6704d-7a79-4eea-bcd2-a60965e0ff75.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "dasdev" {
  name                = "dasdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "82b6704d-7a79-4eea-bcd2-a60965e0ff75.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "bmprestdev" {
  name                = "bmprestdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "82b6704d-7a79-4eea-bcd2-a60965e0ff75.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "artifactory-dev" {
  name                = "artifactory-dev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["20.72.190.221"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "artifactory-qa" {
  name                = "artifactory-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["52.186.32.29"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "abladev" {
  name                = "abladev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "ablanp" {
  name                = "ablanp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["40.71.227.59"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "ablanp-qa" {
  name                = "ablanp-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["40.71.227.59"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "ablanpsbw" {
  name                = "ablanpsbw"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["23.96.51.225"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "actnp" {
  name                = "actnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["23.96.62.160"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "app-use-cma-dv" {
  name                = "app-use-cma-dv"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "app-use-cma-dv2" {
  name                = "app-use-cma-dv2"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "bmpkpimnp" {
  name                = "bmpkpimnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["23.96.62.160"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "bmpnp" {
  name                = "bmpnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["23.96.62.160"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "bmprestnp" {
  name                = "bmprestnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["23.96.62.160"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "clodev" {
  name                = "clodev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["13.82.59.66"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "clonp" {
  name                = "clonp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["52.168.74.168"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "cloqa" {
  name                = "cloqa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["40.76.197.103"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "cmbsnp" {
  name                = "cmbsnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "dasaviz-np" {
  name                = "dasaviz-np"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["20.185.101.228"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "dasgallerynp" {
  name                = "dasgallerynp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.5.4"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "dashnp" {
  name                = "dashnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["23.96.62.160"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fpidev" {
  name                = "fpidev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["20.62.220.151"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fpinp" {
  name                = "fpinp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["52.151.246.219"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fpinps" {
  name                = "fpinps"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["52.191.218.79"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fpiqa" {
  name                = "fpiqa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["20.185.102.104"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fpnp" {
  name                = "fpnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["13.68.222.107"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-usc-cfr-dev" {
  name                = "fun-usc-cfr-dev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-usc-cfr-dv" {
  name                = "fun-usc-cfr-dv"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-usc-cfr-qa" {
  name                = "fun-usc-cfr-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.70.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-usc-cfrconverter-dv" {
  name                = "fun-usc-cfrconverter-dv"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-adsync-dv" {
  name                = "fun-use-adsync-dv"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-adsync-dv-qa" {
  name                = "fun-use-adsync-dv-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-cfr-javaconverter-dev" {
  name                = "fun-use-cfr-javaconverter-dev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-cfr-javaconverter-dv" {
  name                = "fun-use-cfr-javaconverter-dv"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-cfr-javaconverter-qa" {
  name                = "fun-use-cfr-javaconverter-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.70.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-cmbs-dev" {
  name                = "fun-use-cmbs-dev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-cmbs-qa" {
  name                = "fun-use-cmbs-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.70.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-datadog-dev" {
  name                = "fun-use-datadog-dev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-datadog-p" {
  name                = "fun-use-datadog-p"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.30.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-ad-dv" {
  name                = "fun-use-dm-ad-dv"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-ad-qa" {
  name                = "fun-use-dm-ad-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-devops-dv" {
  name                = "fun-use-dm-devops-dv"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-devops-qa" {
  name                = "fun-use-dm-devops-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-powerbi-dv" {
  name                = "fun-use-dm-powerbi-dv"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-powerbi-qa" {
  name                = "fun-use-dm-powerbi-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-workspace-dv" {
  name                = "fun-use-dm-workspace-dv"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-workspace-qa" {
  name                = "fun-use-dm-workspace-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-kartng-qa" {
  name                = "fun-use-kartng-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-kartng-dv" {
  name                = "fun-use-kartng-dv"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-kip-dv" {
  name                = "fun-use-kip-dv"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-kip-qa" {
  name                = "fun-use-kip-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-ofr-dev" {
  name                = "fun-use-ofr-dev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kart" {
  name                = "kart"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["40.114.69.159"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kartqa" {
  name                = "kartqa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["40.88.4.209"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kartuat" {
  name                = "kartuat"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["40.114.69.159"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kmedev" {
  name                = "kmedev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "mepnp" {
  name                = "mepnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["23.96.62.160"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "meprestnp" {
  name                = "meprestnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["23.96.62.160"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "panoramanp" {
  name                = "panoramanp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.1.6.7"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "pinsightsnp" {
  name                = "pinsightsnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["137.135.112.202"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "pinsightsnp-qa" {
  name                = "pinsightsnp-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["137.135.112.202"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "mdp_api_dev" {
  name                = "mdpapi-dev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.64.197"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "mdp_api_dev_developer" {
  name                = "mdpapi-dev-developer"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.64.197"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "mdp_api_qa" {
  name                = "mdpapi-qa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.64.197"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "mdp_api_qa_developer" {
  name                = "mdpapi-qa-developer"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.64.197"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}

##kpmgcloudops.com Zone records fulcrumdev##
resource "azurerm_private_dns_cname_record" "rconnect_fulcrumdev" {
  name                = "rconnect.fulcrumdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record             = "vmluserstuco2dv.kconp.local"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "rconnectdev_fulcrumdev" {
  name                = "rconnectdev.fulcrumdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "vmluserstucondv.kconp.local"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "rpm_fulcrumdev" {
  name                = "rpm.fulcrumdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "vmlusersturp2dv.kconp.local"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
#resource "azurerm_private_dns_cname_record" "rpro_fulcrumdev" {
#  name                = "rpro.fulcrumdev"
#  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
#  resource_group_name = module.applicationrg.resource_group_name
#  ttl                 = 300
#  record              = "vmluserstusp2dv.kconp.local"
#  count               = var.environment_acronym == "dv" ? 1 : 0
#}

##kpmgcloudops.com Zone records fulcrumnp##
resource "azurerm_private_dns_a_record" "rconnect_fulcrumnp" {
  name                = "rconnect.fulcrumnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.7.9"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "rpm_fulcrumnp" {
  name                = "rpm.fulcrumnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.7.12"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "rpro_fulcrumnp" {
  name                = "rpro.fulcrumnp"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.7.8"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}

##kpmgcloudops.com Zone records scm##

resource "azurerm_private_dns_a_record" "ad-dev_scm" {
  name                = "ad-dev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "ad-dev-staging_scm" {
  name                = "ad-dev-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "ad-qa_scm" {
  name                = "ad-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "ad-qa-staging_scm" {
  name                = "ad-qa-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "adminfastpathdev_scm" {
  name                = "adminfastpathdev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "api-use-fastpath-np_scm" {
  name                = "api-use-fastpath-np.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.25.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "api-use-supportfastpath-np_scm" {
  name                = "api-use-supportfastpath-np.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.25.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "apiadminfastpathdev_scm" {
  name                = "apiadminfastpathdev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "apifastpathdev_scm" {
  name                = "apifastpathdev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "app-use-cma-dv_scm" {
  name                = "app-use-cma-dv.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "auth-dev_scm" {
  name                = "auth-dev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "auth-dev-staging_scm" {
  name                = "auth-dev-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "auth-qa_scm" {
  name                = "auth-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "auth-qa-staging_scm" {
  name                = "auth-qa-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "clodev_scm" {
  name                = "clodev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["13.82.59.66"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "cloqa_scm" {
  name                = "cloqa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["40.76.197.103"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "cmbsnp_scm" {
  name                = "cmbsnp.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "dasnp_scm" {
  name                = "dasnp.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.12.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "dasrestnp_scm" {
  name                = "dasrestnp.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.12.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "devops-dev_scm" {
  name                = "devops-dev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "devops-dev-staging_scm" {
  name                = "devops-dev-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "devops-qa_scm" {
  name                = "devops-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "devops-qa-staging_scm" {
  name                = "devops-qa-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "digitalmatrix-dev_scm" {
  name                = "digitalmatrix-dev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "digitalmatrix-qa_scm" {
  name                = "digitalmatrix-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fap-use-adsync2-dv_scm" {
  name                = "fap-use-adsync2-dv.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.25.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fastpathdev_scm" {
  name                = "fastpathdev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-usc-cfr-dev_scm" {
  name                = "fun-usc-cfr-dev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-usc-cfr-dv_scm" {
  name                = "fun-usc-cfr-dv.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-usc-cfr-qa_scm" {
  name                = "fun-usc-cfr-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.70.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-usc-fastpath-np_scm" {
  name                = "fun-usc-fastpath-np.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-adsync-dv_scm" {
  name                = "fun-use-adsync-dv.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-adsync-dv-qa_scm" {
  name                = "fun-use-adsync-dv-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-cfr-javaconverter-dev_scm" {
  name                = "fun-use-cfr-javaconverter-dev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-cfr-javaconverter-dv_scm" {
  name                = "fun-use-cfr-javaconverter-dv.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-cfr-javaconverter-qa_scm" {
  name                = "fun-use-cfr-javaconverter-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.70.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-cmbs-dev_scm" {
  name                = "fun-use-cmbs-dev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-cmbs-qa_scm" {
  name                = "fun-use-cmbs-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.70.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-datadog-dev_scm" {
  name                = "fun-use-datadog-dev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-datadog-p_scm" {
  name                = "fun-use-datadog-p.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.30.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-ad-dv_scm" {
  name                = "fun-use-dm-ad-dv.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-ad-dv-staging_scm" {
  name                = "fun-use-dm-ad-dv-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-ad-qa_scm" {
  name                = "fun-use-dm-ad-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-ad-qa-staging_scm" {
  name                = "fun-use-dm-ad-qa-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-devops-dv_scm" {
  name                = "fun-use-dm-devops-dv.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-devops-dv-staging_scm" {
  name                = "fun-use-dm-devops-dv-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-devops-qa_scm" {
  name                = "fun-use-dm-devops-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-devops-qa-staging_scm" {
  name                = "fun-use-dm-devops-qa-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-powerbi-dv_scm" {
  name                = "fun-use-dm-powerbi-dv.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-powerbi-dv-staging_scm" {
  name                = "fun-use-dm-powerbi-dv-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-powerbi-qa_scm" {
  name                = "fun-use-dm-powerbi-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-powerbi-qa-staging_scm" {
  name                = "fun-use-dm-powerbi-qa-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-workspace-dv_scm" {
  name                = "fun-use-dm-workspace-dv.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-workspace-dv-staging_scm" {
  name                = "fun-use-dm-workspace-dv-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-workspace-qa_scm" {
  name                = "fun-use-dm-workspace-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-workspace-qa-staging_scm" {
  name                = "fun-use-dm-workspace-qa-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-kartng-dv_scm" {
  name                = "fun-use-kartng-dv.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-kartng-qa_scm" {
  name                = "fun-use-kartng-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.16.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-kip-dv_scm" {
  name                = "fun-use-kip-dv.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-kip-qa_scm" {
  name                = "fun-use-kip-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kartdev_scm" {
  name                = "kartdev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.2.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kartqa_scm" {
  name                = "kartqa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.2.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kipd_scm" {
  name                = "kipd.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kipdev_scm" {
  name                = "kipdev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.12.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kipq_scm" {
  name                = "kipq.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kipqa_scm" {
  name                = "kipqa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.12.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kiprestd_scm" {
  name                = "kiprestd.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kiprestdev_scm" {
  name                = "kiprestdev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.12.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kiprestq_scm" {
  name                = "kiprestq.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "kiprestqa_scm" {
  name                = "kiprestqa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.12.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "mep-kipd_scm" {
  name                = "mep-kipd.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "mep-kipdev_scm" {
  name                = "mep-kipdev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.12.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "mep-kipq_scm" {
  name                = "mep-kipq.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "mep-kipqa_scm" {
  name                = "mep-kipqa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.12.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "meprest-kipd_scm" {
  name                = "meprest-kipd.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "meprest-kipdev_scm" {
  name                = "meprest-kipdev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.12.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "meprest-kipq_scm" {
  name                = "meprest-kipq.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "meprest-kipqa_scm" {
  name                = "meprest-kipqa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.12.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "ofrdev_scm" {
  name                = "ofrdev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "powerbi-dev_scm" {
  name                = "powerbi-dev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "powerbi-dev-staging_scm" {
  name                = "powerbi-dev-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "powerbi-qa_scm" {
  name                = "powerbi-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "powerbi-qa-staging_scm" {
  name                = "powerbi-qa-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "web-use-fastpath-np_scm" {
  name                = "web-use-fastpath-np.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.25.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "web-use-ofr-dev_scm" {
  name                = "web-use-ofr-dev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "web-use-supportfastpath-np_scm" {
  name                = "web-use-supportfastpath-np.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.25.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "workspace-dev_scm" {
  name                = "workspace-dev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "workspace-dev-staging_scm" {
  name                = "workspace-dev-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.6.27.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "workspace-qa_scm" {
  name                = "workspace-qa.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "workspace-qa-staging_scm" {
  name                = "workspace-qa-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "ad-cat-staging_scm" {
  name                = "ad-cat-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "auth-cat-staging_scm" {
  name                = "auth-cat-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "devops-cat-staging_scm" {
  name                = "devops-cat-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "powerbi-cat-staging_scm" {
  name                = "powerbi-cat-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "workspace-cat-staging_scm" {
  name                = "workspace-cat-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-ad-cat-staging_scm" {
  name                = "fun-use-dm-ad-cat-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-devops-cat-staging_scm" {
  name                = "fun-use-dm-devops-cat-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-powerbi-cat-staging_scm" {
  name                = "fun-use-dm-powerbi-cat-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-workspace-cat-staging_scm" {
  name                = "fun-use-dm-workspace-cat-staging.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.101.8.139"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_cname_record" "vmapdev" {
  name                = "vmapdev"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 300
  record              = "c3af3006-150d-41dc-8bea-7101dd63616a.cloudapp.net"
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "vmapdev_scm" {
  name                = "vmapdev.scm"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "mdpcheckpointqa" {
  name                = "mdpcheckpointqa"
  zone_name           = module.kpmgcloudops[0].private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.71.66.27"]
  count               = var.environment_acronym == "dv" ? 1 : 0
}
