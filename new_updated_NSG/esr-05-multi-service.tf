# Multi-Service Enterprise Security Rules (ESR 05)
# This file contains enterprise-managed rules for multiple monitoring and
# management services.
#
# Priority Block: 500-599 (100 total slots)
#   - Currently used: 500-563 (64 rules)
#   - Reserved for future: 564-599 (36 slots)
#
# Rule Distribution:
#   - Common rules: 54 (apply to both regions)
#   - Region-01 only: 4 (eastus only)
#   - Region-02 only: 6 (northcentralus only)
#
#
# Variable Naming: enterprise_05_multi_service_rules
locals {
    # Common rules - Apply to all regions
  multi_service_05_common = {
    "tcp-22-10-110-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 500
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.110.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-22-10-111-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 501
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-22-10-211-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 502
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-88-10-111-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 503
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "88"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-88-10-211-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 504
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "88"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-135-139-10-111-14-104-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 505
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135-139"
      source_address_prefix      = "10.111.14.104/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-135-139-10-111-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 506
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135-139"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-135-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 507
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-135-139-10-211-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 508
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135-139"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-139-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 509
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-389-10-111-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 510
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "389"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-389-10-211-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 511
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "389"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-443-10-111-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 512
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-443-10-211-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 513
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-445-10-111-14-104-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 514
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.14.104/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-445-10-111-14-189-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 515
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.14.189/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-445-10-111-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 516
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-445-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 517
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-445-10-211-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 518
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-636-10-111-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 519
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-636-10-211-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 520
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-1024-65535-10-111-88-155-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 521
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-65535"
      source_address_prefix      = "10.111.88.155/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-1024-65535-10-111-88-156-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 522
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-65535"
      source_address_prefix      = "10.111.88.156/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-1024-65535-10-111-88-180-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 523
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-65535"
      source_address_prefix      = "10.111.88.180/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-1024-65535-10-211-88-143-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 524
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-65535"
      source_address_prefix      = "10.211.88.143/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-1433-10-1-249-31-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 525
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.1.249.31/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-1433-10-111-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 526
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-1433-10-211-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 527
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-3389-10-110-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 528
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "10.110.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-4431-10-111-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 529
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4431"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-4431-10-211-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 530
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4431"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-4699-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 531
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4699"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-4972-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 532
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4972"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-4974-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 533
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4974"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-5985-5986-10-111-14-104-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 534
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5985-5986"
      source_address_prefix      = "10.111.14.104/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-15671-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 535
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "15671"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-111-14-104-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 536
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.111.14.104/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-49153-49156-10-111-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 537
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49153-49156"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-49153-49156-10-211-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 538
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49153-49156"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-52311-10-111-14-189-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 539
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52311"
      source_address_prefix      = "10.111.14.189/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-52311-10-111-14-26-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 540
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52311"
      source_address_prefix      = "10.111.14.26/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-52311-10-111-14-48-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 541
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52311"
      source_address_prefix      = "10.111.14.48/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-52731-10-1-249-31-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 542
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.1.249.31/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-52731-10-110-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 543
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.110.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-52731-10-111-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 544
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-52731-10-211-88-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 545
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.211.88.0/24"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "tcp-60777-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 546
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "60777"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "udp-137-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 547
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "udp-138-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 548
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "138"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "udp-52311-10-111-14-189-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 549
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "52311"
      source_address_prefix      = "10.111.14.189/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "udp-52311-10-111-14-26-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 550
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "52311"
      source_address_prefix      = "10.111.14.26/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "udp-52311-10-111-14-48-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 551
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "52311"
      source_address_prefix      = "10.111.14.48/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "icmp--1-10-111-14-104-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 552
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.111.14.104/32"
      destination_address_prefix = "*"
      description                = "ESR 05 - Multi-Service Rule"
    }
    "all-all-0-0-0-0-0-egress" = {
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 553
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "0.0.0.0/0"
      description                = "ESR 05 - Multi-Service Rule"
    }
  }
    # Region-01 only (eastus)
  multi_service_05_region_01 = {
      "tcp-0-65535-10-111-100-235-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 554
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "0-65535"
        source_address_prefix      = "10.111.100.235/32"
        destination_address_prefix = "*"
        description                = "ESR 05 - Multi-Service Rule"
      }
      "tcp-0-65535-10-111-100-244-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 555
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "0-65535"
        source_address_prefix      = "10.111.100.244/32"
        destination_address_prefix = "*"
        description                = "ESR 05 - Multi-Service Rule"
      }
      "tcp-0-65535-10-111-100-246-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 556
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "0-65535"
        source_address_prefix      = "10.111.100.246/32"
        destination_address_prefix = "*"
        description                = "ESR 05 - Multi-Service Rule"
      }
      "tcp-0-65535-10-111-100-247-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 557
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "0-65535"
        source_address_prefix      = "10.111.100.247/32"
        destination_address_prefix = "*"
        description                = "ESR 05 - Multi-Service Rule"
      }
  }
    # Region-02 only (northcentralus)
  multi_service_05_region_02 = {
      "tcp-135-10-20-60-110-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 558
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "135"
        source_address_prefix      = "10.20.60.110/32"
        destination_address_prefix = "*"
        description                = "ESR 05 - Multi-Service Rule"
      }
      "tcp-445-10-20-60-110-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 559
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "445"
        source_address_prefix      = "10.20.60.110/32"
        destination_address_prefix = "*"
        description                = "ESR 05 - Multi-Service Rule"
      }
      "tcp-5985-10-20-60-110-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 560
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5985"
        source_address_prefix      = "10.20.60.110/32"
        destination_address_prefix = "*"
        description                = "ESR 05 - Multi-Service Rule"
      }
      "tcp-5986-10-20-60-110-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 561
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5986"
        source_address_prefix      = "10.20.60.110/32"
        destination_address_prefix = "*"
        description                = "ESR 05 - Multi-Service Rule"
      }
      "tcp-49152-65535-10-20-60-110-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 562
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.20.60.110/32"
        destination_address_prefix = "*"
        description                = "ESR 05 - Multi-Service Rule"
      }
      "icmp--1-10-20-60-110-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 563
        protocol                   = "Icmp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "10.20.60.110/32"
        destination_address_prefix = "*"
        description                = "ESR 05 - Multi-Service Rule"
      }
  }
  enterprise_05_multi_service_rules = merge(
    local.multi_service_05_common,
    var.location == "eastus" ? local.multi_service_05_region_01 : {},
    var.location == "northcentralus" ? local.multi_service_05_region_02 : {}
  )
}
