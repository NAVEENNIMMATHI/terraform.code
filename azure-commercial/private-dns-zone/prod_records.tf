resource "azurerm_private_dns_a_record" "aseusecore3p" {
  name                = "aseusecore3p"
  zone_name           = module.ase.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.35.0.11"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "aseusecore3p_scm" {
  name                = "aseusecore3p.scm"
  zone_name           = module.ase.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.35.0.11"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}

# resource "azurerm_private_dns_cname_record" "rconnect" {
  
#   name                = "rconnect.fulcrum"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 300
#   record              = "uemcrstudcon1p1.kco.local"
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }
# resource "azurerm_private_dns_cname_record" "rpm" {
#   name                = "rpm.fulcrum"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 300
#   record              = "uemcrstudrpm1p1.kco.local"
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }
# resource "azurerm_private_dns_cname_record" "rpro" {
#   name                = "rpro.fulcrum"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 300
#   record              = "rstudsrvpro1p1.kco.local"
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }

# resource "azurerm_private_dns_a_record" "fun_usc_cfr_pd" {
#   name                = "fun-usc-cfr-pd"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = ["10.4.16.11"]
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }

# resource "azurerm_private_dns_a_record" "fun_usc_cfr_pd_scm" {
#   name                = "fun-usc-cfr-pd.scm"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = ["10.4.16.11"]
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }

# resource "azurerm_private_dns_a_record" "fun_usc_cfr_uat" {
#   name                = "fun-usc-cfr-uat"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = ["10.26.16.11"]
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }


# resource "azurerm_private_dns_a_record" "fun_usc_cfr_uat_scm" {
#   name                = "fun-usc-cfr-uat.scm"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = ["10.26.16.11"]
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }

# resource "azurerm_private_dns_a_record" "fun_use_cfr_javaconverter_pd" {
#   name                = "fun-use-cfr-javaconverter-pd"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = ["10.4.16.11"]
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }

# resource "azurerm_private_dns_a_record" "fun_use_cfr_javaconverter_pd_scm" {
#   name                = "fun-use-cfr-javaconverter-pd.scm"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = ["10.4.16.11"]
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }

# resource "azurerm_private_dns_a_record" "fun_use_cfr_javaconverter_uat" {
#   name                = "fun-use-cfr-javaconverter-uat"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = ["10.26.16.11"]
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }

# resource "azurerm_private_dns_a_record" "fun_use_cfr_javaconverter_uat_scm" {
#   name                = "fun-use-cfr-javaconverter-uat.scm"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = ["10.26.16.11"]
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }

# resource "azurerm_private_dns_a_record" "fun_use_cmbs_pd" {
#   name                = "fun-use-cmbs-pd"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = ["10.4.16.11"]
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }

# resource "azurerm_private_dns_a_record" "fun_use_cmbs_pd_scm" {
#   name                = "fun-use-cmbs-pd.scm"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = ["10.4.16.11"]
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }

# resource "azurerm_private_dns_a_record" "fun_use_cmbs_uat" {
#   name                = "fun-use-cmbs-uat"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = ["10.50.0.11"]
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }

# resource "azurerm_private_dns_a_record" "fun_use_cmbs_uat_scm" {
#   name                = "fun-use-cmbs-uat.scm"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = ["10.50.0.11"]
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }

# resource "azurerm_private_dns_a_record" "fun_use_datadog_p" {
#   name                = "fun-use-datadog-p"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = ["10.30.8.139"]
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }

# resource "azurerm_private_dns_a_record" "fun_use_datadog_p_scm" {
#   name                = "fun-use-datadog-p.scm"
#   zone_name           = module.kpmgcloudops.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = ["10.30.8.139"]
#   count               = var.environment_acronym == "pd" ? 1 : 0
# }

