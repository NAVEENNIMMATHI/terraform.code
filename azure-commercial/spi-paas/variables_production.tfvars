client_id           						           = "b2967f11-d801-4812-b532-3f3a676e8b46"
subscription_id                             = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
tenant_id                                   = "b5031e57-d76f-422e-87c6-02b4cc749974"
client_secret                               = ""

#environment specific variables
location                                     ="eastus"
vm_location                                  = "us"
location_acronym						                  = "use"
location_acronym_uk						                = "uks"
application_region                           = "central"
environment                                  = "pd"
environment_acronym						                = "pd"
Storage_environment_acronym                  = "pd"
application_acronym                          = "spipaas"
application_name                             = "spigo"
application_type                             = "app"
app_url_acronym                              = ""
environment_acronym_agw                      = "pd"
os_letter                                    = ""

tags =  {
    Platform                = "Azure Commercial Cloud"
    Environment             = "production"
    Node                    = "Spoke"
    Solution                = "Strategic Profitability Insights (SPI)"
    TechnicalOwner          = "Roopesh Palankar"
    TechnicalContact        = "roopeshpalankar@kpmg.com"
    BusinessOwner           = "Adam S Werner"
    BusinessContact         = "adamwerner@kpmg.com"
    LOB                     = "Deal Advisory & Strategy"
    Datadog                 = "Monitored"
}

is_hns_enabled                              = "true"
account_tier                                = "Standard"
account_tier2                               = "Premium"
account_kind                                = "FileStorage"
replication_type                            = "LRS"
replication_type2                           = "ZRS"

app_gateway_environment_acronym             = ""
appgateway_sku                              ="WAF_Medium"
spipaasctrapp                               = "spigo"
spipaasrestctrapp                           = "spigorest"

/***Self Signed Certificate*****/
selfsigncertname                            = "star_kpmgcloudops_com"
spipaaswebappsslcert                        = "spigo.kpmgcloudops.com.cer"
spipaasrestsslcert                          = "spigorest.kpmgcloudops.com.cer"
spipaasctrsslcertpfx                        = "spigo.kpmgcloudops.com.pfx"
spipaasrestctrsslcertpfx                    = "spigorest.kpmgcloudops.com.pfx"
azfirewall_ip_address                       = "10.30.3.4"

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
rest_app_id                                 = "87af73dd-7843-485c-8eaf-e657fd76c895"


spipaasvnet_address_space_ctr               = ["10.91.72.0/24"]
dns_server                                  = ["10.30.15.196","10.30.15.197"]
subnet_address_space_ctrappgw               = "10.91.72.64/28" 
subnet_address_space_ctrapp1                = "10.91.72.80/28"
subnet_address_space_ctrpe1                 = "10.91.72.32/27"
subnet_address_space_ctrdb1                 = "10.91.72.96/28"
subnet_address_space_ctrwst1                = "10.91.72.0/27"
subnet_address_space_ctradf1                = "10.91.72.112/28"
subnet_address_space_webapp1                = "10.91.72.128/28"


#Virtual Network Peering
coresubscriptionid                                  = "4c9dc048-01dc-4854-9063-8a3d4060993a"
newcoresubscriptionid                               = "0d7a7f3c-a15d-4d37-924c-2507147fb74c"
corevnetresourcegroup                               = "CO-P-eastus-hubvnet-rg"
newcorevnetresourcegroup                            = "CO-P-eastus-transitvnet-rg"
corevnetname                                        = "CO-P-eastus-hub-vnet"
newcorevnetname                                     = "CO-P-eastus-transit-vnet"
corepvtdnsresourcegroup                             = "RGP-USE-CORE-PRIVATE-DNSZONE-PD"

coreinfrasubnetid                                   ="/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
core_aks_subnet_id                                  = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"

#SPI APP Subnet 
spivnetresourcegroup                                = "CO-P-eastus-cospivnet-rg"
spiappvnetname                                      = "CO-P-eastus-spi-vnet"
spiappsubnetname                                    = "co-p-eastus-spiapp1-subnet"

spipaas_fqdn                                          = ["spigo.azurewebsites.net"]
spipaasrest_fqdn                                      = ["spigorest.azurewebsites.net"]

count_value_spipaascentral                      = "01"
count_value_spipaaspbi                          = "01"
count_value_spipaaspbi_uk                       = "0"
count_value_spipaasukwst                        = "0"
vm_size_spipaaswst                              = "Standard_D16s_v3"
data_disk_size_spipaaswst                        = "512"
data_disk_size_spipaaspbi                       = "512"
vm_size_pbi                                     = "Standard_D4s_v3"


