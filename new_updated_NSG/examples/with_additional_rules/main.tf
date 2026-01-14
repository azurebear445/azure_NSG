# Create Resource Group
module "resource_group" {
  source = "..."  # RG module source

  namespace   = "test-nsg"
  environment = "dev"
  location    = "eastus"

  tags = {
    architecture       = "native"
    owner              = "platform_team"
    purpose            = "Resource group for NSG module testing with additional ESRs."
    terraform_resource = "true"
    appid              = "app-test-002"
  }
}

# Create NSG with default ESRs + opt-ins
module "nsg" {
  source = "../../"

  namespace           = "test-nsg"
  environment         = "dev"
  location            = "eastus"
  resource_group_name = module.resource_group.name

  # Enable opt-in ESRs
  enable_rubrik_backup   = true
  enable_db_admin_access = true

  ingress_rules = {
    from_cidrs = {
      tcp = {
        "443" = {
          cidrs   = ["0.0.0.0/0"]
          to_port = 443
        }
        "3306" = {
          cidrs   = ["10.0.0.0/8"]
          to_port = 3306
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
    owner              = "database_team"
    purpose            = "Network security group for database with Rubrik backup and admin access enabled."
    terraform_resource = "true"
    appid              = "app-test-002"
  }
}
