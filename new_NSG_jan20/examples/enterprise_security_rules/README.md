# Enterprise Security Rules Example

This example demonstrates usage of the Network Security Group module with all opt-in enterprise rule files enabled.

```hcl
module "resource_group" {
  source = "../../../."

  environment = "box"
  location    = "eastus"
  namespace   = "test-nsg"

  tags = {
    appid              = "app-6138"
    architecture       = "native"
    owner              = "cloudoperations@websterbank.com"
    purpose            = "Used to test the Terraform Resource Group Module."
    repo               = "azprodlz-infrall-shared"
    terraform_resource = "true"
  }
}

module "enterprise_rules_nsg" {
  source = "../../."

  enable_citrix_ingress    = true
  enable_db_admin_access   = true
  enable_hsa_monitoring    = true
  enable_idera_monitoring  = true
  enable_rubrik_backup     = true
  enable_sailpoint_ingress = true
  enable_varonis_ingress   = true
  environment              = "box"
  location                 = "eastus"
  namespace                = "test-nsg"
  resource_group_name      = module.resource_group.name

  tags = {
    architecture       = "native"
    owner              = "cloudoperations@websterbank.com"
    purpose            = "Used to test the Terraform Network Security Group Module."
    repo               = "azprodlz-infrall-shared"
    serviceid          = "bsn0002269"
    terraform_resource = "true"
  }
}
```
