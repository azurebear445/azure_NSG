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

  environment         = "box"
  location            = "eastus"
  namespace           = "test-nsg"
  resource_group_name = module.resource_group.name

  ingress_rules = {
    from_cidrs = {
      tcp = {
        "443" = {
          cidrs   = ["10.0.0.0/8"]
          to_port = 443
        }
        "80" = {
          cidrs   = ["10.0.0.0/8"]
          to_port = 80
        }
      }
    }
  }

  tags = {
    appid              = "app-6138"
    architecture       = "native"
    owner              = "cloudoperations@websterbank.com"
    purpose            = "Used to test the Terraform Network Security Group Module."
    repo               = "azprodlz-infrall-shared"
    terraform_resource = "true"
  }
}
