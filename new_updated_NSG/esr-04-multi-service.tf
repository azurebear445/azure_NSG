# Multi-Service Enterprise Security Rule Rules (ESR 04)
# This file contains enterprise-managed rules for multiple monitoring and
# management services.
#
# Region Mapping:
#   - Region-01 (AWS us-east-1 Virginia) → Azure eastus
#   - Region-02 (AWS us-east-2 Ohio) → Azure eastus2
#
#
# Priority Block: 400-499 (100 total slots)
#   - Currently used: 400-457 (58 rules)
#   - Reserved for future: 458-499 (42 slots)
#
# Rule Distribution:
#   - Common rules: 58 (apply to both regions)
#   - Region-01 only: 0 (eastus2 only - AWS Virginia)
#   - Region-02 only: 0 (centralus only - AWS Ohio)
#
#
# Variable Naming: enterprise_04_multi_service_rules

locals {
  # =========================================================================
  # COMMON RULES - Apply to BOTH Region-01 and Region-02
  # =========================================================================
  # These 58 rules are identical in both AWS regions
  
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
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-22-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 401
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-22-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 402
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-22-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 403
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-22-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 404
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-135-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 405
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-135-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 406
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-135-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 407
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-135-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 408
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-135-10-71-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 409
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-135-10-72-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 410
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-139-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 411
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-139-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 412
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-139-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 413
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-139-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 414
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-139-10-71-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 415
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-139-10-72-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 416
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-443-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 417
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-443-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 418
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-443-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 419
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-445-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 420
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-445-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 421
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-445-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 422
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-445-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 423
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-445-10-71-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 424
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-445-10-72-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 425
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-636-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 426
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-636-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 427
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-636-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 428
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-636-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 429
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-1858-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 430
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1858"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-1858-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 431
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1858"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-1858-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 432
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1858"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-1858-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 433
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1858"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-3389-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 434
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-3389-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 435
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-3389-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 436
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-3389-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 437
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-5500-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 438
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5500"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-5500-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 439
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5500"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-5500-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 440
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5500"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-5500-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 441
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5500"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 442
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 443
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 444
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 445
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-71-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 446
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-72-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 447
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-52731-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 448
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-52731-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 449
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-52731-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 450
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-52731-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 451
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-52731-10-71-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 452
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "tcp-52731-10-72-44-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 453
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "udp-1813-10-111-19-208-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 454
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1813"
      source_address_prefix      = "10.111.19.208/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "udp-1813-10-111-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 455
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1813"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "udp-1813-10-211-19-155-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 456
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1813"
      source_address_prefix      = "10.211.19.155/32"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
    "udp-1813-10-211-88-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 457
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1813"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 04 - Multi-Service Rule"
    }
  }

  # =========================================================================
  # REGION-01 ONLY RULES - Apply ONLY to Region-01 (eastus2)
  # =========================================================================
  # These 0 rules exist only in AWS us-east-1 (Virginia)
  # or have different definitions than Region-02
  # 
  # Note: Can reuse priorities 400-499 because this deploys to DIFFERENT NSG
  # than Region-02 rules (different Azure region = different NSG instance)
  
  multi_service_04_region_01 = {
    for k, v in {
      # No Region-01 specific rules currently
      # 
      # EXAMPLE: How to add a new Region-01 only rule:
      # 
      # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 458  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "3306"
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 04 - Multi-Service Rule"
      # }
    } : k => v if contains(local.region_01_locations, var.location)
  }

  # =========================================================================
  # REGION-02 ONLY RULES - Apply ONLY to Region-02 (centralus)
  # =========================================================================
  # These 0 rules exist only in AWS us-east-2 (Ohio)
  # or have different definitions than Region-01
  # 
  # Note: Can reuse priorities 400-499 for Region-02 only rules
  
  multi_service_04_region_02 = {
    for k, v in {
      # No Region-02 specific rules currently
      # 
      # EXAMPLE: How to add a new Region-02 only rule:
      # 
      # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 458  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "8080"
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 04 - Multi-Service Rule"
      # }
    } : k => v if contains(local.region_02_locations, var.location)
  }

  # =========================================================================
  # MERGE ALL MULTI-SERVICE ESR 04 RULES
  # =========================================================================
  
  enterprise_04_multi_service_rules = merge(
    local.multi_service_04_common,
    local.multi_service_04_region_01,
    local.multi_service_04_region_02
  )
}