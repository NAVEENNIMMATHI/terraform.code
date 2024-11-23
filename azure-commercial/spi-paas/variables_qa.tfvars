client_id           						            = "76ea9629-a4e1-4a9a-ba2f-39840e53342a"
subscription_id                             = "adf88b05-d3d7-4dee-ba30-ea939f9a1b1c"
tenant_id                                   = "188697ab-840f-44ec-8535-aaaa5680bab0"
client_secret                               = ""

#environment specific variables
location                                     ="eastus"
vm_location                                  = "uk"
location_acronym						                 = "use"
location_acronym_uk						               = "uks"
application_region                           = "central"
environment                                  = "qa"
environment_acronym						              = "qa"
Storage_environment_acronym                 = "qa"
application_acronym                          = "spipaas"
application_name                             = "spipaas"
application_type                             = "app"
app_url_acronym                              = "qa"
environment_acronym_agw                      = "qa"
os_letter                                    = "w"
tags =  {
    Platform                = "Azure Commercial Cloud"
    Environment             = "qa"
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

app_gateway_environment_acronym             = "qa"
appgateway_sku                              = "WAF_Medium"
spipaasctrapp                               = "spipaasqa"
spipaasrestctrapp                           = "spipaasrestqa"

/***Self Signed Certificate*****/
selfsigncertname                            = "star_kpmgcloudops_com"
spipaaswebappsslcert                        = "spipaasqa.kpmgcloudops.com.cer"
spipaasrestsslcert                          = "spipaasrestqa.kpmgcloudops.com.cer"
spipaasctrsslcertpfx                        = "spipaasqa.kpmgcloudops.com.pfx"
spipaasrestctrsslcertpfx                    = "spipaasrestqa.kpmgcloudops.com.pfx"
azfirewall_ip_address                       = "10.101.2.196"

# app service plan
asp_tier                                   = "PremiumV3"
asp_size                                   = "P2v3"
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
rest_app_id                                 = "08f397f9-a7ed-4159-b127-fe70db1028a7"

spipaasvnet_address_space_ctr               = ["10.71.40.0/24"]
dns_server                                  = ["10.1.11.4","10.1.11.5"]
subnet_address_space_ctrappgw               = "10.71.40.64/28" 
subnet_address_space_ctrapp1                = "10.71.40.80/28"
subnet_address_space_ctrpe1                 = "10.71.40.32/27"
subnet_address_space_ctrdb1                 = "10.71.40.96/28"
subnet_address_space_ctrwst1                = "10.71.40.0/27"
subnet_address_space_ctradf1                = "10.71.40.112/28"
subnet_address_space_webapp1                = "10.71.40.128/28"

#Virtual Network Peering
coresubscriptionid                                  = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transitsubscriptionid                               = "25f8d797-bee2-4a88-84cc-de328abd6731"
newcoresubscriptionid                               = "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
corevnetresourcegroup                               = "co-np-eastus-core1-rg"
transitvnetresourcegroup                            = "CO-NP-eastus-CONPTVnet-rg"
newcorevnetresourcegroup                            = "RGP-USE-COREVNET-QA"
corevnetname                                        = "co-np-eastus-core1-vnet"
transitvnetname                                     = "CO-NP-eastus-transit1-Vnet"
newcorevnetname                                     = "vnt-use-core-qa"
corepvtdnsresourcegroup                             = "rgp-use-core-private-dnszone-dv"

coreinfrasubnetid                                   = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-infra1-qa"
core_aks_subnet_id                                  = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-core-aks-qa"

#SPI APP Subnet 
spivnetresourcegroup                                = "RGP-USE-SPI-VNET-QA"
spiappvnetname                                      = "vnt-use-spi-qa"
spiappsubnetname                                    = "sub-use-spi-app-qa"

spipaas_fqdn                                          = ["spipaasqa.azurewebsites.net"]
spipaasrest_fqdn                                      = ["spipaasrestqa.azurewebsites.net"]

count_value_spipaascentral                      = "01"
count_value_spipaaspbi                          = "01"
count_value_spipaaspbi_uk                          = "01"
count_value_spipaasukwst                        = "01"
vm_size_spipaaswst                              = "Standard_D16s_v3"
data_disk_size_spipaaswst                        = "512"
data_disk_size_spipaaspbi                       = "512"
vm_size_pbi                                     = "Standard_D4s_v3"


KPMG_On-Premise                            = "199.207.253.0/24"
KPMG_VPN_US                                = ["199.206.0.5/32", "54.173.33.56/32"]
KPMG_VPN_UK                                = ["158.180.192.10/32","158.180.192.14/32","158.180.128.10/32","158.180.192.10/32","158.179.64.12/32","158.179.64.41/32","158.179.64.42/32","158.179.64.43/32","158.179.64.44/32","158.179.64.45/32","158.179.64.46/32","158.179.64.83/32","158.179.64.84/32","20.49.227.56/32"]
KGS_Bangalore                              = ["103.133.112.80/28","103.58.118.0/24"]
AZFW_PIP      = ["40.76.169.86/32","40.76.168.231/32","40.76.169.36/32","40.76.169.44/32","40.76.169.103/32"]
agw1_subnet_adress_space_central           = "10.71.40.64/28"
agw1_subnet_adress_space_us                = "10.71.41.64/28"
KPMG_VPN_BR =["177.69.198.21/32","201.76.177.20/32","201.76.177.30/32","201.76.177.25/32","187.16.120.222/32","177.69.198.30/32","177.69.198.32/32","177.69.198.41/32","177.69.198.44/32"]
KPMG_VPN_CN =["72.142.87.71/32","72.142.49.77/32","204.50.172.132/32","204.50.15.4/32","99.229.128.42/32"]
KPMG_VPN_AU =["203.30.92.0/22"]
KIP_ASE_PIP = "52.147.199.75/32"
pip_count                           ="2"

analysis_services_admins_groupname                      = "CO-SPIPAAS-ANALYSISSERVERADMINS-QA"

tenantfqdn                                          = "kpmgusadvspectrum.onmicrosoft.com"

#Private DNS
pvt_dns_subscription_id            = "c72acede-d539-45d9-963d-3464ec4ddae0"
pvt_dns_resource_group             = "rgp-use-core-private-dnszone-dv"
pvt_dns_environment_acronym        = "qa"


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
       sql_elastic_pool_max_size                        = "756"
      sqlelasticpool_sku_name                           = "GP_Gen5"
      sqlelasticpool_sku_tier                           = "GeneralPurpose"
      sqlelasticpool_sku_family                           = "Gen5"
      sqlelasticpool_sku_capacity                         = "4"
      sqlelasticpool_min_capacity                         = "0"
      sqlelasticpool_max_capacity                         = "4"
  }  
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        sql_elastic_pool_max_size                       = "1536"
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
       sql_elastic_pool_max_size                           = "756"
    sqlelasticpool_sku_name                             = "GP_Gen5"
    sqlelasticpool_sku_tier                             = "GeneralPurpose"
    sqlelasticpool_sku_family                           = "Gen5"
    sqlelasticpool_sku_capacity                         = "4"
    sqlelasticpool_min_capacity                         = "0"
    sqlelasticpool_max_capacity                         = "4"
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
       sql_elastic_pool_max_size                           = "756"
    sqlelasticpool_sku_name                             = "GP_Gen5"
    sqlelasticpool_sku_tier                             = "GeneralPurpose"
    sqlelasticpool_sku_family                           = "Gen5"
    sqlelasticpool_sku_capacity                         = "4"
    sqlelasticpool_min_capacity                         = "0"
    sqlelasticpool_max_capacity                         = "4"
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
       KGS_Bangalore = ["103.133.112.80/28","103.58.118.0/24","103.216.201.0/24"]
       AZFW_PIP      = ["40.76.169.86/32","40.76.168.231/32","40.76.169.36/32","40.76.169.44/32","40.76.169.103/32"]
  } 
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       KPMG_On-Premise  = "199.207.253.0/24"
       KPMG_VPN = ["199.206.0.5/32", "54.173.33.56/32"]
       KGS_Bangalore = ["103.133.112.80/28","103.58.118.0/24","103.216.201.0/24"]
       AZFW_PIP     = ["40.76.169.86/32","40.76.168.231/32","40.76.169.36/32","40.76.169.44/32","40.76.169.103/32"]
  } 
}
application_vnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.71.42.0/24"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.71.41.0/24"]
  } 
}
agw_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.71.42.64/28"]
    }
       us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.71.41.64/28"]
  }
}
wst_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.71.42.0/27"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.71.41.0/27"]
  } 
}
db_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.71.42.96/28"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
         address_space = ["10.71.41.96/28"]
  }  
}