KPMG_On-Premise                            = "199.207.253.0/24"
KPMG_VPN_US                                = ["199.206.0.5/32", "54.173.33.56/32"]
KPMG_VPN_UK                                = ["158.180.192.10/32","158.180.192.14/32","158.180.128.10/32","158.180.192.10/32","158.179.64.12/32","158.179.64.41/32","158.179.64.42/32","158.179.64.43/32","158.179.64.44/32","158.179.64.45/32","158.179.64.46/32","158.179.64.83/32","158.179.64.84/32","20.49.227.56/32"]
KGS_Bangalore                              = ["103.133.112.80/28","103.58.118.0/24"]
AZFW_PIP      = ["52.224.25.180/32","52.224.25.158/32","52.224.25.140/32","20.42.39.126/32","52.224.25.167/32"]
agw1_subnet_adress_space_central           = "10.91.73.64/28"
agw1_subnet_adress_space_us           = "10.91.73.64/28"
KPMG_VPN_BR =["177.69.198.21/32","201.76.177.22/32","201.76.177.20/32","201.76.177.30/32","201.76.177.25/32","187.16.120.222/32","177.69.198.30/32","177.69.198.32/32","177.69.198.41/32","177.69.198.44/32","177.69.198.70/32","177.69.198.31/32"]
KPMG_VPN_CN =["72.142.87.71/32","72.142.49.77/32","204.50.172.132/32","204.50.15.4/32","99.229.128.42/32"]
KPMG_VPN_AU =["163.116.192.118/32","203.30.92.0/22","14.203.69.1/32","14.203.69.2/32","14.203.69.13/32","14.203.69.14/32","14.203.69.25/32","14.203.69.26/32"]
KIP_ASE_PIP = "104.211.19.220/32"
pip_count                           ="2"



analysis_services_admins_groupname                      = "CO-SPIPAAS-ANALYSISSERVERADMINS-PD"

tenantfqdn                                          = "kpmgusadvcloudops.onmicrosoft.com"

#Private DNS
pvt_dns_subscription_id            = "4c9dc048-01dc-4854-9063-8a3d4060993a"
pvt_dns_resource_group             = "rgp-use-core-private-dnszone-pd"
pvt_dns_environment_acronym        = "pd"



# region application variables 
application_rg = {
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       batchmanagementname="BatchNodeManagement.EastUS"
  } 
   br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
  }
   au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
  }


}
loganalytics_workspace ={
   
  us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
  }
   au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
  }
  
}
appservice_plan = {
   
    us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       asp_tier = "PremiumV3"
       asp_size = "P2v3"
       asp_capacity = "8"
  } 
   br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       asp_tier = "PremiumV3"
       asp_size = "P2v3"
       asp_capacity = "2"
  }
   au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
        asp_tier = "PremiumV3"
       asp_size = "P2v3"
       asp_capacity = "2"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       asp_tier = "PremiumV3"
       asp_size = "P2v3"
       asp_capacity = "2"
  }
}

appservice = {
   
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
  } 
   br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
  }
  au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
  }
}

storage_account_logs = {
  
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       account_tier="Standard"
       replication_type="RAGRS"
  } 
   br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       account_tier="Standard"
       replication_type="RAGRS"
  }
  au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       account_tier="Standard"
       replication_type="RAGRS"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       account_tier="Standard"
       replication_type="RAGRS"
  }
}
storage_account_data = {
  
   us = {
       region  = "us",
       location = "eastus"
       location_acronym = "use"
       account_tier="Standard"
       replication_type="RAGRS"
  }
   br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       account_tier="Standard"
       replication_type="RAGRS"
  }
  au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       account_tier="Standard"
       replication_type="RAGRS"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       account_tier="Standard"
       replication_type="RAGRS"
  }
}
storage_account_vmlogs = {
     
   us = {
       region  = "us",
       location = "eastus"
       location_acronym = "use"
       account_tier="Standard"
       replication_type="RAGRS"
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       account_tier="Standard"
       replication_type="RAGRS"
  }
  au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       account_tier="Standard"
       replication_type="RAGRS"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       account_tier="Standard"
       replication_type="RAGRS"
  }
}
storage_account_functionapp = { 
   us = {
       region  = "us",
       location = "eastus"
       location_acronym = "use"
       account_tier="Standard"
       replication_type="RAGRS"
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       account_tier="Standard"
       replication_type="RAGRS"
  }
  au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       account_tier="Standard"
       replication_type="RAGRS"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       account_tier="Standard"
       replication_type="RAGRS"
  }
}


