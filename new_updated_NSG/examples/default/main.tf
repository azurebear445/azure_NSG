# Create Resource Group
module "resource_group" {
  source = "..."  # RG module source to be provided

  namespace   = "test-nsg"
  environment = "dev"
  location    = "eastus2"

  tags = {
    architecture       = "native"
    owner              = "platform_team"
    purpose            = "Resource group for NSG module testing and validation."
    terraform_resource = "true"
    appid              = "app-test-001"
  }
}

# Create NSG with default ESRs
module "nsg" {
  source = "../../"

  namespace           = "test-nsg"
  environment         = "dev"
  location            = "eastus2"
  resource_group_name = module.resource_group.name

  ingress_rules = {
    from_cidrs = {
      tcp = {
        "443" = {
          cidrs   = ["0.0.0.0/0"]
          to_port = 443
        }
        "80" = {
          cidrs   = ["0.0.0.0/0"]
          to_port = 80
        }
      }
      udp  = {}
      icmp = {}
    }
    from_nsgs = {
      tcp = {}
      udp = {}
    }
  }

  egress_rules = {
    to_cidrs = null
    to_nsgs  = {}
  }

  enable_any_egress      = true
  enable_any_nsg_to_self = true

  tags = {
    architecture       = "native"
    owner              = "platform_team"
    purpose            = "Network security group for testing default Enterprise Security Rules configuration."
    terraform_resource = "true"
    appid              = "app-test-001"
  }
}
