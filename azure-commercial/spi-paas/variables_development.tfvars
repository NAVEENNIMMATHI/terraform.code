client_id           						           = "e0628e55-2ee3-4131-8fdd-330265aed576"
subscription_id                             = "3507153c-e6a4-4e2f-ae04-f34c1fd4482f"
tenant_id                                   = "188697ab-840f-44ec-8535-aaaa5680bab0"
client_secret                               = ""

#environment specific variables
location                                     ="eastus"
vm_location                                  ="uk"
location_acronym						                 = "use"
location_acronym_uk						               = "uks"
application_region                           = "central"
environment                                  = ""
environment_acronym						               = "dv"
Storage_environment_acronym                  = "dv"
application_acronym                          = "spipaas"
application_name                             = "spipaas"
application_type                             = "app"
app_url_acronym                              = "dev"
environment_acronym_agw                      = "dv"
os_letter                                    = "w"
tags =  {
    Platform                = "Azure Commercial Cloud"
    Environment             = "Development"
    Node                    = "Spoke"
    Solution                = "Strategic Profitability Insights (SPI)"
    TechnicalOwner          = "Roopesh Palankar"
    TechnicalContact        = "roopeshpalankar@kpmg.com"
    BusinessOwner           = "Adam S Werner"
    BusinessContact         = "adamwerner@kpmg.com"
    LOB                     = "Deal Advisory & Strategy"
}

is_hns_enabled                              = "true"
account_tier                                = "Standard"
account_tier2                               = "Premium"
account_kind                                = "FileStorage"
replication_type                            = "RAGRS"
replication_type2                           = "ZRS"

app_gateway_environment_acronym             = "dev"
appgateway_sku                              ="WAF_Medium"
spipaasctrapp                               = "spipaasdev"
spipaasrestctrapp                           = "spipaasrestdev"

/***Self Signed Certificate*****/
selfsigncertname                            = "star_kpmgcloudops_com"
spipaaswebappsslcert                        = "spipaasdev.kpmgcloudops.com.cer"
spipaasrestsslcert                          = "spipaasrestdev.kpmgcloudops.com.cer"
spipaasctrsslcertpfx                        = "spipaasdev.kpmgcloudops.com.pfx"
spipaasrestctrsslcertpfx                    = "spipaasrestdev.kpmgcloudops.com.pfx"
azfirewall_ip_address                       = "10.6.24.4"

# app service plan
asp_tier                                   = "PremiumV3"
asp_size                                   = "P1v3"
asp_capacity                               = "1"


webappbackup_container_name                = "webappbackup"
sqlserveradmin_password                    = ""
vm_admin_password                          = ""

#service principal
encryptapp_service_principal_name           = "EncryptApp"
backupmanagement_service_principal_name     = "Backup Management Service"
cloudops_keyvault_admin_group_name          = "CO-Certificate-KeyVault"
client_keyvault_admin_group_name            = "CO-DA-KeyVault-Admins"

#rest application id
rest_app_id                                 = "bcb99761-f704-43cc-a321-4a6ca94c8962"

spipaasvnet_address_space_ctr               = ["10.51.72.0/24"]
dns_server                                  = ["10.1.11.4","10.1.11.5"]
subnet_address_space_ctrappgw               = "10.51.72.64/28" 
subnet_address_space_ctrapp1                = "10.51.72.80/28"
subnet_address_space_ctrpe1                 = "10.51.72.32/27"
subnet_address_space_ctrdb1                 = "10.51.72.96/28"
subnet_address_space_ctrwst1                = "10.51.72.0/27"
subnet_address_space_ctradf1                = "10.51.72.112/28"
subnet_address_space_webapp1                = "10.51.72.128/28"
subnet_address_space_restapp1               = "10.51.72.144/28"


#Virtual Network Peering
coresubscriptionid                                  = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transitsubscriptionid                               = "25f8d797-bee2-4a88-84cc-de328abd6731"
newcoresubscriptionid                               = "c72acede-d539-45d9-963d-3464ec4ddae0"
corevnetresourcegroup                               = "co-np-eastus-core1-rg"
transitvnetresourcegroup                            = "CO-NP-eastus-CONPTVnet-rg"
newcorevnetresourcegroup                            = "CO-dv-eastus-hubvnet-rg"
corevnetname                                        = "co-np-eastus-core1-vnet"
transitvnetname                                     = "CO-NP-eastus-transit1-Vnet"
newcorevnetname                                     = "CO-dv-eastus-hub-vnet"
corepvtdnsresourcegroup                             = "rgp-use-core-private-dnszone-dv"

