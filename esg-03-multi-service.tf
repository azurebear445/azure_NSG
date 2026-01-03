# =============================================================================
# Multi-Service Enterprise Security Group Rules (ESG 03)
# =============================================================================
# This file contains enterprise-managed rules for multiple monitoring and
# management services (SolarWinds Azure pollers, Delinea server).
#
# Region Mapping:
#   - Primary regions   → Currently: eastus2 (was AWS us-east-1 Virginia)
#   - Secondary regions → Currently: centralus (was AWS us-east-2 Ohio)
#
# Note: Region names are kept in comments. Code uses generic primary/secondary.
#
# Priority Block: 300-399 (100 total slots)
#   - Currently used: 300-360 (61 rules)
#   - Reserved for future: 361-399 (39 slots)
#
# Rule Distribution:
#   - Common rules: 61 (apply to both regions)
#   - Primary-only: 0
#   - Secondary-only: 0
#
# Note: Primary and secondary can reuse same priorities (300-399) because
#       they deploy to DIFFERENT NSGs in DIFFERENT regions - no conflicts!
#
# Variable Naming: enterprise_03_multi_service_rules
# =============================================================================

locals {
  # =========================================================================
  # COMMON RULES - Apply to BOTH Primary and Secondary
  # =========================================================================
  # These 61 rules are identical in both regions
  
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
      description                = "Multi-service monitoring - ALL/all to 0.0.0.0/0"
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
      description                = "Multi-service monitoring - ICMP/any from 10.111.14.233/32"
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
      description                = "Multi-service monitoring - ICMP/any from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - ICMP/any from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/22 from 10.1.249.31/32"
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
      description                = "Multi-service monitoring - TCP/22 from 10.1.82.254/32"
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
      description                = "Multi-service monitoring - TCP/22-23 from 10.111.14.80/32"
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
      description                = "Multi-service monitoring - TCP/22-23 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - TCP/22-23 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/22 from 10.20.68.72/32"
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
      description                = "Multi-service monitoring - TCP/22 from 10.81.1.113/32"
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
      description                = "Multi-service monitoring - TCP/25 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - TCP/25 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/53 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - TCP/53 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/80 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - TCP/80 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/135 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - TCP/135 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/139 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - TCP/139 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/443 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - TCP/443 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/445 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - TCP/445 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/465 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - TCP/465 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/587 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - TCP/587 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/1024-1034 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - TCP/1024-1034 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/1030 from 10.111.14.233/32"
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
      description                = "Multi-service monitoring - TCP/1031 from 10.111.14.233/32"
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
      description                = "Multi-service monitoring - TCP/1032 from 10.111.14.233/32"
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
      description                = "Multi-service monitoring - TCP/1033 from 10.111.14.233/32"
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
      description                = "Multi-service monitoring - TCP/1034 from 10.111.14.233/32"
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
      description                = "Multi-service monitoring - TCP/1433 from 10.111.14.233/32"
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
      description                = "Multi-service monitoring - TCP/1433 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/1801 from 10.111.14.233/32"
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
      description                = "Multi-service monitoring - TCP/1801 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/5671 from 10.111.14.233/32"
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
      description                = "Multi-service monitoring - TCP/5671 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/17777 from 10.111.14.233/32"
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
      description                = "Multi-service monitoring - TCP/17777-17778 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/17778 from 10.111.14.233/32"
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
      description                = "Multi-service monitoring - TCP/17791 from 10.111.14.233/32"
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
      description                = "Multi-service monitoring - TCP/17791 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - TCP/49152-65535 from 10.111.14.233/32"
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
      description                = "Multi-service monitoring - TCP/49152-65535 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - UDP/53 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - UDP/53 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - UDP/137-138 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - UDP/137-138 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - UDP/161-162 from 10.110.34.0/24"
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
      description                = "Multi-service monitoring - UDP/161-162 from 10.111.32.0/24"
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
      description                = "Multi-service monitoring - UDP/161-162 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - UDP/161-162 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - UDP/1024 from 10.120.7.135/32"
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
      description                = "Multi-service monitoring - UDP/1024 from 10.120.7.142/32"
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
      description                = "Multi-service monitoring - UDP/1434 from 10.111.14.233/32"
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
      description                = "Multi-service monitoring - UDP/1434 from 10.120.7.142/32"
    }
  }

  # =========================================================================
  # PRIMARY-ONLY RULES - Apply ONLY to Primary Regions (eastus2)
  # =========================================================================
  # Currently empty - all rules are common to both regions
  # This block is ready for future primary-specific rules
  # 
  # Note: Can reuse priorities 300-399 because this deploys to DIFFERENT NSG
  # than secondary (different region = different NSG instance)
  
  multi_service_03_primary = {
    for k, v in {
      # Add primary-specific rules here in the future
      # Start with priority 361 (or reuse 300-360 for region-specific versions)
    } : k => v if contains(local.primary_regions, var.location)
  }

  # =========================================================================
  # SECONDARY-ONLY RULES - Apply ONLY to Secondary Regions (centralus)
  # =========================================================================
  # Currently empty - all rules are common to both regions
  # This block is ready for future secondary-specific rules
  # 
  # Note: Can reuse priorities 300-399 for secondary-only rules
  
  multi_service_03_secondary = {
    for k, v in {
      # Add secondary-specific rules here in the future
      # Start with priority 361 (or reuse 300-360 for region-specific versions)
    } : k => v if contains(local.secondary_regions, var.location)
  }

  # =========================================================================
  # MERGE ALL MULTI-SERVICE ESG 03 RULES
  # =========================================================================
  
  enterprise_03_multi_service_rules = merge(
    local.multi_service_03_common,
    local.multi_service_03_primary,
    local.multi_service_03_secondary
  )
}