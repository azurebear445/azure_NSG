# Enterprise Security Rules - Citrix
# Priority Block: 684-731
#   Currently used: 684-692 (9 rules for eastus, 8 for northcentralus)
#   Reserved for future: 693-731 (39 slots)

locals {
  # Common rules - Apply to all regions
  citrix_common = {
    "Allow-Citrix_TCP_80" = {
      access                     = "Allow"
      description                = "Ingress from Citrix servers."
      destination_address_prefix = "*"
      destination_port_ranges    = ["80"]
      direction                  = "Inbound"
      priority                   = 684
      protocol                   = "Tcp"
      source_address_prefixes    = ["10.111.124.135/32", "10.111.124.176/32", "10.120.191.8/32", "10.120.191.9/32"]
      source_port_range             = "*"
    }
    "Allow-Citrix_TCP_1494" = {
      access                     = "Allow"
      description                = "Ingress from Citrix servers."
      destination_address_prefix = "*"
      destination_port_ranges    = ["1494"]
      direction                  = "Inbound"
      priority                   = 685
      protocol                   = "Tcp"
      source_address_prefixes    = ["10.0.0.0/8"]
      source_port_range             = "*"
    }
    "Allow-Citrix_TCP_2598" = {
      access                     = "Allow"
      description                = "Ingress from Citrix servers."
      destination_address_prefix = "*"
      destination_port_ranges    = ["2598"]
      direction                  = "Inbound"
      priority                   = 686
      protocol                   = "Tcp"
      source_address_prefixes    = ["10.0.0.0/8"]
      source_port_range             = "*"
    }
    "Allow-Citrix_TCP_8008" = {
      access                     = "Allow"
      description                = "Ingress from Citrix servers."
      destination_address_prefix = "*"
      destination_port_ranges    = ["8008"]
      direction                  = "Inbound"
      priority                   = 687
      protocol                   = "Tcp"
      source_address_prefixes    = ["10.0.0.0/8"]
      source_port_range             = "*"
    }
    "Allow-Citrix_TCP_9988" = {
      access                     = "Allow"
      description                = "Ingress from Citrix servers."
      destination_address_prefix = "*"
      destination_port_ranges    = ["9988"]
      direction                  = "Inbound"
      priority                   = 688
      protocol                   = "Tcp"
      source_address_prefixes    = ["10.0.0.0/8"]
      source_port_range             = "*"
    }
    "Allow-Citrix_UDP_1494" = {
      access                     = "Allow"
      description                = "Ingress from Citrix servers."
      destination_address_prefix = "*"
      destination_port_ranges    = ["1494"]
      direction                  = "Inbound"
      priority                   = 689
      protocol                   = "Udp"
      source_address_prefixes    = ["10.0.0.0/8"]
      source_port_range             = "*"
    }
    "Allow-Citrix_UDP_2598" = {
      access                     = "Allow"
      description                = "Ingress from Citrix servers."
      destination_address_prefix = "*"
      destination_port_ranges    = ["2598"]
      direction                  = "Inbound"
      priority                   = 690
      protocol                   = "Udp"
      source_address_prefixes    = ["10.0.0.0/8"]
      source_port_range             = "*"
    }
    "Allow-Citrix_UDP_9988" = {
      access                     = "Allow"
      description                = "Ingress from Citrix servers."
      destination_address_prefix = "*"
      destination_port_ranges    = ["9988"]
      direction                  = "Inbound"
      priority                   = 691
      protocol                   = "Udp"
      source_address_prefixes    = ["10.0.0.0/8"]
      source_port_range             = "*"
    }
  }

  # Region-01 only (eastus)
  citrix_region_eastus = {
    "Allow-Citrix_TCP_5985" = {
      access                     = "Allow"
      description                = "Ingress from Citrix servers."
      destination_address_prefix = "*"
      destination_port_ranges    = ["5985"]
      direction                  = "Inbound"
      priority                   = 692
      protocol                   = "Tcp"
      source_address_prefixes    = ["10.120.191.12/32"]
      source_port_range          = "*"
    }
  }

  # Region-02 only (northcentralus)
  citrix_region_northcentralus = {
    # No Region-02 specific rules currently
    # EXAMPLE: How to add a new Region-02 only rule:
    # "Allow-Citrix_TCP_8080" = {
    #   access                     = "Allow"
    #   description                = "Ingress from Citrix servers."
    #   destination_address_prefix = "*"
    #   destination_port_ranges    = ["8080"]
    #   direction                  = "Inbound"
    #   priority                   = 1048
    #   protocol                   = "Tcp"
    #   source_address_prefixes    = ["10.1.1.0/24"]
    #   source_port_range             = "*"
    # }
  }

  enterprise_citrix_rules = merge(
    local.citrix_common,
    local.is_region_eastus ? local.citrix_region_eastus : {},
    local.is_region_northcentralus ? local.citrix_region_northcentralus : {}
  )
}
