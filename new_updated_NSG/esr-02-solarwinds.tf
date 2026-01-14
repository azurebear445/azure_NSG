# SolarWinds Monitoring Enterprise Security Rule Rules (ESR 02)
# This file contains enterprise-managed SolarWinds monitoring rules.
#
# Region Mapping:
# Region-01: eastus | Region-02: eastus2 | Region-03: northcentralus (common only)
#
#
# Priority Block: 200-299 (100 total slots)
#   - Currently used: 200-261 (62 rules max)
#   - Reserved for future: 262-299 (38 slots)
#
# Rule Distribution:
#   - Common rules: 60 (apply to both regions)
#   - Region-01 only: 2 (eastus only dynamic ports)
#   - Region-02 only: 0
#
#
# Variable Naming: enterprise_02_solarwinds_rules

locals {
    # Common rules - Apply to all regions
     60 rules are identical in both AWS regions
  
  solarwinds_02_common = {
    "all-all-0-0-0-0-0-outbound" = {
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 200
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "0.0.0.0/0"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "icmp-any-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 201
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-22-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 202
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-22-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 203
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-23-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 204
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "23"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-23-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 205
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "23"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-25-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 206
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "25"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-25-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 207
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "25"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-53-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 208
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-53-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 209
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-80-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 210
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-80-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 211
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-135-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 212
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-135-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 213
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-139-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 214
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-139-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 215
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-443-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 216
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-443-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 217
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-445-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 218
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-445-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 219
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-465-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 220
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "465"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-465-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 221
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "465"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-587-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 222
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "587"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-587-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 223
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "587"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1024-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 224
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1024-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 225
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1025-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 226
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1025"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1025-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 227
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1025"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1026-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 228
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1026"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1026-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 229
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1026"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1027-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 230
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1027"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1027-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 231
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1027"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1028-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 232
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1028"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1028-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 233
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1028"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1029-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 234
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1029"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1029-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 235
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1029"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1030-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 236
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1030"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1031-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 237
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1031"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1032-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 238
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1032"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1033-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 239
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1033"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1034-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 240
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1034"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1433-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 241
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-1801-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 242
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1801"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-5671-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 243
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5671"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-17777-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 244
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17777"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-17778-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 245
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17778"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "tcp-17791-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 246
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17791"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "udp-53-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 247
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "udp-53-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 248
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "udp-137-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 249
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "udp-137-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 250
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "udp-138-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 251
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "138"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "udp-138-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 252
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "138"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "udp-161-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 253
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "udp-161-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 254
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "udp-162-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 255
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "162"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "udp-162-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 256
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "162"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "udp-1024-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 257
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "udp-1024-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 258
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
    "udp-1434-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 259
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1434"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule"
    }
  }

    # Region-01 only (eastus)
     2 rules exist only in AWS us-east-1 (Virginia)
  # Dynamic port ranges for SolarWinds Azure pollers
  # than Region-02 (different Azure region = different NSG instance)
  
  solarwinds_02_region_01 = {
      "tcp-49152-65535-10-111-14-232-32-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 260
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.111.14.232/32"
        destination_address_prefix = "*"
        description                = "ESR 02 - SolarWinds Rule"
      }
      "tcp-49152-65535-10-120-7-135-32-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 261
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.120.7.135/32"
        destination_address_prefix = "*"
        description                = "ESR 02 - SolarWinds Rule"
      }
  }

    # Region-02 only (eastus2)
    # Currently empty - all non-common rules are Region-01 only
  # This block is ready for future Region-02 specific rules
  
  solarwinds_02_region_02 = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
          # "tcp-9090-172-16-0-0-16-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 260  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "9090"
      #   source_address_prefix      = "172.16.0.0/16"
      #   destination_address_prefix = "*"
      #   description                = "ESR 02 - SolarWinds Rule"
      # }
  }

      
  enterprise_02_solarwinds_rules = merge(
    local.solarwinds_02_common,
    var.location == "eastus" ? local.solarwinds_02_region_01 : {},
    var.location == "eastus2" ? local.solarwinds_02_region_02 : {}
  )
}