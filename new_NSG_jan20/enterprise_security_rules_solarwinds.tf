# Enterprise Security Rules - SolarWinds
# Priority Block: 200-299
#   Currently used: Unknown (Unknown rules)
#   Reserved for future: 262-299 (38 slots)

locals {
    # Common rules - Apply to all regions
  solarwinds_common = var.enable_enterprise_security_rules ? {
    "Allow-SolarWinds_All_AllPorts_Out" = {
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 200
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "0.0.0.0/0"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_ICMP_AllPorts_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 201
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_22_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 202
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_22_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 203
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_23_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 204
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "23"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_23_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 205
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "23"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_25_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 206
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "25"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_25_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 207
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "25"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_53_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 208
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_53_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 209
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_80_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 210
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_80_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 211
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_135_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 212
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_135_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 213
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_139_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 214
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_139_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 215
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_443_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 216
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_443_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 217
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_445_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 218
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_445_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 219
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_465_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 220
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "465"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_465_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 221
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "465"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_587_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 222
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "587"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_587_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 223
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "587"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1024_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 224
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1024_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 225
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1025_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 226
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1025"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1025_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 227
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1025"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1026_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 228
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1026"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1026_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 229
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1026"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1027_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 230
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1027"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1027_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 231
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1027"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1028_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 232
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1028"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1028_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 233
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1028"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1029_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 234
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1029"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1029_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 235
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1029"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1030_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 236
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1030"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1031_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 237
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1031"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1032_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 238
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1032"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1033_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 239
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1033"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1034_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 240
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1034"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1433_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 241
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_1801_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 242
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1801"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_5671_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 243
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5671"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_17777_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 244
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17777"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_17778_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 245
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17778"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_TCP_17791_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 246
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17791"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_UDP_53_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 247
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_UDP_53_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 248
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_UDP_137_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 249
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_UDP_137_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 250
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_UDP_138_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 251
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "138"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_UDP_138_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 252
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "138"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_UDP_161_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 253
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_UDP_161_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 254
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_UDP_162_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 255
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "162"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_UDP_162_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 256
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "162"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_UDP_1024_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 257
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_UDP_1024_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 258
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.111.14.233/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
    "Allow-SolarWinds_UDP_1434_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 259
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1434"
      source_address_prefix      = "10.111.14.232/32"
      destination_address_prefix = "*"
      description                = "ESR 02 - SolarWinds Rule."
    }
  } : {}
    # Region-01 only (eastus)
  # Dynamic port ranges for SolarWinds Azure pollers
  solarwinds_region_eastus = var.enable_enterprise_security_rules ? {
      "Allow-SolarWinds_TCP_49152to65535_In" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 260
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.111.14.232/32"
        destination_address_prefix = "*"
        description                = "ESR 02 - SolarWinds Rule."
      }
      "Allow-SolarWinds_TCP_49152to65535_In_1" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 261
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.120.7.135/32"
        destination_address_prefix = "*"
        description                = "ESR 02 - SolarWinds Rule."
      }
  } : {}
    # Region-02 only (northcentralus)
    # Currently empty - all non-common rules are Region-01 only
  # This block is ready for future Region-02 specific rules
  solarwinds_region_northcentralus = var.enable_enterprise_security_rules ? {
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
      #   description                = "ESR 02 - SolarWinds Rule."
      # }
  } : {}
  enterprise_solarwinds_rules = merge(
    local.solarwinds_common,
    var.location == "eastus" ? local.solarwinds_region_eastus : {},
    var.location == "northcentralus" ? local.solarwinds_region_northcentralus : {}
  )
}