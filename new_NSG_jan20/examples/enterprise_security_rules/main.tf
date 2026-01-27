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
    appid              = "app-6138"
    architecture       = "native"
    owner              = "cloudoperations@websterbank.com"
    purpose            = "Used to test the Terraform Network Security Group Module."
    terraform_resource = "true"
  }
}
