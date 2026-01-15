# Create Resource Group
module "resource_group" {
  source = "..."  # RG module source

  namespace = "test"
  environment = "dev"
  location    = "northcentralus"

  tags = {
    architecture       = "native"
    owner              = "platform_team"
    purpose            = "Resource group for NSG module testing."
    terraform_resource = "true"
    appid              = "app-test-001"
  }
}

# Create NSG with default ESRs
module "nsg" {
  source = "../../"

  namespace = "test"
  environment         = "dev"
  location            = "northcentralus"
  resource_group_name = module.resource_group.name

  ingress_rules = {
    from_cidrs = {
      tcp = {
        "443" = {
          cidrs = ["10.0.0.0/8"]
          to_port = 443
        }
        "80" = {
          cidrs = ["10.0.0.0/8"]
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

  tags = {
    architecture       = "native"
    owner              = "platform_team"
    purpose            = "Network security group for testing default Enterprise Security Rules."
    terraform_resource = "true"
    appid              = "app-test-001"
  }
}
