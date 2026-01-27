# Enterprise Security Rules - Multi-Service
# Priority Block: 313-365
#   Currently used: 313-325 (13 rules)
#   Reserved for future: 326-365 (40 slots)

locals {
  # Common rules - Apply to all regions
  multi_service_two_common = var.enable_default_enterprise_security_rules ? {
    "Allow-MultiServiceTwo_TCP_22" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["22"]
      direction                      = "Inbound"
      priority                       = 313
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.208/32", "10.111.88.0/24", "10.211.19.155/32", "10.211.88.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-MultiServiceTwo_TCP_135" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["135"]
      direction                      = "Inbound"
      priority                       = 314
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.208/32", "10.111.88.0/24", "10.211.19.155/32", "10.211.88.0/24", "10.71.44.0/24", "10.72.44.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-MultiServiceTwo_TCP_139" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["139"]
      direction                      = "Inbound"
      priority                       = 315
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.208/32", "10.111.88.0/24", "10.211.19.155/32", "10.211.88.0/24", "10.71.44.0/24", "10.72.44.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-MultiServiceTwo_TCP_443" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["443"]
      direction                      = "Inbound"
      priority                       = 316
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.88.0/24", "10.211.19.155/32", "10.211.88.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-MultiServiceTwo_TCP_445" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["445"]
      direction                      = "Inbound"
      priority                       = 317
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.208/32", "10.111.88.0/24", "10.211.19.155/32", "10.211.88.0/24", "10.71.44.0/24", "10.72.44.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-MultiServiceTwo_TCP_636" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["636"]
      direction                      = "Inbound"
      priority                       = 318
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.208/32", "10.111.88.0/24", "10.211.19.155/32", "10.211.88.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-MultiServiceTwo_TCP_1858" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1858"]
      direction                      = "Inbound"
      priority                       = 319
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.208/32", "10.111.88.0/24", "10.211.19.155/32", "10.211.88.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-MultiServiceTwo_TCP_3389" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["3389"]
      direction                      = "Inbound"
      priority                       = 320
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.208/32", "10.111.88.0/24", "10.211.19.155/32", "10.211.88.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-MultiServiceTwo_TCP_5500" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5500"]
      direction                      = "Inbound"
      priority                       = 321
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.208/32", "10.111.88.0/24", "10.211.19.155/32", "10.211.88.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-MultiServiceTwo_TCP_52731" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["52731"]
      direction                      = "Inbound"
      priority                       = 322
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.208/32", "10.111.88.0/24", "10.211.19.155/32", "10.211.88.0/24", "10.71.44.0/24", "10.72.44.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-MultiServiceTwo_TCP_49152-65535" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["49152-65535"]
      direction                      = "Inbound"
      priority                       = 323
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.208/32", "10.111.88.0/24", "10.211.19.155/32", "10.211.88.0/24", "10.71.44.0/24", "10.72.44.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-MultiServiceTwo_UDP_1813" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1813"]
      direction                      = "Inbound"
      priority                       = 324
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.19.208/32", "10.111.88.0/24", "10.211.19.155/32", "10.211.88.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-All_Egress" = {
      access                         = "Allow"
      description                    = "Egress to Multi-Service servers."
      destination_address_prefix     = "0.0.0.0/0"
      destination_port_ranges        = ["*"]
      direction                      = "Outbound"
      priority                       = 325
      protocol                       = "*"
      source_address_prefixes        = ["*"]
      source_port_ranges             = ["*"]
    }
  } : {}

  # Region-01 only (eastus)
  multi_service_two_region_eastus = {
    # No eastus-specific rules currently
  }

  # Region-02 only (northcentralus)
  multi_service_two_region_northcentralus = {
    # No northcentralus-specific rules currently
  }

  enterprise_multi_service_two_rules = merge(
    local.multi_service_two_common,
    var.location == "eastus" ? local.multi_service_two_region_eastus : {},
    var.location == "northcentralus" ? local.multi_service_two_region_northcentralus : {}
  )
}