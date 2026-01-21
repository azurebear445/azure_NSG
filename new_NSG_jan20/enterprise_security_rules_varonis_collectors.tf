# Enterprise Security Rules - Varonis Collectors
# Priority Block: 1150-1199
#   Currently used: 1150-1163 (14 rules)
#   Reserved for future: 1164-1199 (36 slots)

locals {
    # Common rules - Apply to all regions
  varonis_collectors_common = {
    "Allow-VaronisCollectors_TCP_22_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1150
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["22"]
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule."
    }
    "Allow-VaronisCollectors_TCP_22_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1151
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["22"]
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule."
    }
    "Allow-VaronisCollectors_TCP_80_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1152
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["80"]
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule."
    }
    "Allow-VaronisCollectors_TCP_80_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1153
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["80"]
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule."
    }
    "Allow-VaronisCollectors_TCP_111_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1154
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["111"]
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule."
    }
    "Allow-VaronisCollectors_TCP_111_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1155
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["111"]
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule."
    }
    "Allow-VaronisCollectors_TCP_137to139_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1156
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["137-139"]
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule."
    }
    "Allow-VaronisCollectors_TCP_137to139_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1157
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["137-139"]
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule."
    }
    "Allow-VaronisCollectors_TCP_445_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1158
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["445"]
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule."
    }
    "Allow-VaronisCollectors_TCP_445_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1159
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["445"]
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule."
    }
    "Allow-VaronisCollectors_TCP_2049_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1160
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["2049"]
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule."
    }
    "Allow-VaronisCollectors_TCP_2049_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1161
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["2049"]
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule."
    }
    "Allow-VaronisCollectors_TCP_4972to4973_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1162
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["4972-4973"]
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule."
    }
    "Allow-VaronisCollectors_TCP_4972to4973_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1163
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["4972-4973"]
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule."
    }
  }
    # Region-01 only (eastus)
  varonis_collectors_region_eastus = {
      # No Region-01 specific rules currently
          # EXAMPLE: How to add a new Region-01 only rule:
          # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1164  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_ranges          = ["*"]
      #   destination_port_ranges     = ["3306"]
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 13 - Varonis Collectors Rule."
      # }
  }
    # Region-02 only (northcentralus)
  varonis_collectors_region_northcentralus = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
          # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1164  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_ranges          = ["*"]
      #   destination_port_ranges     = ["8080"]
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 13 - Varonis Collectors Rule."
      # }
  }
  enterprise_varonis_collectors_rules = merge(
    local.varonis_collectors_common,
    var.location == "eastus" ? local.varonis_collectors_region_eastus : {},
    var.location == "northcentralus" ? local.varonis_collectors_region_northcentralus : {}
  )
}
