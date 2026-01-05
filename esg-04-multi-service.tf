# =============================================================================
# Multi-Service Enterprise Security Group Rules (ESG 04)
# =============================================================================
# Priority Block: 400-499 (100 total slots)
#   - Currently used: 400-466 (67 rules)
#   - Reserved: 467-499 (33 slots)
#
# Rule Distribution:
#   - Common: 51 | Region-01: 7 | Region-02: 7
# =============================================================================

locals {
  multi_service_04_common = {
    "all-all-0-0-0-0-0-outbound" = {
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 400
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "0.0.0.0/0"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-22-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 401
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-22-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 402
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-135-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 403
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-135-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 404
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-135-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 405
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-135-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 406
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-135-10-71-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 407
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-135-10-72-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 408
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-139-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 409
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-139-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 410
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-139-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 411
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-139-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 412
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-139-10-71-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 413
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-139-10-72-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 414
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-443-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 415
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-443-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 416
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-443-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 417
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-445-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 418
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-445-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 419
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-445-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 420
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-445-10-71-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 421
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-445-10-72-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 422
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-636-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 423
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-636-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 424
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-636-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 425
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-636-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 426
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-1858-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 427
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1858"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-1858-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 428
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1858"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-1858-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 429
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1858"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-1858-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 430
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1858"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-3389-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 431
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-3389-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 432
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-3389-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 433
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-3389-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 434
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-5500-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 435
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5500"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-5500-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 436
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5500"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-5500-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 437
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5500"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 438
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 439
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 440
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-71-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 441
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-72-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 442
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-52731-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 443
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-52731-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 444
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-52731-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 445
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-52731-10-71-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 446
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "tcp-52731-10-72-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 447
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "udp-1813-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 448
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1813"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "udp-1813-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 449
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1813"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
    "udp-1813-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 450
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1813"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESG 04 - Multi-Service Rule"
    }
  }

  multi_service_04_region_01 = {
    for k, v in {
      "tcp-22-10-111-19-208-32-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 451
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.111.19.208/32"
        destination_address_prefix = "*"
        description                = "ESG 04 - Multi-Service Rule"
      }
      "tcp-22-10-211-19-155-32-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 452
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.211.19.155/32"
        destination_address_prefix = "*"
        description                = "ESG 04 - Multi-Service Rule"
      }
      "tcp-445-10-111-19-20-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 453
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "445"
        source_address_prefix      = "10.111.19.20"
        destination_address_prefix = "*"
        description                = "ESG 04 - Multi-Service Rule"
      }
      "tcp-5500-10-211-19-155-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 454
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5500"
        source_address_prefix      = "10.211.19.155"
        destination_address_prefix = "*"
        description                = "ESG 04 - Multi-Service Rule"
      }
      "tcp-49152-6553-10-111-88-0-24-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 455
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-6553"
        source_address_prefix      = "10.111.88.0/24"
        destination_address_prefix = "*"
        description                = "ESG 04 - Multi-Service Rule"
      }
      "tcp-52731-10-211-19-155-32-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 456
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "52731"
        source_address_prefix      = "10.211.19.155/32"
        destination_address_prefix = "*"
        description                = "ESG 04 - Multi-Service Rule"
      }
      "udp-1813-10-111-19-208-32-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 457
        protocol                   = "Udp"
        source_port_range          = "*"
        destination_port_range     = "1813"
        source_address_prefix      = "10.111.19.208/32"
        destination_address_prefix = "*"
        description                = "ESG 04 - Multi-Service Rule"
      }
    } : k => v if contains(local.region_01_locations, var.location)
  }

  multi_service_04_region_02 = {
    for k, v in {
      "tcp-22-10-111-19-20-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 451
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.111.19.20"
        destination_address_prefix = "*"
        description                = "ESG 04 - Multi-Service Rule"
      }
      "tcp-22-10-211-19-155-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 452
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.211.19.155"
        destination_address_prefix = "*"
        description                = "ESG 04 - Multi-Service Rule"
      }
      "tcp-445-10-111-19-208-32-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 453
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "445"
        source_address_prefix      = "10.111.19.208/32"
        destination_address_prefix = "*"
        description                = "ESG 04 - Multi-Service Rule"
      }
      "tcp-5500-10-211-19-155-32-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 454
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5500"
        source_address_prefix      = "10.211.19.155/32"
        destination_address_prefix = "*"
        description                = "ESG 04 - Multi-Service Rule"
      }
      "tcp-49152-65535-10-111-88-0-24-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 455
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.111.88.0/24"
        destination_address_prefix = "*"
        description                = "ESG 04 - Multi-Service Rule"
      }
      "tcp-52731-10-211-19-155-32-outbound" = {
        direction                  = "Outbound"
        access                     = "Allow"
        priority                   = 456
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "52731"
        source_address_prefix      = "*"
        destination_address_prefix = "10.211.19.155/32"
        description                = "ESG 04 - Multi-Service Rule"
      }
      "udp-1813-10-111-19-20-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 457
        protocol                   = "Udp"
        source_port_range          = "*"
        destination_port_range     = "1813"
        source_address_prefix      = "10.111.19.20"
        destination_address_prefix = "*"
        description                = "ESG 04 - Multi-Service Rule"
      }
    } : k => v if contains(local.region_02_locations, var.location)
  }

  enterprise_04_multi_service_rules = merge(
    local.multi_service_04_common,
    local.multi_service_04_region_01,
    local.multi_service_04_region_02
  )
}