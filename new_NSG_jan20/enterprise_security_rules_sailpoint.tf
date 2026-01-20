# Enterprise Security Rules - SailPoint
# Priority Block: 1090-1149
#   Currently used: 1090-1109 (20 rules)
#   Reserved for future: 1110-1149 (40 slots)

locals {
    # Common rules - Apply to all regions
  sailpoint_twelve_common = {
    "Allow-SailPoint_TCP_1433_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1090
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.110.117.157/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_1433_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1091
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.110.117.164/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_1433_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1092
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.95.173/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_1433_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1093
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.95.176/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_1433_In_4" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1094
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.211.42.149/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_5102_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1095
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.110.117.157/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_5102_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1096
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.110.117.164/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_5102_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1097
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.111.95.173/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_5102_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1098
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.111.95.176/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_5102_In_4" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1099
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.211.42.149/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_5432_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1100
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.110.117.157/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_5432_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1101
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.110.117.164/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_5432_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1102
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.111.95.173/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_5432_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1103
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.111.95.176/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_5432_In_4" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1104
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.211.42.149/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_52731_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1105
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.110.117.157/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_52731_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1106
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.110.117.164/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_52731_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1107
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.95.173/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_52731_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1108
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.95.176/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
    "Allow-SailPoint_TCP_52731_In_4" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1109
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.211.42.149/32"
      destination_address_prefix = "*"
      description                = "ESR 12 - SailPoint Rule."
    }
  }
    # Region-01 only (eastus)
  sailpoint_twelve_region_eastus = {
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
      #   description                = "ESR 12 - SailPoint Rule."
      # }
  }
    # Region-02 only (northcentralus)
  sailpoint_twelve_region_northcentralus = {
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
      #   description                = "ESR 12 - SailPoint Rule."
      # }
  }
  enterprise_sailpoint_twelve_rules = merge(
    local.sailpoint_twelve_common,
    var.location == "eastus" ? local.sailpoint_twelve_region_eastus : {},
    var.location == "northcentralus" ? local.sailpoint_twelve_region_northcentralus : {}
  )
}