coreinfrasubnetid                                   ="/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/co-dv-eastus-infra1-subnet"
core_aks_subnet_id                                  = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"

#SPI APP Subnet 
spivnetresourcegroup                                ="RGP-USE-SPI-VNET-DV"
spiappvnetname                                      = "vnt-use-spi-dv"
spiappsubnetname                                    ="sub-use-spi-app-dv"

spipaas_fqdn                                          = ["spipaasdev.azurewebsites.net"]
spipaasrest_fqdn                                      = ["spipaasrestdev.azurewebsites.net"]

count_value_spipaascentral                      = "01"
count_value_spipaaspbi                          = "01"
count_value_spipaasukwst                        = "01"
count_value_spipaaspbi_uk                          = "01"
vm_size_spipaaswst                              = "Standard_D16s_v3"
data_disk_size_spipaaswst                        = "512"
data_disk_size_spipaaspbi                       = "512"
vm_size_pbi                                     = "Standard_D4s_v3"


KPMG_On-Premise                            = "199.207.253.0/24"
KPMG_VPN_US                                = ["199.206.0.5/32", "54.173.33.56/32"]
KPMG_VPN_UK                                = ["158.180.192.10/32","158.180.192.14/32","158.180.128.10/32","158.180.192.10/32","158.179.64.12/32","158.179.64.41/32","158.179.64.42/32","158.179.64.43/32","158.179.64.44/32","158.179.64.45/32","158.179.64.46/32","158.179.64.83/32","158.179.64.84/32","20.49.227.56/32"]
KGS_Bangalore                              = ["103.133.112.80/28","103.58.118.0/24"]
AZFW_PIP      = ["52.190.37.51/32","52.190.37.75/32","52.146.53.140/32","52.146.53.139/32","52.146.53.16/32"]
agw1_subnet_adress_space_central           = "10.51.72.64/28"
agw1_subnet_adress_space_us           = "10.51.73.64/28"
KPMG_VPN_BR =["201.76.177.20/32","201.76.177.30/32","201.76.177.25/32","187.16.120.222/32","177.69.198.30/32","177.69.198.32/32","177.69.198.21/32","177.69.198.41/32","177.69.198.44/32"]
KPMG_VPN_CN =["72.142.87.71/32","72.142.49.77/32","204.50.172.132/32","204.50.15.4/32","99.229.128.42/32"]
KPMG_VPN_AU =["203.30.92.0/22"]
KIP_ASE_PIP = "137.116.114.62/32"
pip_count                           ="2"


analysis_services_admins_groupname                      = "CO-SPIPAAS-ANALYSISSERVERADMINS-DV"

tenantfqdn                                          = "kpmgusadvspectrum.onmicrosoft.com"

#Private DNS
pvt_dns_subscription_id            = "c72acede-d539-45d9-963d-3464ec4ddae0"
pvt_dns_resource_group             = "rgp-use-core-private-dnszone-dv"
pvt_dns_environment_acronym        = "dv"


# region application variables 
application_rg = {
  uk = {
       region  = "uk"
       location = "uksouth"
       location_acronym = "uks"
       batchmanagementname="BatchNodeManagement.UKSouth"
  }
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       batchmanagementname="BatchNodeManagement.EastUS"
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "br"
       batchmanagementname="BatchNodeManagement.UKSouth"
  }
  au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       batchmanagementname="BatchNodeManagement.UKSouth"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       batchmanagementname="BatchNodeManagement.UKSouth"
  }

}
loganalytics_workspace ={
     uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
  } 
  us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
  } 
  
}
appservice_plan = {
   uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       asp_tier = "PremiumV3"
       asp_size = "P2v3"
       asp_capacity = "1"
    }
    us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       asp_tier = "PremiumV3"
       asp_size = "P2v3"
       asp_capacity = "4"
  } 
}

appservice = {
   uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
  } 
}

