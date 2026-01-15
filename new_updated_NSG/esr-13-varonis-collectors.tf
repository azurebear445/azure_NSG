# Varonis Collectors Enterprise Security Rules (ESR 13)
# This file contains enterprise-managed rules for Varonis data security
# platform collectors.
#
# Priority Block: 1150-1199 (50 total slots)
#   - Currently used: 1150-1163 (14 rules)
#   - Reserved for future: 1164-1199 (36 slots)
#
# Rule Distribution:
#   - Common rules: 14 (apply to both regions)
#   - Region-01 only: 0 (eastus only)
#   - Region-02 only: 0 (northcentralus only)
#
#
# Variable Naming: enterprise_13_varonis_collectors_rules
locals {
    # Common rules - Apply to all regions
  varonis_collectors_13_common = {
    "tcp-22-10-111-19-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1150
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule"
    }
    "tcp-22-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1151
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule"
    }
    "tcp-80-10-111-19-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1152
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule"
    }
    "tcp-80-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1153
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule"
    }
    "tcp-111-10-111-19-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1154
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "111"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule"
    }
    "tcp-111-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1155
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "111"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule"
    }
    "tcp-137-139-10-111-19-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1156
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "137-139"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule"
    }
    "tcp-137-139-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1157
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "137-139"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule"
    }
    "tcp-445-10-111-19-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1158
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule"
    }
    "tcp-445-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1159
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule"
    }
    "tcp-2049-10-111-19-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1160
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "2049"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule"
    }
    "tcp-2049-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1161
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "2049"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule"
    }
    "tcp-4972-4973-10-111-19-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1162
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4972-4973"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule"
    }
    "tcp-4972-4973-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1163
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4972-4973"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 13 - Varonis Collectors Rule"
    }
  }
    # Region-01 only (eastus)
  varonis_collectors_13_region_01 = {
      # No Region-01 specific rules currently
          # EXAMPLE: How to add a new Region-01 only rule:
          # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1164  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "3306"
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 13 - Varonis Collectors Rule"
      # }
  }
    # Region-02 only (northcentralus)
  varonis_collectors_13_region_02 = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
          # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1164  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "8080"
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 13 - Varonis Collectors Rule"
      # }
  }
  enterprise_13_varonis_collectors_rules = merge(
    local.varonis_collectors_13_common,
    var.location == "eastus" ? local.varonis_collectors_13_region_01 : {},
    var.location == "northcentralus" ? local.varonis_collectors_13_region_02 : {}
  )
}
