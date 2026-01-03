# =============================================================================
# Multi-Service Enterprise Security Group Rules (ESG 03)
# =============================================================================
# This file contains enterprise-managed rules for multiple monitoring and
# management services (SolarWinds Azure pollers, Delinea server).
#
# Region Mapping:
#   - Primary regions   → Currently: eastus (was AWS us-east-1 Virginia)
#   - Secondary regions → Currently: eastus2 (was AWS us-east-2 Ohio)
#
# Note: Region names (Virginia/Ohio) are kept in comments for reference,
#       but the code uses generic "primary" and "secondary" for flexibility.
#
# Note: Azure doesn't have an Ohio datacenter. Both eastus and eastus2 are in
#       Virginia, but we maintain the AWS us-east-1 vs us-east-2 rule separation
#       for compatibility with your existing AWS setup.
#
# Rule Distribution:
#   - Common rules: 61 (apply to both eastus and eastus2)
#   - Virginia Primary only: 0 rules
#   - Virginia Secondary only: 0 rules
#   - Total unique rules: 61
#
# Priority Range: 222-282 (61 rules)
#
# Variable Naming: enterprise_03_multi_service_rules
# (Matches file pattern: esg-03-multi-service.tf)
# =============================================================================

locals {
  # =========================================================================
  # COMMON RULES - Apply to BOTH Virginia Primary and Virginia Secondary
  # =========================================================================
  # These 61 rules are identical in both AWS us-east-1 and us-east-2
  # Region variables (primary_regions, secondary_regions)
  # are defined in locals.tf to avoid duplication across ESG files
  
  multi_service_03_common = {
    "all-all-0-0-0-0-0-outbound" = {
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 222
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
      priority                   = 223
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
      priority                   = 224
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
      priority                   = 225
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
      priority                   = 226
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
      priority                   = 227
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
      priority                   = 228
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
      priority                   = 229
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
      priority                   = 230
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
      priority                   = 231
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
      priority                   = 232
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
      priority                   = 233
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
      priority                   = 234
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
      priority                   = 235
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
      priority                   = 236
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
      priority                   = 237
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
      priority                   = 238
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
      priority                   = 239
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
      priority                   = 240
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
      priority                   = 241
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
      priority                   = 242
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
      priority                   = 243
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
      priority                   = 244
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
      priority                   = 245
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
      priority                   = 246
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
      priority                   = 247
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
      priority                   = 248
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
      priority                   = 249
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
      priority                   = 250
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
      priority                   = 251
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
      priority                   = 252
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
      priority                   = 253
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
      priority                   = 254
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
      priority                   = 255
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
      priority                   = 256
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
      priority                   = 257
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
      priority                   = 258
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
      priority                   = 259
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
      priority                   = 260
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
      priority                   = 261
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
      priority                   = 262
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
      priority                   = 263
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
      priority                   = 264
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
      priority                   = 265
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
      priority                   = 266
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
      priority                   = 267
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
      priority                   = 268
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
      priority                   = 269
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
      priority                   = 270
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
      priority                   = 271
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
      priority                   = 272
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
      priority                   = 273
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
      priority                   = 274
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
      priority                   = 275
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
      priority                   = 276
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
      priority                   = 277
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
      priority                   = 278
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
      priority                   = 279
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
      priority                   = 280
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
      priority                   = 281
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
      priority                   = 282
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1434"
      source_address_prefix      = "10.120.7.142/32"
      destination_address_prefix = "*"
      description                = "Multi-service monitoring - UDP/1434 from 10.120.7.142/32"
    }
  }

  # =========================================================================
  # VIRGINIA PRIMARY ONLY - Apply ONLY to eastus
  # =========================================================================
  # Currently empty - all rules are common to both regions
  # This block is ready for future Virginia Primary-specific rules
  # 
  # When adding rules here:
  # - Start with priority 283
  # - Follow the same format as common rules above
  # - Rules will only apply when deployed to eastus
  
  multi_service_03_primary = {
    for k, v in {
      # Add Virginia Primary-specific rules here in the future
    } : k => v if contains(local.primary_regions, var.location)
  }

  # =========================================================================
  # VIRGINIA SECONDARY ONLY - Apply ONLY to eastus2
  # =========================================================================
  # Currently empty - all rules are common to both regions
  # This block is ready for future Virginia Secondary-specific rules
  # 
  # When adding rules here:
  # - Start with priority 283
  # - Follow the same format as common rules above
  # - Rules will only apply when deployed to eastus2
  
  multi_service_03_secondary = {
    for k, v in {
      # Add Virginia Secondary-specific rules here in the future
    } : k => v if contains(local.secondary_regions, var.location)
  }

  # =========================================================================
  # MERGE ALL MULTI-SERVICE ESG 03 RULES
  # =========================================================================
  # Common rules always apply
  # Virginia Primary rules only apply when deployed to eastus
  # Virginia Secondary rules only apply when deployed to eastus2
  
  enterprise_03_multi_service_rules = merge(
    local.multi_service_03_common,
    local.multi_service_03_primary,
    local.multi_service_03_secondary
  )
}