storage_account_logs = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       account_tier="Standard"
       replication_type="RAGRS"
  } 
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       account_tier="Standard"
       replication_type="RAGRS"
  } 
}
storage_account_data = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       account_tier="Standard"
       replication_type="RAGRS"
  } 
   us = {
       region  = "us",
       location = "eastus"
       location_acronym = "use"
       account_tier="Standard"
       replication_type="RAGRS"
  }
}
storage_account_vmlogs = {
     uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       account_tier="Standard"
       replication_type="RAGRS"
  } 
   us = {
       region  = "us",
       location = "eastus"
       location_acronym = "use"
       account_tier="Standard"
       replication_type="RAGRS"
  } 
}
storage_account_functionapp = {
     uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       account_tier="Standard"
       replication_type="RAGRS"
  } 
   us = {
       region  = "us",
       location = "eastus"
       location_acronym = "use"
       account_tier="Standard"
       replication_type="RAGRS"
  } 
}


key_vault={
   uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
  } 
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
  } 
}
sql_server_prod = {
  
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
  }  
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
  } 
}
sql_server_stage = {

  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
  }  
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
  } 
}
sql_server_app = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
  } 
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
  }  
}
sql_server_prod_elp = {
  
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       sql_elastic_pool_max_size                           = "1536"
      sqlelasticpool_sku_name                             = "GP_Gen5"
      sqlelasticpool_sku_tier                             = "GeneralPurpose"
    sqlelasticpool_sku_family                           = "Gen5"
    sqlelasticpool_sku_capacity                         = "12"
    sqlelasticpool_min_capacity                         = "0"
    sqlelasticpool_max_capacity                         = "8"
  }  
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        sql_elastic_pool_max_size                           = "1536"
    sqlelasticpool_sku_name                             = "GP_Gen5"
    sqlelasticpool_sku_tier                             = "GeneralPurpose"
    sqlelasticpool_sku_family                           = "Gen5"
    sqlelasticpool_sku_capacity                         = "12"
    sqlelasticpool_min_capacity                         = "0"
    sqlelasticpool_max_capacity                         = "8"
  } 
}
sql_server_stage_elp = {

  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       sql_elastic_pool_max_size                           = "1536"
    sqlelasticpool_sku_name                             = "GP_Gen5"
    sqlelasticpool_sku_tier                             = "GeneralPurpose"
    sqlelasticpool_sku_family                           = "Gen5"
    sqlelasticpool_sku_capacity                         = "12"
    sqlelasticpool_min_capacity                         = "0"
    sqlelasticpool_max_capacity                         = "8"
  }  
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        sql_elastic_pool_max_size                           = "1536"
    sqlelasticpool_sku_name                             = "GP_Gen5"
    sqlelasticpool_sku_tier                             = "GeneralPurpose"
    sqlelasticpool_sku_family                           = "Gen5"
    sqlelasticpool_sku_capacity                         = "12"
    sqlelasticpool_min_capacity                         = "0"
    sqlelasticpool_max_capacity                         = "8"
  } 
}
sql_server_app_elp = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       sql_elastic_pool_max_size                           = "1536"
    sqlelasticpool_sku_name                             = "GP_Gen5"
    sqlelasticpool_sku_tier                             = "GeneralPurpose"
    sqlelasticpool_sku_family                           = "Gen5"
    sqlelasticpool_sku_capacity                         = "12"
    sqlelasticpool_min_capacity                         = "0"
    sqlelasticpool_max_capacity                         = "8"
  }  
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        sql_elastic_pool_max_size                           = "1536"
    sqlelasticpool_sku_name                             = "GP_Gen5"
    sqlelasticpool_sku_tier                             = "GeneralPurpose"
    sqlelasticpool_sku_family                           = "Gen5"
    sqlelasticpool_sku_capacity                         = "12"
    sqlelasticpool_min_capacity                         = "0"
    sqlelasticpool_max_capacity                         = "8"
  } 
}
network_security_group={
   uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       KPMG_On-Premise  = "158.180.192.10/32"
       KPMG_VPN = ["158.180.192.14/32","158.180.128.10/32","158.180.192.10/32","158.179.64.12/32","158.179.64.41/32","158.179.64.42/32","158.179.64.43/32","158.179.64.44/32","158.179.64.45/32","158.179.64.46/32","158.179.64.83/32","158.179.64.84/32","20.49.227.56/32"]
       KGS_Bangalore = ["103.133.112.80/28","103.58.118.80/28","103.216.201.0/24"]
       AZFW_PIP      = ["52.190.37.51/32","52.190.37.75/32","52.146.53.140/32","52.146.53.139/32","52.146.53.16/32"]
  } 
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       KPMG_On-Premise  = "199.207.253.0/24"
       KPMG_VPN = ["199.206.0.5/32", "54.173.33.56/32"]
       KGS_Bangalore = ["103.133.112.80/28","103.58.118.80/28","103.216.201.0/24"]
       AZFW_PIP      = ["52.190.37.51/32","52.190.37.75/32","52.146.53.140/32","52.146.53.139/32","52.146.53.16/32"]
  } 
}
application_vnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.51.74.0/24"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.51.73.0/24"]
  } 
}
agw_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.51.74.64/28"]
    }
       us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.51.73.64/28"]
  }
}
wst_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.51.74.0/27"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.51.73.0/27"]
  } 
}
db_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.51.74.96/28"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
         address_space = ["10.51.73.96/28"]
  }  
}