appsrv_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.71.42.80/28"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.71.41.80/28"]
  } 
}
pep_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.71.42.32/27"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        address_space = ["10.71.41.32/27"]
  } 
}
ssis_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.71.42.112/28"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        address_space = ["10.71.41.112/28"]
  } 
}
pbi_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.71.42.128/28"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        address_space = ["10.71.41.128/28"]
  } 
}
vnetint_subnet = {
  uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       address_space = ["10.71.42.144/28"]
    }
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.71.41.144/28"]
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
        ip         = "40.76.169.86"
    },
    {
        name       = "AzureFirewallPIP2",
        ip         = "40.76.168.231"
    },
    {
        name       = "AzureFirewallPIP3",
        ip         = "40.76.169.36"
    },
    {
        name       = "AzureFirewallPIP4",
        ip         = "40.76.169.44"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "40.76.169.103"
    },
    {
        name       = "SSISP2",
        ip         = "20.117.223.82"
    },
    {
        name       = "SSISIP1",
        ip         = "20.117.220.82"
    }
]
  }  
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        sku= "S2"
       ipv4_firewall_rules           = [
    
    {
        name       = "AzureFirewallPIP1",
        ip         = "40.76.169.86"
    },
    {
        name       = "AzureFirewallPIP2",
        ip         = "40.76.168.231"
    },
    {
        name       = "AzureFirewallPIP3",
        ip         = "40.76.169.36"
    },
    {
        name       = "AzureFirewallPIP4",
        ip         = "40.76.169.44"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "40.76.169.103"
    },
    {
        name       = "pip-ssis-use-spipaas2-us-qa",
        ip         = "20.121.93.22"
    },
    {
        name       = "pip-ssis-use-spipaas1-us-qa",
        ip         = "20.121.93.53"
    }
    
]
  } 
}
application_gateway = {
    uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       hostname = "spipaasrepgenrestukqa.kpmgcloudops.com"
       sslcert = "spipaasrepgenrestukqa.kpmgcloudops.com.cer"
       sslcertpfx = "spipaasrepgenrestukqa.kpmgcloudops.com.pfx"
  } 
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       hostname = "spipaasrepgenrestusqa.kpmgcloudops.com"
         sslcert = "spipaasrepgenrestusqa.kpmgcloudops.com.cer"
       sslcertpfx = "spipaasrepgenrestusqa.kpmgcloudops.com.pfx"
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