key_vault={
 
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
  }
  au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
  }
}
sql_server_prod = {
    
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
  }
  au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
  }

}
sql_server_stage = {
  
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
  }
  au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
  }
}
sql_server_app = {
   
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
  }  
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
  }
  au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
  }
}
sql_server_prod_elp = {
    
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        sql_elastic_pool_max_size                           = "4096"
    sqlelasticpool_sku_name                             = "GP_Gen5"
    sqlelasticpool_sku_tier                             = "GeneralPurpose"
    sqlelasticpool_sku_family                           = "Gen5"
    sqlelasticpool_sku_capacity                         = "40"
    sqlelasticpool_min_capacity                         = "0"
    sqlelasticpool_max_capacity                         = "16"
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       sql_elastic_pool_max_size                           = "1536"
       sqlelasticpool_sku_name                             = "GP_Gen5"
       sqlelasticpool_sku_tier                             = "GeneralPurpose"
       sqlelasticpool_sku_family                           = "Gen5"
       sqlelasticpool_sku_capacity                         = "12"
      sqlelasticpool_min_capacity                         = "0"
      sqlelasticpool_max_capacity                         = "8"
  }
  au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       sql_elastic_pool_max_size                           = "1536"
       sqlelasticpool_sku_name                             = "GP_Gen5"
       sqlelasticpool_sku_tier                             = "GeneralPurpose"
       sqlelasticpool_sku_family                           = "Gen5"
       sqlelasticpool_sku_capacity                         = "12"
      sqlelasticpool_min_capacity                         = "0"
      sqlelasticpool_max_capacity                         = "8"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
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
  
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        sql_elastic_pool_max_size                           = "4096"
    sqlelasticpool_sku_name                             = "GP_Gen5"
    sqlelasticpool_sku_tier                             = "GeneralPurpose"
    sqlelasticpool_sku_family                           = "Gen5"
    sqlelasticpool_sku_capacity                         = "80"
    sqlelasticpool_min_capacity                         = "0"
    sqlelasticpool_max_capacity                         = "16"
  } 
   br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       sql_elastic_pool_max_size                           = "2048"
      sqlelasticpool_sku_name                             = "GP_Gen5"
      sqlelasticpool_sku_tier                             = "GeneralPurpose"
      sqlelasticpool_sku_family                           = "Gen5"
      sqlelasticpool_sku_capacity                         = "16"
      sqlelasticpool_min_capacity                         = "0"
      sqlelasticpool_max_capacity                         = "8"
  }
  au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
      sql_elastic_pool_max_size                           = "2048"
      sqlelasticpool_sku_name                             = "GP_Gen5"
      sqlelasticpool_sku_tier                             = "GeneralPurpose"
      sqlelasticpool_sku_family                           = "Gen5"
      sqlelasticpool_sku_capacity                         = "16"
      sqlelasticpool_min_capacity                         = "0"
      sqlelasticpool_max_capacity                         = "8"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
      sql_elastic_pool_max_size                           = "2048"
      sqlelasticpool_sku_name                             = "GP_Gen5"
      sqlelasticpool_sku_tier                             = "GeneralPurpose"
      sqlelasticpool_sku_family                           = "Gen5"
      sqlelasticpool_sku_capacity                         = "16"
      sqlelasticpool_min_capacity                         = "0"
      sqlelasticpool_max_capacity                         = "8"
  }
}
sql_server_app_elp = {
   
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
   br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       sql_elastic_pool_max_size                           = "1536"
       sqlelasticpool_sku_name                             = "GP_Gen5"
       sqlelasticpool_sku_tier                             = "GeneralPurpose"
       sqlelasticpool_sku_family                           = "Gen5"
       sqlelasticpool_sku_capacity                         = "12"
      sqlelasticpool_min_capacity                         = "0"
      sqlelasticpool_max_capacity                         = "8"
  }
   au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       sql_elastic_pool_max_size                           = "1536"
       sqlelasticpool_sku_name                             = "GP_Gen5"
       sqlelasticpool_sku_tier                             = "GeneralPurpose"
       sqlelasticpool_sku_family                           = "Gen5"
       sqlelasticpool_sku_capacity                         = "12"
      sqlelasticpool_min_capacity                         = "0"
      sqlelasticpool_max_capacity                         = "8"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
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
   
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       KPMG_On-Premise  = "199.207.253.0/24"
       KPMG_VPN = ["199.206.0.5/32", "54.173.33.56/32"]
       KGS_Bangalore = ["103.133.112.80/28","103.58.118.0/24","103.216.201.0/24"]
       AZFW_PIP      = ["52.224.25.180/32","52.224.25.158/32","52.224.25.140/32","20.42.39.126/32","52.224.25.167/32"]
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       KPMG_On-Premise  = "177.69.198.21/32"
       KPMG_VPN = ["177.69.198.70/32","201.76.177.22/32","201.76.177.20/32","201.76.177.30/32","201.76.177.25/32","187.16.120.222/32","177.69.198.30/32","177.69.198.32/32","177.69.198.41/32","177.69.198.44/32"]
       KGS_Bangalore = ["103.133.112.80/28","103.58.118.80/28"]
       AZFW_PIP      = ["52.224.25.180/32","52.224.25.158/32","52.224.25.140/32","20.42.39.126/32","52.224.25.167/32"]
  }
   au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       KPMG_On-Premise  = "163.116.192.118/32"
       KPMG_VPN = ["163.116.192.118/32"]
       KGS_Bangalore = ["103.133.112.80/28","103.58.118.80/28"]
       AZFW_PIP      = ["52.224.25.180/32","52.224.25.158/32","52.224.25.140/32","20.42.39.126/32","52.224.25.167/32"]
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       KPMG_On-Premise  = "72.142.87.71/32"
       KPMG_VPN = ["72.142.49.77/32","204.50.172.132/32","204.50.15.4/32","99.229.128.42/32"]
       KGS_Bangalore = ["103.133.112.80/28","103.58.118.80/28"]
       AZFW_PIP      = ["52.224.25.180/32","52.224.25.158/32","52.224.25.140/32","20.42.39.126/32","52.224.25.167/32"]
  }
}
application_vnet = {
 
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.91.73.0/24"]
  } 
   br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       address_space = ["10.91.74.0/24"]
   }
  au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       address_space = ["10.91.75.0/24"]
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       address_space = ["10.91.76.0/24"]
  }
}
agw_subnet = {
  
       us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.91.73.64/28"]
  }
   br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       address_space = ["10.91.74.64/28"]
   }
    au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       address_space = ["10.91.75.64/28"]
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       address_space = ["10.91.76.64/28"]
  }
}
wst_subnet = {
  
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.91.73.0/27"]
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       address_space = ["10.91.74.0/27"]
   }
    au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       address_space = ["10.91.75.0/27"]
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       address_space = ["10.91.76.0/27"]
  }
}
db_subnet = {
  
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
         address_space = ["10.91.73.96/28"]
  }  
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       address_space = ["10.91.74.96/28"]
   }
    au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       address_space = ["10.91.75.96/28"]
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       address_space = ["10.91.76.96/28"]
  }
}

