# Multi-Service Enterprise Security Rule Rules (ESR 03)
# This file contains enterprise-managed rules for multiple monitoring and
# management services (SolarWinds Azure pollers, Delinea server).
#
# Region Mapping:
# Region-01: eastus | Region-02: eastus2 | Region-03: northcentralus (common only)
#
#
# Priority Block: 300-399 (100 total slots)
#   - Currently used: 300-360 (61 rules)
#   - Reserved for future: 361-399 (39 slots)
#
# Rule Distribution:
#   - Common rules: 61 (apply to both regions)
#   - Region-01 only: 0
#   - Region-02 only: 0
#
#
# Variable Naming: enterprise_03_multi_service_rules
locals {
    # Common rules - Apply to all regions
     61 rules are identical in both AWS regions
  multi_service_03_common = {
    "all-all-0-0-0-0-0-outbound" = {
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 300
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "0.0.0.0/0"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "icmp-any-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 301
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "icmp-any-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 302
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "icmp-any-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 303
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-22-10-1-249-31-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 304
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.1.249.31/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-22-10-1-82-254-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 305
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.1.82.254/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-22-23-10-111-14-80-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 306
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22-23"
      source_address_prefix      = "10.111.14.80/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-22-23-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 307
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22-23"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-22-23-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 308
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22-23"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-22-10-20-68-72-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 309
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.20.68.72/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-22-10-81-1-113-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 310
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.81.1.113/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-25-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 311
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "25"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-25-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 312
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "25"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-53-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 313
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-53-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 314
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-80-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 315
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-80-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 316
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-135-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 317
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-135-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 318
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-139-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 319
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-139-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 320
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-443-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 321
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-443-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 322
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-445-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 323
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-445-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 324
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-465-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 325
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "465"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-465-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 326
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "465"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-587-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 327
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "587"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-587-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 328
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "587"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-1024-1034-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 329
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-1034"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-1024-1034-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 330
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-1034"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-1030-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 331
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1030"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-1031-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 332
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1031"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-1032-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 333
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1032"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-1033-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 334
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1033"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-1034-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 335
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1034"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-1433-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 336
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-1433-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 337
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-1801-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 338
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1801"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-1801-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 339
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1801"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-5671-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 340
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5671"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-5671-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 341
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5671"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-17777-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 342
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17777"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-17777-17778-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 343
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17777-17778"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-17778-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 344
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17778"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-17791-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 345
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17791"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-17791-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 346
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17791"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 347
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 348
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "udp-53-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 349
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "udp-53-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 350
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "udp-137-138-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 351
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137-138"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "udp-137-138-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 352
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137-138"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "udp-161-162-10-110-34-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 353
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161-162"
      source_address_prefix      = "10.110.34.0/24"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "udp-161-162-10-111-32-0-24-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 354
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161-162"
      source_address_prefix      = "10.111.32.0/24"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "udp-161-162-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 355
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161-162"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "udp-161-162-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 356
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161-162"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "udp-1024-10-120-7-135-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 357
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "udp-1024-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 358
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "udp-1434-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 359
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1434"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
    "udp-1434-10-120-7-142-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 360
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1434"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule"
    }
  }
    # Region-01 only (eastus)
    # Currently empty - all rules are common to both regions
  # This block is ready for future Region-01 specific rules
  # than Region-02 (different Azure region = different NSG instance)
  multi_service_03_region_01 = {
      # No Region-01 specific rules currently
          # EXAMPLE: How to add a new Region-01 only rule:
          # "tcp-5432-10-50-0-0-16-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 361  # Next available priority (or reuse 300-360)
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "5432"
      #   source_address_prefix      = "10.50.0.0/16"
      #   destination_address_prefix = "*"
      #   description                = "ESR 03 - Multi-Service Rule"
      # }
  }
    # Region-02 only (eastus2)
    # Currently empty - all rules are common to both regions
  # This block is ready for future Region-02 specific rules
  multi_service_03_region_02 = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
          # "udp-161-10-60-0-0-16-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 361  # Next available priority (or reuse 300-360)
      #   protocol                   = "Udp"
      #   source_port_range          = "*"
      #   destination_port_range     = "161"
      #   source_address_prefix      = "10.60.0.0/16"
      #   destination_address_prefix = "*"
      #   description                = "ESR 03 - Multi-Service Rule"
      # }
  }
  enterprise_03_multi_service_rules = merge(
    local.multi_service_03_common,
    var.location == "eastus" ? local.multi_service_03_region_01 : {},
    var.location == "eastus2" ? local.multi_service_03_region_02 : {}
  )
}