##KeyVault
resource "azurerm_private_dns_a_record" "kvl_use_app_kpiq_pd" {
  name                = "kvl-use-app-kpiq-pd"
  zone_name           = module.azure_keyvault.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.33.19.5"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "kvl_use_app_kpiq_uat" {
  name                = "kvl-use-app-kpiq-uat"
  zone_name           = module.azure_keyvault.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.19.6"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}


##SQL Server

resource "azurerm_private_dns_a_record" "mssqlsrv_use_kpiq_pd" {
  name                = "mssqlsrv-use-kpiq-pd"
  zone_name           = module.azure_sql.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.33.19.6"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "mssqlsrv_use_kpiq_uat" {
  name                = "mssqlsrv-use-kpiq-uat"
  zone_name           = module.azure_sql.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.19.5"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}


# azure_storage

resource "azurerm_private_dns_a_record" "stousecmbspd" {
  name                = "stousecmbspd"
  zone_name           = module.azure_storage_blob.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.22.4"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "stousecmbsuat" {
  name                = "stousecmbsuat"
  zone_name           = module.azure_storage_blob.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.6.4"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "stousekpiqpd" {
  name                = "stousekpiqpd"
  zone_name           = module.azure_storage_blob.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.33.19.4"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "stousekpiquat" {
  name                = "stousekpiquat"
  zone_name           = module.azure_storage_blob.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.19.4"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
# file storage
resource "azurerm_private_dns_a_record" "stousespipep" {
  name                = "stousespipep"
  zone_name           = module.azure_storage_file.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.32.7.36"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}

 #search

resource "azurerm_private_dns_a_record" "css_use_kip_pd" {
  name                = "css-use-kip-pd"
  zone_name           = module.azure_search.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.26.4.10"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "css_use_kip_st" {
  name                = "css-use-kip-st"
  zone_name           = module.azure_search.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.12.1.68"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "ad-uat-staging_scm" {
  name                = "ad-uat-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.100.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "auth-uat-staging_scm" {
  name                = "auth-uat-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.100.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "devops-uat-staging_scm" {
  name                = "devops-uat-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.100.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "powerbi-uat-staging_scm" {
  name                = "powerbi-uat-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.100.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "workspace-uat-staging_scm" {
  name                = "workspace-uat-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.100.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-ad-uat-staging_scm" {
  name                = "fun-use-dm-ad-uat-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.100.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-devops-uat-staging_scm" {
  name                = "fun-use-dm-devops-uat-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.100.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-powerbi-uat-staging_scm" {
  name                = "fun-use-dm-powerbi-uat-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.100.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-workspace-uat-staging_scm" {
  name                = "fun-use-dm-workspace-uat-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.100.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "ad-pd-staging_scm" {
  name                = "ad-pd-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.30.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "auth-pd-staging_scm" {
  name                = "auth-pd-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.30.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "devops-pd-staging_scm" {
  name                = "devops-pd-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.30.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "powerbi-pd-staging_scm" {
  name                = "powerbi-pd-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.30.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "workspace-pd-staging_scm" {
  name                = "workspace-pd-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.30.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-ad-pd-staging_scm" {
  name                = "fun-use-dm-ad-pd-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.30.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-devops-pd-staging_scm" {
  name                = "fun-use-dm-devops-pd-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.30.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-powerbi-pd-staging_scm" {
  name                = "fun-use-dm-powerbi-pd-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.30.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "fun-use-dm-workspace-pd-staging_scm" {
  name                = "fun-use-dm-workspace-pd-staging.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.30.8.139"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "vmapuat_scm" {
  name                = "vmapuat.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.50.0.11"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "vmap_scm" {
  name                = "vmap.scm"
  zone_name           = module.azure_webapp.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.4.16.11"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}
resource "azurerm_private_dns_a_record" "mdpcheckpointuat" {
  name                = "@"
  zone_name           = module.uat_checkpoint.private_dns_zone_name
  resource_group_name = module.applicationrg.resource_group_name
  ttl                 = 3600
  records             = ["10.51.66.15"]
  count               = var.environment_acronym == "pd" ? 1 : 0
}