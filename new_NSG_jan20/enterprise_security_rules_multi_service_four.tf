# Enterprise Security Rules - Multi-Service
# Priority Block: 525-589
#   Currently used: 525-549 (25 rules)
#   Reserved for future: 550-589 (40 slots)

locals {
  # Common rules - Apply to all regions
  multi_service_four_common = var.enable_default_enterprise_security_rules ? {
    "Allow-MultiServiceFour_TCP_25" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["25"]
      direction                      = "Inbound"
      priority                       = 525
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_53" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["53"]
      direction                      = "Inbound"
      priority                       = 526
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_80" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["80"]
      direction                      = "Inbound"
      priority                       = 527
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_135" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["135"]
      direction                      = "Inbound"
      priority                       = 528
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_139" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["139"]
      direction                      = "Inbound"
      priority                       = 529
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_443" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["443"]
      direction                      = "Inbound"
      priority                       = 530
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_445" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["445"]
      direction                      = "Inbound"
      priority                       = 531
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_465" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["465"]
      direction                      = "Inbound"
      priority                       = 532
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_587" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["587"]
      direction                      = "Inbound"
      priority                       = 533
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_1433" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1433"]
      direction                      = "Inbound"
      priority                       = 534
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_1801" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1801"]
      direction                      = "Inbound"
      priority                       = 535
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_5671" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5671"]
      direction                      = "Inbound"
      priority                       = 536
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_17791" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["17791"]
      direction                      = "Inbound"
      priority                       = 537
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_65535" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["65535"]
      direction                      = "Inbound"
      priority                       = 538
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_22-23" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["22-23"]
      direction                      = "Inbound"
      priority                       = 539
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_1024-1034" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1024-1034"]
      direction                      = "Inbound"
      priority                       = 540
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_17777-17778" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["17777-17778"]
      direction                      = "Inbound"
      priority                       = 541
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_49152-65535" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["49152-65535"]
      direction                      = "Inbound"
      priority                       = 542
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.237/32", "10.120.7.135/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_TCP_0-65535" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["0-65535"]
      direction                      = "Inbound"
      priority                       = 543
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.100.235/32", "10.111.100.244/32", "10.111.100.246/32", "10.111.100.247/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_UDP_53" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["53"]
      direction                      = "Inbound"
      priority                       = 544
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_UDP_1024" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1024"]
      direction                      = "Inbound"
      priority                       = 545
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_UDP_1434" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1434"]
      direction                      = "Inbound"
      priority                       = 546
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_UDP_137-139" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["137-139"]
      direction                      = "Inbound"
      priority                       = 547
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_UDP_161-162" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["161-162"]
      direction                      = "Inbound"
      priority                       = 548
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceFour_ICMP_AllPorts" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["*"]
      direction                      = "Inbound"
      priority                       = 549
      protocol                       = "Icmp"
      source_address_prefixes        = ["10.111.14.237/32", "10.120.7.154/32"]
      source_port_range             = "*"
    }
  } : {}

  # Region-01 only (eastus)
  multi_service_four_region_eastus = {
    # No eastus-specific rules currently
  }

  # Region-02 only (northcentralus)
  multi_service_four_region_northcentralus = {
    # No northcentralus-specific rules currently
  }

  enterprise_multi_service_four_rules = merge(
    local.multi_service_four_common,
    local.is_region_eastus ? local.multi_service_four_region_eastus : {},
    local.is_region_northcentralus ? local.multi_service_four_region_northcentralus : {}
  )
}