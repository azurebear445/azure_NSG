# Module Usage with Additional ESRs

## What this example demonstrates

Advanced usage with opt-in Enterprise Security Rules enabled (ESR-06 Rubrik Backup, ESR-07 Database Admin) in addition to default ESRs. Also demonstrates adding user-defined ingress rules (ports 443 and 3306 from 10.0.0.0/8).

## ESRs Enabled

**Default (enabled by default):**
- ESR-01: ServiceNow
- ESR-02: SolarWinds
- ESR-03: Multi-Service
- ESR-04: Multi-Service
- ESR-05: Multi-Service
- ESR-08: Multi-Service

**Opt-in (enabled in this example):**
- ESR-06: Rubrik Backup
- ESR-07: Database Admin

**Note:** To opt-out of all default ESRs, set `enable_enterprise_security_rules = false`

## Other Available Opt-in ESRs

Additional ESRs that can be enabled:
- ESR-09: Idera Monitoring (`enable_idera_monitoring = true`)
- ESR-10: HSA Monitoring (`enable_hsa_monitoring = true`)
- ESR-11: Citrix (`enable_citrix_ingress = true`)
- ESR-12: SailPoint (`enable_sailpoint_ingress = true`)
- ESR-13: Varonis Collectors (`enable_varonis_ingress = true`)

---

## Code

```hcl
provider "azurerm" {
  alias = "networking-prod"

  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id_networking_prod
  tenant_id       = var.tenant_id
}

module "resource_group" {
  source  = "tfe.infraprod.websterbank.com/wfc-azure-infra-prod/resource_group/azurerm"
  version = "0.0.1"

  environment = "dev"
  location    = "eastus"
  namespace   = "test"

  tags = {
    architecture       = "native"
    owner              = "cloudoperations@websterbank.com"
    purpose            = "Resource group for NSG module testing."
    terraform_resource = "true"
    appid              = "app-test-002"
  }
}

module "nsg_with_additional_rules" {
  source = "../../"

  providers = {
    azurerm.networking-prod = azurerm.networking-prod
  }

  environment         = "dev"
  location            = "eastus"
  namespace           = "test"
  resource_group_name = module.resource_group.name

  # Enable opt-in ESRs
  enable_rubrik_backup  = true
  enable_db_admin_access = true

  ingress_rules = {
    from_cidrs = {
      tcp = {
        "443" = {
          cidrs   = ["10.0.0.0/8"]
          to_port = 443
        }
        "3306" = {
          cidrs   = ["10.0.0.0/8"]
          to_port = 3306
        }
      }
    }
  }

  tags = {
    appid              = "app-test-002"
    architecture       = "native"
    owner              = "cloudoperations@websterbank.com"
    purpose            = "NSG for testing additional ESRs."
    repo               = "azprodlz-infrall-shared"
    terraform_resource = "true"
  }
}
```
