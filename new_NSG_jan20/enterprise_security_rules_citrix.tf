# Enterprise Security Rules - Citrix
# Priority Block: 1040-1089
#   Currently used: 1040-1050 (11 rules)
#   Reserved for future: 1051-1089 (39 slots)

locals {
    # Common rules - Apply to all regions
  citrix_common = {
    "Allow_Citrix_TCP_80_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1040
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["80"]
      source_address_prefix      = "10.111.124.135/32"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule."
    }
    "Allow_Citrix_TCP_80_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1041
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["80"]
      source_address_prefix      = "10.111.124.176/32"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule."
    }
    "Allow_Citrix_TCP_80_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1042
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["80"]
      source_address_prefix      = "10.120.191.8/32"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule."
    }
    "Allow_Citrix_TCP_80_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1043
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["80"]
      source_address_prefix      = "10.120.191.9/32"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule."
    }
    "Allow_Citrix_TCP_1494_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1044
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1494"]
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule."
    }
    "Allow_Citrix_TCP_2598_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1045
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["2598"]
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule."
    }
    "Allow_Citrix_TCP_8008_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1046
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["8008"]
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule."
    }
    "Allow_Citrix_TCP_9988_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1047
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["9988"]
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule."
    }
    "Allow_Citrix_UDP_1494_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1048
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1494"]
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule."
    }
    "Allow_Citrix_UDP_2598_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1049
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["2598"]
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule."
    }
    "Allow_Citrix_UDP_9988_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1050
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["9988"]
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule."
    }
  }
    # Region-01 only (eastus)
  citrix_region_eastus = {
      # Uncomment after verifying this rule should be migrated to Azure.
            # "tcp-5985-10-120-191-12-32-ingress" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1051
      #   protocol                   = "Tcp"
      #   source_port_ranges          = ["*"]
      #   destination_port_ranges     = ["5985"]
      #   source_address_prefix      = "10.120.191.12/32"
      #   destination_address_prefix = "*"
      #   description                = "ESR 11 - Citrix Rule."
      # }
  }
    # Region-02 only (northcentralus)
  citrix_region_northcentralus = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
          # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1051  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_ranges          = ["*"]
      #   destination_port_ranges     = ["8080"]
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 11 - Citrix Rule."
      # }
  }
  enterprise_citrix_rules = merge(
    local.citrix_common,
    var.location == "eastus" ? local.citrix_region_eastus : {},
    var.location == "northcentralus" ? local.citrix_region_northcentralus : {}
  )
}
