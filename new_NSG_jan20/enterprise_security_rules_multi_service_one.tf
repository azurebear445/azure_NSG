# Enterprise Security Rules - Multi-Service
# Priority Block: 300-399
#   Currently used: 300-360 (61 rules)
#   Reserved for future: 361-399 (39 slots)

locals {
    # Common rules - Apply to all regions
  multi_service_three_common = {
    "Allow-MultiService_All_AllPorts_Out" = {
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 300
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "0.0.0.0/0"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_ICMP_AllPorts_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 301
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_ICMP_AllPorts_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 302
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_ICMP_AllPorts_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 303
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_22_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 304
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.1.249.31/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_22_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 305
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.1.82.254/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_22to23_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 306
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22-23"
      source_address_prefix      = "10.111.14.80/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_22to23_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 307
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22-23"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_22to23_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 308
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22-23"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_22_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 309
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.20.68.72/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_22_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 310
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.81.1.113/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_25_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 311
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "25"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_25_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 312
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "25"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_53_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 313
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_53_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 314
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_80_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 315
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_80_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 316
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_135_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 317
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_135_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 318
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_139_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 319
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_139_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 320
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_443_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 321
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_443_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 322
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_445_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 323
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_445_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 324
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_465_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 325
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "465"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_465_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 326
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "465"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_587_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 327
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "587"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_587_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 328
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "587"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1024to1034_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 329
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-1034"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1024to1034_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 330
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-1034"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1030_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 331
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1030"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1031_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 332
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1031"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1032_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 333
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1032"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1033_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 334
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1033"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1034_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 335
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1034"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1433_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 336
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1433_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 337
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1801_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 338
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1801"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1801_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 339
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1801"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_5671_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 340
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5671"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_5671_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 341
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5671"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_17777_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 342
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17777"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_17777to17778_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 343
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17777-17778"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_17778_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 344
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17778"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_17791_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 345
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17791"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_17791_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 346
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17791"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_49152to65535_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 347
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_49152to65535_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 348
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_53_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 349
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_53_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 350
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_137to138_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 351
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137-138"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_137to138_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 352
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137-138"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_161to162_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 353
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161-162"
      source_address_prefix      = "10.110.34.0/24"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_161to162_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 354
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161-162"
      source_address_prefix      = "10.111.32.0/24"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_161to162_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 355
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161-162"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_161to162_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 356
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161-162"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_1024_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 357
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.120.7.135/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_1024_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 358
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_1434_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 359
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1434"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_1434_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 360
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1434"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "ESR 03 - Multi-Service Rule."
    }
  }
    # Region-01 only (eastus)
    # Currently empty - all rules are common to both regions
  # This block is ready for future Region-01 specific rules
  multi_service_three_region_eastus = {
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
      #   description                = "ESR 03 - Multi-Service Rule."
      # }
  }
    # Region-02 only (northcentralus)
    # Currently empty - all rules are common to both regions
  # This block is ready for future Region-02 specific rules
  multi_service_three_region_northcentralus = {
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
      #   description                = "ESR 03 - Multi-Service Rule."
      # }
  }
  enterprise_multi_service_three_rules = merge(
    local.multi_service_three_common,
    var.location == "eastus" ? local.multi_service_three_region_eastus : {},
    var.location == "northcentralus" ? local.multi_service_three_region_northcentralus : {}
  )
}