appsrv_subnet = {
  
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.91.73.80/28"]
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       address_space = ["10.91.74.80/28"]
   }
    au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       address_space = ["10.91.75.80/28"]
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       address_space = ["10.91.76.80/28"]
  }
}
pep_subnet = {
  
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        address_space = ["10.91.73.32/27"]
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       address_space = ["10.91.74.32/27"]
   }
    au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
        address_space = ["10.91.75.32/27"]
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
        address_space = ["10.91.76.32/27"]
  }
}
ssis_subnet = {
  
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        address_space = ["10.91.73.112/28"]
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       address_space = ["10.91.74.112/28"]
   }
    au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
        address_space = ["10.91.75.112/28"]
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
        address_space = ["10.91.76.112/28"]
  }
}
pbi_subnet = {
  
     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
        address_space = ["10.91.73.128/28"]
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       address_space = ["10.91.74.128/28"]
   }
    au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
        address_space = ["10.91.75.128/28"]
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
        address_space = ["10.91.76.128/28"]
  }
}
vnetint_subnet = {

     us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       address_space = ["10.91.73.144/28"]
  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       address_space = ["10.91.74.144/28"]
   }
    au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       address_space = ["10.91.75.144/28"]
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       address_space = ["10.91.76.144/28"]
  }
}
public_ip = {
    
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
  }
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
   } 
    au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
  }
}
analysisservice = {
    
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       sku= "S4"
       ipv4_firewall_rules           = [
    
    {
        name       = "AzureFirewallPIP1",
        ip         = "52.224.25.180"
    },
    {
        name       = "AzureFirewallPIP2",
        ip         = "52.224.25.158"
    },
    {
        name       = "AzureFirewallPIP3",
        ip         = "52.224.25.140"
    },
    {
        name       = "AzureFirewallPIP4",
        ip         = "20.42.39.126"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "52.224.25.167"
    },
    {
        name       = "ADF_SSIS_IR_PIP1",
        ip         = "20.121.253.91"
    },
    {
        name       = "ADF_SSIS_IR_PIP2",
        ip         = "20.121.253.32"
    },
    {
        name       = "PaloAlto1",
        ip         = "20.185.106.126"
    },
    {
        name       = "PaloAlto2",
        ip         = "20.185.110.197"
    }
]

  } 
  br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       sku= "S1"
       ipv4_firewall_rules           = [
    
    {
        name       = "AzureFirewallPIP1",
        ip         = "52.224.25.180"
    },
    {
        name       = "AzureFirewallPIP2",
        ip         = "52.224.25.158"
    },
    {
        name       = "AzureFirewallPIP3",
        ip         = "52.224.25.140"
    },
    {
        name       = "AzureFirewallPIP4",
        ip         = "20.42.39.126"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "52.224.25.167"
    },
    {
        name       = "ADF_SSIS_IR_PIP1",
        ip         = "191.235.45.243"
    },
    {
        name       = "ADF_SSIS_IR_PIP2",
        ip         = "4.228.28.88"
    },
    {
        name       = "PaloAlto1",
        ip         = "20.185.106.126"
    },
    {
        name       = "PaloAlto2",
        ip         = "20.185.110.197"
    }
]

  } 
  au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       sku= "S1"
       ipv4_firewall_rules           = [
    
    {
        name       = "AzureFirewallPIP1",
        ip         = "52.224.25.180"
    },
    {
        name       = "AzureFirewallPIP2",
        ip         = "52.224.25.158"
    },
    {
        name       = "AzureFirewallPIP3",
        ip         = "52.224.25.140"
    },
    {
        name       = "AzureFirewallPIP4",
        ip         = "20.42.39.126"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "52.224.25.167"
    },
    {
        name       = "ADF_SSIS_IR_PIP1",
        ip         = "4.237.8.1"
    },
    {
        name       = "ADF_SSIS_IR_PIP2",
        ip         = "4.237.8.12"
    },
    {
        name       = "PaloAlto1",
        ip         = "20.185.106.126"
    },
    {
        name       = "PaloAlto2",
        ip         = "20.185.110.197"
    }
]

  } 
   cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       sku= "S2"
       ipv4_firewall_rules           = [
    
    {
        name       = "AzureFirewallPIP1",
        ip         = "52.224.25.180"
    },
    {
        name       = "AzureFirewallPIP2",
        ip         = "52.224.25.158"
    },
    {
        name       = "AzureFirewallPIP3",
        ip         = "52.224.25.140"
    },
    {
        name       = "AzureFirewallPIP4",
        ip         = "20.42.39.126"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "52.224.25.167"
    },
    {
        name       = "ADF_SSIS_IR_PIP1",
        ip         = "20.175.157.6"
    },
    {
        name       = "ADF_SSIS_IR_PIP2",
        ip         = "20.175.159.250"
    },
    {
        name       = "PaloAlto1",
        ip         = "20.185.106.126"
    },
    {
        name       = "PaloAlto2",
        ip         = "20.185.110.197"
    }
]

  } 
}
application_gateway = {
  
   us = {
       region  = "us"
       location = "eastus"
       location_acronym = "use"
       hostname = "spigorepgenrestus.kpmgcloudops.com"
       sslcert = "spigorepgenrestus.kpmgcloudops.com.cer"
       sslcertpfx = "spigorepgenrestus.kpmgcloudops.com.pfx"
  } 
    br = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       hostname = "spigorepgenrestbr.kpmgcloudops.com"
       sslcert = "spigorepgenrestbr.kpmgcloudops.com.cer"
       sslcertpfx = "spigorepgenrestbr.kpmgcloudops.com.pfx"
  } 
   au = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       hostname = "spigorepgenrestau.kpmgcloudops.com"
       sslcert = "spigorepgenrestau.kpmgcloudops.com.cer"
       sslcertpfx = "spigorepgenrestau.kpmgcloudops.com.pfx"
  }
  cn = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       hostname = "spigorepgenrestca.kpmgcloudops.com"
       sslcert = "spigorepgenrestca.kpmgcloudops.com.cer"
       sslcertpfx = "spigorepgenrestca.kpmgcloudops.com.pfx"
  }
}

wstn_vm = {
  br1 = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       count=1
  }
  au1 = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       count=1
  }
  cn1 = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       count=1
  }
}
pbi_vm = {
  pbibr1 = {
       region  = "br"
       location = "Brazil South"
       location_acronym = "brz"
       count=1
  }
  pbiau1 = {
       region  = "au"
       location = "Australia East"
       location_acronym = "aus"
       count=1
  }
  pbicn1 = {
       region  = "cn"
       location = "Canada Central"
       location_acronym = "cnd"
       count=1
  }
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