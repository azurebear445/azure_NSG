# Enterprise Security Rules - Multi-Service
# Priority Block: 366-436
#   Currently used: 366-396 (31 rules)
#   Reserved for future: 397-436 (40 slots)

locals {
  # Common rules - Apply to all regions
  multi_service_three_common = var.enable_default_enterprise_security_rules ? {
    "Allow-MultiServiceThree_TCP_22" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["22"]
      direction                      = "Inbound"
      priority                       = 366
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.110.88.0/24", "10.111.88.0/24", "10.211.88.0/24"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_88" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["88"]
      direction                      = "Inbound"
      priority                       = 367
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.88.0/24", "10.211.88.0/24"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_135" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["135"]
      direction                      = "Inbound"
      priority                       = 368
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.112.1.153/32", "10.20.60.110/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_139" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["139"]
      direction                      = "Inbound"
      priority                       = 369
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.112.1.153/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_389" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["389"]
      direction                      = "Inbound"
      priority                       = 370
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.88.0/24", "10.211.88.0/24"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_443" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["443"]
      direction                      = "Inbound"
      priority                       = 371
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.88.0/24", "10.211.88.0/24"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_445" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["445"]
      direction                      = "Inbound"
      priority                       = 372
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.104/32", "10.111.14.189/32", "10.111.88.0/24", "10.112.1.153/32", "10.20.60.110/32", "10.211.88.0/24"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_636" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["636"]
      direction                      = "Inbound"
      priority                       = 373
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.88.0/24", "10.211.88.0/24"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_1433" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1433"]
      direction                      = "Inbound"
      priority                       = 374
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.1.249.31/32", "10.111.88.0/24", "10.211.88.0/24"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_3389" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["3389"]
      direction                      = "Inbound"
      priority                       = 375
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.110.88.0/24"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_4431" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["4431"]
      direction                      = "Inbound"
      priority                       = 376
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.88.0/24", "10.211.88.0/24"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_4699" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["4699"]
      direction                      = "Inbound"
      priority                       = 377
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.112.1.153/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_4972" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["4972"]
      direction                      = "Inbound"
      priority                       = 378
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.112.1.153/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_4974" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["4974"]
      direction                      = "Inbound"
      priority                       = 379
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.112.1.153/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_5985" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5985"]
      direction                      = "Inbound"
      priority                       = 380
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.20.60.110/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_5986" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5986"]
      direction                      = "Inbound"
      priority                       = 381
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.20.60.110/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_15671" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["15671"]
      direction                      = "Inbound"
      priority                       = 382
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.112.1.153/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_52311" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["52311"]
      direction                      = "Inbound"
      priority                       = 383
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.189/32", "10.111.14.26/32", "10.111.14.48/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_52731" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["52731"]
      direction                      = "Inbound"
      priority                       = 384
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.1.249.31/32", "10.110.88.0/24", "10.111.88.0/24", "10.211.88.0/24"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_60777" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["60777"]
      direction                      = "Inbound"
      priority                       = 385
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.112.1.153/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_135-139" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["135-139"]
      direction                      = "Inbound"
      priority                       = 386
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.104/32", "10.111.88.0/24", "10.211.88.0/24"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_1024-65535" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1024-65535"]
      direction                      = "Inbound"
      priority                       = 387
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.88.155/32", "10.111.88.156/32", "10.111.88.180/32", "10.211.88.143/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_5985-5986" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5985-5986"]
      direction                      = "Inbound"
      priority                       = 388
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.104/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_49152-65535" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["49152-65535"]
      direction                      = "Inbound"
      priority                       = 389
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.104/32", "10.20.60.110/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_49153-49156" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["49153-49156"]
      direction                      = "Inbound"
      priority                       = 390
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.88.0/24", "10.211.88.0/24"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_TCP_0-65535" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["0-65535"]
      direction                      = "Inbound"
      priority                       = 391
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.100.235/32", "10.111.100.244/32", "10.111.100.246/32", "10.111.100.247/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_UDP_137" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["137"]
      direction                      = "Inbound"
      priority                       = 392
      protocol                       = "Udp"
      source_address_prefixes        = ["10.112.1.153/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_UDP_138" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["138"]
      direction                      = "Inbound"
      priority                       = 393
      protocol                       = "Udp"
      source_address_prefixes        = ["10.112.1.153/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_UDP_52311" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["52311"]
      direction                      = "Inbound"
      priority                       = 394
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.14.189/32", "10.111.14.26/32", "10.111.14.48/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceThree_ICMP_AllPorts" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["*"]
      direction                      = "Inbound"
      priority                       = 395
      protocol                       = "Icmp"
      source_address_prefixes        = ["10.111.14.104/32", "10.20.60.110/32"]
      source_port_range             = "*"
    }
    "Allow-All_Egress" = {
      access                         = "Allow"
      description                    = "Egress to Multi-Service servers."
      destination_address_prefix     = "0.0.0.0/0"
      destination_port_ranges        = ["*"]
      direction                      = "Outbound"
      priority                       = 396
      protocol                       = "*"
      source_address_prefixes = ["0.0.0.0/0"]
      source_port_range             = "*"
    }
  } : {}

  # Region-01 only (eastus)
  multi_service_three_region_eastus = {
    # No eastus-specific rules currently
  }

  # Region-02 only (northcentralus)
  multi_service_three_region_northcentralus = {
    # No northcentralus-specific rules currently
  }

  enterprise_multi_service_three_rules = merge(
    local.multi_service_three_common,
    local.is_region_eastus ? local.multi_service_three_region_eastus : {},
    local.is_region_northcentralus ? local.multi_service_three_region_northcentralus : {}
  )
}