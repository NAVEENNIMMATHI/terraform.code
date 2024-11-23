resource "azuread_application" "BMPWebApplication" {
  name                         = "BMP WebApplication${upper(var.environment_acronym_ad_app)}"
  homepage                     = "https://bmp${var.environment_acronym_ad_app}.kpmgcloudops.com"
  reply_urls                   = ["https://bmp${var.environment_acronym_ad_app}.kpmgcloudops.com","https://bmp${var.environment_acronym_ad_app}.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}

resource "azuread_service_principal" "BMPWebApplication" {
  application_id               = azuread_application.BMPWebApplication.application_id
  app_role_assignment_required = false

  tags                         = ["WindowsAzureActiveDirectoryIntegratedApp"]
}

resource "azuread_application" "BMPKPIMApplication" {
  name                         = "BMP KPIMApplication${upper(var.environment_acronym_ad_app)}"
  homepage                     = "https://bmpkpim${var.environment_acronym_ad_app}.kpmgcloudops.com"
  reply_urls                   = ["https://bmpkpim${var.environment_acronym_ad_app}.kpmgcloudops.com","https://bmpkpim${var.environment_acronym_ad_app}.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}

resource "azuread_service_principal" "BMPKPIMApplication" {
  application_id               = azuread_application.BMPKPIMApplication.application_id
  app_role_assignment_required = false

  tags                         = ["WindowsAzureActiveDirectoryIntegratedApp"]
}

resource "azuread_application" "BMPRestApplication" {
  name                         = "BMP RestApplication${upper(var.environment_acronym_ad_app)}"
  homepage                     = "https://bmprest${var.environment_acronym_ad_app}.kpmgcloudops.com"
  reply_urls                   = ["https://bmprest${var.environment_acronym_ad_app}.kpmgcloudops.com","https://bmprest${var.environment_acronym_ad_app}.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"

  required_resource_access {
    resource_app_id            = "00000002-0000-0000-c000-000000000000"
    resource_access {
      id                       = "311a71cc-e848-46a1-bdf8-97ff7156d8e6"
      type                     = "Scope"
    }
  }

  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
    resource_access {
      id                       = "62a82d76-70ea-41e2-9197-370581804d09"
      type                     = "Role"
    }
    resource_access {
      id                       = "5b567255-7703-4780-807c-7be8301ae99b"
      type                     = "Role"
    }
    resource_access {
      id                       = "df021288-bdef-4463-88db-98f22de89214"
      type                     = "Role"
    }
    resource_access {
      id                       = "dbaae8cf-10b5-4b86-a4a1-f871c94c6695"
      type                     = "Role"
    }
    resource_access {
      id                       = "bf7b1a76-6e77-406b-b258-bf5c7720e98f"
      type                     = "Role"
    }
  }

  required_resource_access {
    resource_app_id            = "00000009-0000-0000-c000-000000000000"
    resource_access {
      id                       = "f9759906-80a4-4f4a-b010-24b832bc6a30"
      type                     = "Scope"
    }
    resource_access {
      id                       = "ddd37690-e119-40c5-a821-3746ea6125c4"
      type                     = "Scope"
    }
    resource_access {
      id                       = "e677843f-76d8-44d3-bcdb-ec40dea919e7"
      type                     = "Scope"
    }
    resource_access {
      id                       = "27789c5b-aca8-4cb6-94b8-bcc8964dd8ad"
      type                     = "Scope"
    }
    resource_access {
      id                       = "8b01a991-5a5a-47f8-91a2-84d6bfd72c02"
      type                     = "Scope"
    }
    resource_access {
      id                       = "b271f05e-8329-4b97-baa4-91cf15b99cf1"
      type                     = "Scope"
    }
    resource_access {
      id                       = "2448370f-f988-42cd-909c-6528efd67c1a"
      type                     = "Scope"
    }
    resource_access {
      id                       = "7f33e027-4039-419b-938e-2f8ca153e68e"
      type                     = "Scope"
    }
    resource_access {
      id                       = "322b68b2-0804-416e-86a5-d772c567b6e6"
      type                     = "Scope"
    }
    resource_access {
      id                       = "f3076109-ca66-412a-be10-d4ee1be95d47"
      type                     = "Scope"
    }
    resource_access {
      id                       = "4ae1bf56-f562-4747-b7bc-2fa0874ed46f"
      type                     = "Scope"
    }
    resource_access {
      id                       = "7504609f-c495-4c64-8542-686125a5a36f"
      type                     = "Scope"
    }
    resource_access {
      id                       = "ddb3ca45-a192-477d-acb2-46bf9dc586de"
      type                     = "Scope"
    }
    resource_access {
      id                       = "d2e42f6b-2baf-4ff4-83ef-51e66321516e"
      type                     = "Scope"
    }
    resource_access {
      id                       = "445002fb-a6f2-4dc1-a81e-4254a111cd29"
      type                     = "Scope"
    }
    resource_access {
      id                       = "b2f1b2fa-f35c-407c-979c-a858a808ba85"
      type                     = "Scope"
    }
    resource_access {
      id                       = "4eabc3d1-b762-40ff-9da5-0e18fdf11230"
      type                     = "Scope"
    }
    resource_access {
      id                       = "76e2ebd5-0dfb-4a5b-93c7-ed89e0362834"
      type                     = "Scope"
    }
    resource_access {
      id                       = "b43e1ada-25ee-416f-bd5c-512976ddc74b"
      type                     = "Scope"
    }
  }
}

resource "azuread_service_principal" "BMPRestApplication" {
  application_id               = azuread_application.BMPRestApplication.application_id
  app_role_assignment_required = false

  tags                         = ["WindowsAzureActiveDirectoryIntegratedApp"]
}

resource "azuread_application" "MEPRestApplication" {
  name                         = "Mep RestApplication${upper(var.environment_acronym_ad_app)}"
  homepage                     = "https://meprest${var.environment_acronym_ad_app}.kpmgcloudops.com/"
  reply_urls                   = ["https://meprest${var.environment_acronym_ad_app}.kpmgcloudops.com","https://meprest${var.environment_acronym_ad_app}.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000002-0000-0000-c000-000000000000"
    resource_access {
      id                       = "311a71cc-e848-46a1-bdf8-97ff7156d8e6"
      type                     = "Scope"
    }
  }

  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
    resource_access {
      id                       = "bf7b1a76-6e77-406b-b258-bf5c7720e98f"
      type                     = "Role"
    }
    resource_access {
      id                       = "5b567255-7703-4780-807c-7be8301ae99b"
      type                     = "Role"
    }
    resource_access {
      id                       = "dbaae8cf-10b5-4b86-a4a1-f871c94c6695"
      type                     = "Role"
    }
  }
}

resource "azuread_service_principal" "MEPRestApplication" {
  application_id               = azuread_application.MEPRestApplication.application_id
  app_role_assignment_required = false

  tags                         = ["WindowsAzureActiveDirectoryIntegratedApp"]
}

resource "azuread_application" "MEPWebApplication" {
  name                         = "MEP WebApplication${upper(var.environment_acronym_ad_app)}"
  homepage                     = "https://mep${var.environment_acronym_ad_app}.kpmgcloudops.com"
  reply_urls                   = ["https://mep${var.environment_acronym_ad_app}.kpmgcloudops.com"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}

resource "azuread_service_principal" "MEPWebApplication" {
  application_id               = azuread_application.MEPWebApplication.application_id
  app_role_assignment_required = false

  tags                         = ["WindowsAzureActiveDirectoryIntegratedApp"]
}

resource "azuread_application" "DASWebApplication" {
  name                         = "DAS WebApplication${upper(var.environment_acronym_ad_app)}"
  homepage                     = "https://das${var.environment_acronym_ad_app}.kpmgcloudops.com"
  reply_urls                   = ["https://das${var.environment_acronym_ad_app}.kpmgcloudops.com"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}

resource "azuread_service_principal" "DASWebApplication" {
  application_id               = azuread_application.DASWebApplication.application_id
  app_role_assignment_required = false

  tags                         = ["WindowsAzureActiveDirectoryIntegratedApp"]
}

resource "azuread_application" "DASRestApplication" {
  name                         = "DAS RestApplication${upper(var.environment_acronym_ad_app)}"
  homepage                     = "https://dasrest${var.environment_acronym_ad_app}.kpmgcloudops.com"
  reply_urls                   = ["https://dasrest${var.environment_acronym_ad_app}.kpmgcloudops.com"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}

resource "azuread_service_principal" "DASRestApplication" {
  application_id               = azuread_application.DASRestApplication.application_id
  app_role_assignment_required = false

  tags                         = ["WindowsAzureActiveDirectoryIntegratedApp"]
}

resource "azuread_application" "DASHWebApplication" {
  name                         = "DASH WebApplication${upper(var.environment_acronym_ad_app)}"
  homepage                     = "https://dash${var.environment_acronym_ad_app}.kpmgcloudops.com"
  reply_urls                   = ["https://dash${var.environment_acronym_ad_app}.kpmgcloudops.com"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}

resource "azuread_service_principal" "DASHWebApplication" {
  application_id               = azuread_application.DASHWebApplication.application_id
  app_role_assignment_required = false

  tags                         = ["WindowsAzureActiveDirectoryIntegratedApp"]
}

resource "azuread_application" "ACTWebApplication" {
  name                         = "ACT WebApplication${upper(var.environment_acronym_ad_app)}"
  homepage                     = "https://act${var.environment_acronym_ad_app}.kpmgcloudops.com"
  reply_urls                   = ["https://act${var.environment_acronym_ad_app}.kpmgcloudops.com"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}

resource "azuread_service_principal" "ACTWebApplication" {
  application_id               = azuread_application.ACTWebApplication.application_id
  app_role_assignment_required = false

  tags                         = ["WindowsAzureActiveDirectoryIntegratedApp"]
}