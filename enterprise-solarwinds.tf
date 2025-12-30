# =============================================================================
# SolarWinds Monitoring Enterprise Security Group Rules
# =============================================================================
# This file contains enterprise-managed SolarWinds monitoring rules that are
# automatically applied to NSGs based on the deployment region.
#
# Region Mapping:
#   - AWS us-east-1 (Virginia)    → Azure eastus (East US - Virginia Primary)
#   - AWS us-east-2 (Ohio)        → Azure eastus2 (East US 2 - Virginia Secondary)
#
# Note: Azure doesn't have an Ohio datacenter. Both eastus and eastus2 are in
#       Virginia, but we maintain the AWS us-east-1 vs us-east-2 rule separation
#       for compatibility with your existing AWS setup.
#
# Rule Distribution:
#   - Common rules: 60 (apply to both eastus and eastus2)
#   - Virginia Primary only: 2 rules (eastus only)
#   - Virginia Secondary only: 0 rules (eastus2 - ready for future rules)
#   - Total unique rules: 62
#
# Priority Range: 160-221
# =============================================================================

locals {
  # =========================================================================
  # Region Mapping Configuration
  # =========================================================================
  # These values are used from ServiceNow ESG for consistency
  
  # Regions that should get "Virginia Primary" rules (from AWS us-east-1)
  virginia_primary_regions = ["eastus"]
  
  # Regions that should get "Virginia Secondary" rules (from AWS us-east-2)
  # Note: These were originally from AWS Ohio (us-east-2) but map to Azure eastus2
  virginia_secondary_regions = ["eastus2"]
  
  # =========================================================================
  # COMMON RULES - Apply to BOTH Virginia Primary and Virginia Secondary
  # =========================================================================
  # These 60 rules are identical in both AWS us-east-1 and us-east-2
  
  enterprise_solarwinds_common = {
    "all-all-0-0-0-0-0-outbound" = {
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 160
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "0.0.0.0/0"
      description                = "SolarWinds monitoring - ALL/all to 0.0.0.0/0"
    }
    "icmp--1-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 161
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "-1"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - ICMP/-1 from 10.111.14.232/32"
    }
    "tcp-22-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 162
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/22 from 10.111.14.232/32"
    }
    "tcp-22-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 163
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/22 from 10.111.14.233/32"
    }
    "tcp-23-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 164
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "23"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/23 from 10.111.14.232/32"
    }
    "tcp-23-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 165
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "23"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/23 from 10.111.14.233/32"
    }
    "tcp-25-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 166
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "25"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/25 from 10.111.14.232/32"
    }
    "tcp-25-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 167
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "25"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/25 from 10.111.14.233/32"
    }
    "tcp-53-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 168
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/53 from 10.111.14.232/32"
    }
    "tcp-53-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 169
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/53 from 10.111.14.233/32"
    }
    "tcp-80-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 170
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/80 from 10.111.14.232/32"
    }
    "tcp-80-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 171
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/80 from 10.111.14.233/32"
    }
    "tcp-135-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 172
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/135 from 10.111.14.232/32"
    }
    "tcp-135-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 173
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/135 from 10.111.14.233/32"
    }
    "tcp-139-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 174
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/139 from 10.111.14.232/32"
    }
    "tcp-139-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 175
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/139 from 10.111.14.233/32"
    }
    "tcp-443-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 176
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/443 from 10.111.14.232/32"
    }
    "tcp-443-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 177
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/443 from 10.111.14.233/32"
    }
    "tcp-445-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 178
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/445 from 10.111.14.232/32"
    }
    "tcp-445-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 179
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/445 from 10.111.14.233/32"
    }
    "tcp-465-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 180
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "465"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/465 from 10.111.14.232/32"
    }
    "tcp-465-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 181
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "465"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/465 from 10.111.14.233/32"
    }
    "tcp-587-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 182
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "587"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/587 from 10.111.14.232/32"
    }
    "tcp-587-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 183
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "587"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/587 from 10.111.14.233/32"
    }
    "tcp-1024-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 184
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1024 from 10.111.14.232/32"
    }
    "tcp-1024-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 185
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1024 from 10.111.14.233/32"
    }
    "tcp-1025-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 186
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1025"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1025 from 10.111.14.232/32"
    }
    "tcp-1025-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 187
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1025"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1025 from 10.111.14.233/32"
    }
    "tcp-1026-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 188
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1026"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1026 from 10.111.14.232/32"
    }
    "tcp-1026-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 189
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1026"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1026 from 10.111.14.233/32"
    }
    "tcp-1027-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 190
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1027"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1027 from 10.111.14.232/32"
    }
    "tcp-1027-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 191
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1027"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1027 from 10.111.14.233/32"
    }
    "tcp-1028-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 192
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1028"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1028 from 10.111.14.232/32"
    }
    "tcp-1028-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 193
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1028"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1028 from 10.111.14.233/32"
    }
    "tcp-1029-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 194
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1029"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1029 from 10.111.14.232/32"
    }
    "tcp-1029-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 195
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1029"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1029 from 10.111.14.233/32"
    }
    "tcp-1030-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 196
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1030"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1030 from 10.111.14.232/32"
    }
    "tcp-1031-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 197
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1031"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1031 from 10.111.14.232/32"
    }
    "tcp-1032-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 198
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1032"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1032 from 10.111.14.232/32"
    }
    "tcp-1033-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 199
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1033"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1033 from 10.111.14.232/32"
    }
    "tcp-1034-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 200
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1034"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1034 from 10.111.14.232/32"
    }
    "tcp-1433-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 201
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1433 from 10.111.14.232/32"
    }
    "tcp-1801-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 202
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1801"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/1801 from 10.111.14.232/32"
    }
    "tcp-5671-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 203
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5671"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/5671 from 10.111.14.232/32"
    }
    "tcp-17777-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 204
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17777"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/17777 from 10.111.14.232/32"
    }
    "tcp-17778-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 205
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17778"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/17778 from 10.111.14.232/32"
    }
    "tcp-17791-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 206
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17791"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - TCP/17791 from 10.111.14.232/32"
    }
    "udp-53-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 207
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - UDP/53 from 10.111.14.232/32"
    }
    "udp-53-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 208
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - UDP/53 from 10.111.14.233/32"
    }
    "udp-137-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 209
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - UDP/137 from 10.111.14.232/32"
    }
    "udp-137-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 210
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - UDP/137 from 10.111.14.233/32"
    }
    "udp-138-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 211
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "138"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - UDP/138 from 10.111.14.232/32"
    }
    "udp-138-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 212
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "138"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - UDP/138 from 10.111.14.233/32"
    }
    "udp-161-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 213
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - UDP/161 from 10.111.14.232/32"
    }
    "udp-161-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 214
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - UDP/161 from 10.111.14.233/32"
    }
    "udp-162-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 215
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "162"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - UDP/162 from 10.111.14.232/32"
    }
    "udp-162-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 216
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "162"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - UDP/162 from 10.111.14.233/32"
    }
    "udp-1024-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 217
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - UDP/1024 from 10.111.14.232/32"
    }
    "udp-1024-10-111-14-233-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 218
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - UDP/1024 from 10.111.14.233/32"
    }
    "udp-1434-10-111-14-232-32-inbound" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 219
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1434"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "SolarWinds monitoring - UDP/1434 from 10.111.14.232/32"
    }
  }

  # =========================================================================
  # VIRGINIA PRIMARY ONLY - Apply ONLY to eastus
  # =========================================================================
  # These 2 rules exist only in AWS us-east-1 (Virginia)
  # Dynamic port ranges for SolarWinds monitoring servers
  
  enterprise_solarwinds_virginia_primary = {
    for k, v in {
      "tcp-49152-65535-10-111-14-232-32-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 220
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.111.14.232/32"
        destination_address_prefix = "*"
        description                = "SolarWinds monitoring - TCP/49152-65535 from 10.111.14.232/32 (Virginia Primary only)"
      }
      "tcp-49152-65535-10-120-7-135-32-inbound" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 221
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.120.7.135/32"
        destination_address_prefix = "*"
        description                = "SolarWinds monitoring - TCP/49152-65535 from 10.120.7.135/32 (Virginia Primary only)"
      }
    } : k => v if contains(local.virginia_primary_regions, var.location)
  }

  # =========================================================================
  # VIRGINIA SECONDARY ONLY - Apply ONLY to eastus2
  # =========================================================================
  # Currently empty - no rules specific to AWS us-east-2 (Ohio)
  # This block is ready for future Virginia Secondary-specific rules
  # 
  # When adding rules here:
  # - Start with priority 222
  # - Follow the same format as Virginia Primary block above
  # - Rules will only apply when deployed to eastus2
  
  enterprise_solarwinds_virginia_secondary = {
    for k, v in {
      # Add Virginia Secondary-specific rules here in the future
      # Example:
      # "tcp-8080-10-120-7-200-32-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 222
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "8080"
      #   source_address_prefix      = "10.120.7.200/32"
      #   destination_address_prefix = "*"
      #   description                = "SolarWinds monitoring - TCP/8080 from 10.120.7.200/32 (Virginia Secondary only)"
      # }
    } : k => v if contains(local.virginia_secondary_regions, var.location)
  }

  # =========================================================================
  # MERGE ALL SOLARWINDS RULES
  # =========================================================================
  # Common rules always apply
  # Virginia Primary rules only apply when deployed to eastus
  # Virginia Secondary rules only apply when deployed to eastus2
  
  enterprise_solarwinds_rules = merge(
    local.enterprise_solarwinds_common,
    local.enterprise_solarwinds_virginia_primary,
    local.enterprise_solarwinds_virginia_secondary
  )
}