appsrv_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.51.74.80/28"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.51.73.80/28"]
  } 
}
pep_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.51.74.32/27"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        address_space = ["10.51.73.32/27"]
  } 
}
ssis_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.51.74.112/28"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        address_space = ["10.51.73.112/28"]
  } 
}
pbi_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.51.74.128/28"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        address_space = ["10.51.73.128/28"]
  } 
}
vnetint_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.51.74.144/28"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.51.73.144/28"]
  } 
}
public_ip = {
   uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
  }  
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
  } 
}
analysisservice = {
     uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
        sku= "S0"
       ipv4_firewall_rules           = [
    
    {
        name       = "AzureFirewallPIP1",
        ip         = "52.190.37.51"
    },
    {
        name       = "AzureFirewallPIP2",
        ip         = "52.190.37.75"
    },
    {
        name       = "AzureFirewallPIP3",
        ip         = "52.146.53.140"
    },
    {
        name       = "AzureFirewallPIP4",
        ip         = "52.146.53.139"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "52.146.53.16"
    },
     {
        name       = "AzureFirewallPIP4",
        ip         = "52.146.53.139"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "52.146.53.16"
    },
    {
        name       = "ADF_SSIS_IR_PIP1",
        ip         = "20.90.64.70"
    },
    {
        name       = "ADF_SSIS_IR_PIP2",
        ip         = "20.90.64.103"
    }

       ]
  }  
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        sku= "S1"
       ipv4_firewall_rules           = [
    
    {
        name       = "AzureFirewallPIP1",
        ip         = "52.190.37.51"
    },
    {
        name       = "AzureFirewallPIP2",
        ip         = "52.190.37.75"
    },
    {
        name       = "AzureFirewallPIP3",
        ip         = "52.146.53.140"
    },
    {
        name       = "AzureFirewallPIP4",
        ip         = "52.146.53.139"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "52.146.53.16"
    },
     {
        name       = "AzureFirewallPIP4",
        ip         = "52.146.53.139"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "52.146.53.16"
    },
    {
        name       = "ADF_SSIS_IR_PIP1",
        ip         = "52.151.218.130"
    },
    {
        name       = "ADF_SSIS_IR_PIP2",
        ip         = "52.151.218.147"
    }
       ]
  } 
}
application_gateway = {
    uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       hostname = "spipaasrepgenrestukdev.kpmgcloudops.com"
       sslcert = "spipaasrepgenrestukdev.kpmgcloudops.com.cer"
       sslcertpfx = "spipaasrepgenrestukdev.kpmgcloudops.com.pfx"
  } 
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       hostname = "spipaasrepgenrestusdev.kpmgcloudops.com"
         sslcert = "spipaasrepgenrestusdev.kpmgcloudops.com.cer"
       sslcertpfx = "spipaasrepgenrestusdev.kpmgcloudops.com.pfx"
  } 
}
wstn_vm = {
  
}
pbi_vm = {
  
}
 data_disk_1_override = {
      create_option = "Empty"
      managed_disk_type = "Standard_LRS"
      disk_size_gb = 512
  }
  data_disk_2_override = {
      create_option = "Empty"
      managed_disk_type = "Standard_LRS"
      disk_size_gb = 512
  }