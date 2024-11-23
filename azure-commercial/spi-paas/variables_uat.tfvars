client_id           						           = "9975dc86-7489-483c-b49c-47bdff5e2eb8"
subscription_id                             = "b75fc3c3-04a4-45a6-b126-8279f505e873"
tenant_id                                   = "b5031e57-d76f-422e-87c6-02b4cc749974"
client_secret                               = ""

#environment specific variables
location                                     ="eastus"
vm_location                                  = "uk"
location_acronym						                 = "use"
location_acronym_uk						               = "uks"
application_region                           = "central"
environment                                  = "uat"
environment_acronym						               = "uat"
Storage_environment_acronym						       = "ut"
application_acronym                          = "spipaas"
application_name                             = "spipaas"
application_type                             = "app"
app_url_acronym                              = "uat"
environment_acronym_agw                      = "uat"
os_letter                                    = "w"
tags =  {
    Platform                = "Azure Commercial Cloud"
    Environment             = "uat"
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

app_gateway_environment_acronym             = "uat"
appgateway_sku                              ="WAF_Medium"
spipaasctrapp                               = "spipaasuat"
spipaasrestctrapp                           = "spipaasrestuat"

/***Self Signed Certificate*****/
selfsigncertname                            = "star_kpmgcloudops_com"
spipaaswebappsslcert                        = "spipaasuat.kpmgcloudops.com.cer"
spipaasrestsslcert                          = "spipaasrestuat.kpmgcloudops.com.cer"
spipaasctrsslcertpfx                        = "spipaasuat.kpmgcloudops.com.pfx"
spipaasrestctrsslcertpfx                    = "spipaasrestuat.kpmgcloudops.com.pfx"
azfirewall_ip_address                       = "10.100.2.196"

# app service plan
asp_tier                                   = "PremiumV3"
asp_size                                   = "P2v3"
asp_capacity                               = "1"


webappbackup_container_name                = "webappbackup"
sqlserveradmin_password                    = ""
vm_admin_password                          = ""

#service principal
encryptapp_service_principal_name           = "DiskEncryptApp"
backupmanagement_service_principal_name     = "Backup Management Service"
cloudops_keyvault_admin_group_name          = "CO-Certificate-KeyVault"
client_keyvault_admin_group_name            = "CO-DA-KeyVault-Admins"

#rest application id
rest_app_id                                 = "9240d913-1aa0-4fa5-b7e6-216335ad9756"

spipaasvnet_address_space_ctr               = ["10.51.72.0/24"]
dns_server                                  = ["10.30.15.196","10.30.15.197"]
subnet_address_space_ctrappgw               = "10.51.72.64/28" 
subnet_address_space_ctrapp1                = "10.51.72.80/28"
subnet_address_space_ctrpe1                 = "10.51.72.32/27"
subnet_address_space_ctrdb1                 = "10.51.72.96/28"
subnet_address_space_ctrwst1                = "10.51.72.0/27"
subnet_address_space_ctradf1                = "10.51.72.112/28"
subnet_address_space_webapp1                = "10.51.72.128/28"


#Virtual Network Peering
coresubscriptionid                                  = "4c9dc048-01dc-4854-9063-8a3d4060993a"
newcoresubscriptionid                               = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
corevnetresourcegroup                               = "CO-P-eastus-hubvnet-rg"
newcorevnetresourcegroup                            = "RGP-USE-COREVNET-UAT"
corevnetname                                        = "CO-P-eastus-hub-vnet"
newcorevnetname                                     = "vnt-use-core-uat"
corepvtdnsresourcegroup                             = "RGP-USE-CORE-PRIVATE-DNSZONE-PD"

coreinfrasubnetid                                   ="/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-infra1-uat"
core_aks_subnet_id                                  = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-core-aks-uat"

#SPI APP Subnet 
spivnetresourcegroup                                = "RGP-USE-SPI-VNET-UAT"
spiappvnetname                                      = "vnt-use-spi-uat"
spiappsubnetname                                    = "sub-use-spi-app-uat"

spipaas_fqdn                                          = ["spipaasuat.azurewebsites.net"]
spipaasrest_fqdn                                      = ["spipaasrestuat.azurewebsites.net"]

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
AZFW_PIP      = ["52.170.175.39/32","52.170.174.246/32","52.188.26.32/32","52.188.27.2/32","52.188.26.99/32"]
agw1_subnet_adress_space_central           = "10.51.72.64/28"
agw1_subnet_adress_space_us           = "10.51.73.64/28"
KPMG_VPN_BR =["177.69.198.21/32","201.76.177.20/32","201.76.177.30/32","201.76.177.25/32","187.16.120.222/32","177.69.198.30/32","177.69.198.32/32","177.69.198.41/32","177.69.198.44/32"]
KPMG_VPN_CN =["72.142.87.71/32","72.142.49.77/32","204.50.172.132/32","204.50.15.4/32","99.229.128.42/32"]
KPMG_VPN_AU =["203.30.92.0/22"]
KIP_ASE_PIP = "13.68.253.81/32"
pip_count                           ="2"



analysis_services_admins_groupname                      = "CO-SPIPAAS-ANALYSISSERVERADMINS-UAT"

tenantfqdn                                          = "kpmgusadvcloudops.onmicrosoft.com"

#Private DNS
pvt_dns_subscription_id            = "4c9dc048-01dc-4854-9063-8a3d4060993a"
pvt_dns_resource_group             = "rgp-use-core-private-dnszone-pd"
pvt_dns_environment_acronym        = "pd"



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
       asp_capacity = "1"
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
       AZFW_PIP      = ["52.170.175.39/32","52.170.174.246/32","52.188.26.32/32","52.188.27.2/32","52.188.26.99/32"]
  } 
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       KPMG_On-Premise  = "199.207.253.0/24"
       KPMG_VPN = ["199.206.0.5/32", "54.173.33.56/32"]
       KGS_Bangalore = ["103.133.112.80/28","103.58.118.0/24","103.216.201.0/24"]
       AZFW_PIP      = ["52.170.175.39/32","52.170.174.246/32","52.188.26.32/32","52.188.27.2/32","52.188.26.99/32"]
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
        ip         = "52.170.175.39"
    },
    {
        name       = "AzureFirewallPIP2",
        ip         = "52.170.174.246"
    },
    {
        name       = "AzureFirewallPIP3",
        ip         = "52.188.26.32"
    },
    {
        name       = "AzureFirewallPIP4",
        ip         = "52.188.27.2"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "52.188.26.99"
    },
     {
        name       = "ADF_SSIS_IR_PIP1",
        ip         = "20.90.139.71"
    },
    {
        name       = "ADF_SSIS_IR_PIP2",
        ip         = "20.90.136.242"
    }
]
  }  
   us = {
       region  = "us"
       location = "eastus"
        sku= "S0"
       location_acronym = "use"
       ipv4_firewall_rules           = [
    
    {
        name       = "AzureFirewallPIP1",
        ip         = "52.170.175.39"
    },
    {
        name       = "AzureFirewallPIP2",
        ip         = "52.170.174.246"
    },
    {
        name       = "AzureFirewallPIP3",
        ip         = "52.188.26.32"
    },
    {
        name       = "AzureFirewallPIP4",
        ip         = "52.188.27.2"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "52.188.26.99"
    },
     {
        name       = "ADF_SSIS_IR_PIP1",
        ip         = "20.124.141.20"
    },
    {
        name       = "ADF_SSIS_IR_PIP2",
        ip         = "20.124.141.30"
    }
]
  } 
}
application_gateway = {
    uk = {
       region  = "uk",
       location = "uksouth"
       location_acronym = "uks"
       hostname = "spipaasrepgenrestukuat.kpmgcloudops.com"
       sslcert = "spipaasrepgenrestukuat.kpmgcloudops.com.cer"
       sslcertpfx = "spipaasrepgenrestukuat.kpmgcloudops.com.pfx"
  } 
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       hostname = "spipaasrepgenrestusuat.kpmgcloudops.com"
         sslcert = "spipaasrepgenrestusuat.kpmgcloudops.com.cer"
       sslcertpfx = "spipaasrepgenrestusuat.kpmgcloudops.com.pfx"
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