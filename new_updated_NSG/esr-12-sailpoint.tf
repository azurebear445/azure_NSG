# SailPoint Identity Management Enterprise Security Rule Rules (ESR 12)
# This file contains enterprise-managed rules for SailPoint identity management
# services for database user and role configuration.
#
# Region Mapping:
# Region-01: eastus | Region-02: eastus2 | Region-03: northcentralus (common only)
#
#
# Priority Block: 1090-1149 (60 total slots)
#   - Currently used: 1090-1109 (20 rules)
#   - Reserved for future: 1110-1149 (40 slots)
#
# Rule Distribution:
#   - Common rules: 20 (apply to both regions)
#   - Region-01 only: 0 (eastus only)
#   - Region-02 only: 0 (eastus only)
#
#
# Variable Naming: enterprise_12_sailpoint_rules
locals {
    # Common rules - Apply to all regions
  sailpoint_12_common = {
    "tcp-1433-10-110-117-157-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1090
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.110.117.157/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-1433-10-110-117-164-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1091
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.110.117.164/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-1433-10-111-95-173-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1092
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.95.173/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-1433-10-111-95-176-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1093
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.95.176/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-1433-10-211-42-149-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1094
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.211.42.149/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-5102-10-110-117-157-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1095
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.110.117.157/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-5102-10-110-117-164-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1096
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.110.117.164/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-5102-10-111-95-173-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1097
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.111.95.173/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-5102-10-111-95-176-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1098
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.111.95.176/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-5102-10-211-42-149-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1099
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.211.42.149/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-5432-10-110-117-157-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1100
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.110.117.157/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-5432-10-110-117-164-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1101
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.110.117.164/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-5432-10-111-95-173-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1102
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.111.95.173/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-5432-10-111-95-176-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1103
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.111.95.176/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-5432-10-211-42-149-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1104
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.211.42.149/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-52731-10-110-117-157-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1105
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.110.117.157/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-52731-10-110-117-164-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1106
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.110.117.164/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-52731-10-111-95-173-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1107
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.95.173/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-52731-10-111-95-176-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1108
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.95.176/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
    "tcp-52731-10-211-42-149-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1109
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.211.42.149/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule"
    }
  }
    # Region-01 only (eastus)
  sailpoint_12_region_01 = {
      # No Region-01 specific rules currently
          # EXAMPLE: How to add a new Region-01 only rule:
          # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1110  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "3306"
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 12 - SailPoint Rule"
      # }
  }
    # Region-02 only (eastus2)
  sailpoint_12_region_02 = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
          # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1110  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "8080"
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 12 - SailPoint Rule"
      # }
  }
  enterprise_12_sailpoint_rules = merge(
    local.sailpoint_12_common,
    var.location == "eastus" ? local.sailpoint_12_region_01 : {},
    var.location == "eastus2" ? local.sailpoint_12_region_02 : {}
  )
}
