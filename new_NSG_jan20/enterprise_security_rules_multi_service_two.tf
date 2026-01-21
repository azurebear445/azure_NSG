# Enterprise Security Rules - Multi-Service
# Priority Block: 400-499
#   Currently used: 400-457 (58 rules)
#   Reserved for future: 458-499 (42 slots)

locals {
    # Common rules - Apply to all regions
  multi_service_two_common = {
    "Allow_MultiService_Two_All_AllPorts_Out" = {
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 400
      protocol                   = "*"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["*"]
      source_address_prefix      = "*"
      destination_address_prefix = "0.0.0.0/0"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_22_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 401
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["22"]
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_22_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 402
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["22"]
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_22_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 403
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["22"]
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_22_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 404
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["22"]
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_135_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 405
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["135"]
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_135_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 406
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["135"]
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_135_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 407
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["135"]
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_135_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 408
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["135"]
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_135_In_4" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 409
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["135"]
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_135_In_5" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 410
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["135"]
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_139_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 411
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["139"]
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_139_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 412
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["139"]
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_139_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 413
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["139"]
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_139_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 414
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["139"]
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_139_In_4" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 415
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["139"]
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_139_In_5" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 416
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["139"]
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_443_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 417
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["443"]
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_443_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 418
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["443"]
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_443_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 419
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["443"]
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_445_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 420
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["445"]
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_445_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 421
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["445"]
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_445_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 422
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["445"]
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_445_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 423
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["445"]
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_445_In_4" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 424
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["445"]
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_445_In_5" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 425
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["445"]
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_636_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 426
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["636"]
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_636_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 427
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["636"]
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_636_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 428
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["636"]
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_636_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 429
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["636"]
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_1858_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 430
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1858"]
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_1858_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 431
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1858"]
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_1858_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 432
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1858"]
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_1858_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 433
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1858"]
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_3389_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 434
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["3389"]
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_3389_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 435
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["3389"]
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_3389_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 436
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["3389"]
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_3389_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 437
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["3389"]
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_5500_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 438
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5500"]
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_5500_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 439
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5500"]
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_5500_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 440
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5500"]
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_5500_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 441
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5500"]
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_49152to65535_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 442
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["49152-65535"]
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_49152to65535_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 443
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["49152-65535"]
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_49152to65535_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 444
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["49152-65535"]
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_49152to65535_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 445
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["49152-65535"]
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_49152to65535_In_4" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 446
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["49152-65535"]
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_49152to65535_In_5" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 447
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["49152-65535"]
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_52731_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 448
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["52731"]
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_52731_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 449
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["52731"]
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_52731_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 450
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["52731"]
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_52731_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 451
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["52731"]
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_52731_In_4" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 452
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["52731"]
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_TCP_52731_In_5" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 453
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["52731"]
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_UDP_1813_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 454
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1813"]
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_UDP_1813_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 455
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1813"]
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_UDP_1813_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 456
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1813"]
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
    "Allow_MultiService_Two_UDP_1813_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 457
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1813"]
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule."
    }
  }
    # Region-01 only (eastus)
  multi_service_two_region_eastus = {
      # No Region-01 specific rules currently
          # EXAMPLE: How to add a new Region-01 only rule:
          # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 458  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_ranges          = ["*"]
      #   destination_port_ranges     = ["3306"]
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 04 - Multi-Service Rule."
      # }
  }
    # Region-02 only (northcentralus)
  multi_service_two_region_northcentralus = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
          # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 458  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_ranges          = ["*"]
      #   destination_port_ranges     = ["8080"]
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 04 - Multi-Service Rule."
      # }
  }
  enterprise_multi_service_two_rules = merge(
    local.multi_service_two_common,
    var.location == "eastus" ? local.multi_service_two_region_eastus : {},
    var.location == "northcentralus" ? local.multi_service_two_region_northcentralus : {}
  )
}