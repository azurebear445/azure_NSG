# Enterprise Security Rules - Multi-Service
# Priority Block: 241-312
#   Currently used: 241-272 (32 rules)
#   Reserved for future: 273-312 (40 slots)

locals {
  # Common rules - Apply to all regions
  multi_service_one_common = var.enable_default_enterprise_security_rules ? {
    "Allow-MultiServiceOne_TCP_22" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["22"]
      direction                      = "Inbound"
      priority                       = 241
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.1.249.31/32", "10.1.82.254/32", "10.20.68.72/32", "10.81.1.113/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_25" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["25"]
      direction                      = "Inbound"
      priority                       = 242
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_53" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["53"]
      direction                      = "Inbound"
      priority                       = 243
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_80" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["80"]
      direction                      = "Inbound"
      priority                       = 244
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_135" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["135"]
      direction                      = "Inbound"
      priority                       = 245
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_139" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["139"]
      direction                      = "Inbound"
      priority                       = 246
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_443" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["443"]
      direction                      = "Inbound"
      priority                       = 247
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_445" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["445"]
      direction                      = "Inbound"
      priority                       = 248
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_465" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["465"]
      direction                      = "Inbound"
      priority                       = 249
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_587" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["587"]
      direction                      = "Inbound"
      priority                       = 250
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_1030" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1030"]
      direction                      = "Inbound"
      priority                       = 251
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_1031" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1031"]
      direction                      = "Inbound"
      priority                       = 252
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_1032" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1032"]
      direction                      = "Inbound"
      priority                       = 253
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_1033" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1033"]
      direction                      = "Inbound"
      priority                       = 254
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_1034" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1034"]
      direction                      = "Inbound"
      priority                       = 255
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_1433" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1433"]
      direction                      = "Inbound"
      priority                       = 256
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.233/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_1801" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1801"]
      direction                      = "Inbound"
      priority                       = 257
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.233/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_5671" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5671"]
      direction                      = "Inbound"
      priority                       = 258
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.233/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_17777" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["17777"]
      direction                      = "Inbound"
      priority                       = 259
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_17778" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["17778"]
      direction                      = "Inbound"
      priority                       = 260
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_17791" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["17791"]
      direction                      = "Inbound"
      priority                       = 261
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.233/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_22-23" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["22-23"]
      direction                      = "Inbound"
      priority                       = 262
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.80/32", "10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_1024-1034" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1024-1034"]
      direction                      = "Inbound"
      priority                       = 263
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_17777-17778" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["17777-17778"]
      direction                      = "Inbound"
      priority                       = 264
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_TCP_49152-65535" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["49152-65535"]
      direction                      = "Inbound"
      priority                       = 265
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.233/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_UDP_53" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["53"]
      direction                      = "Inbound"
      priority                       = 266
      protocol                       = "Udp"
      source_address_prefixes        = ["10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_UDP_1024" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1024"]
      direction                      = "Inbound"
      priority                       = 267
      protocol                       = "Udp"
      source_address_prefixes        = ["10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_UDP_1434" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1434"]
      direction                      = "Inbound"
      priority                       = 268
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.14.233/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_UDP_137-138" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["137-138"]
      direction                      = "Inbound"
      priority                       = 269
      protocol                       = "Udp"
      source_address_prefixes        = ["10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_UDP_161-162" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["161-162"]
      direction                      = "Inbound"
      priority                       = 270
      protocol                       = "Udp"
      source_address_prefixes        = ["10.110.34.0/24", "10.111.32.0/24", "10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-MultiServiceOne_ICMP_AllPorts" = {
      access                         = "Allow"
      description                    = "Ingress from Multi-Service servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["*"]
      direction                      = "Inbound"
      priority                       = 271
      protocol                       = "Icmp"
      source_address_prefixes        = ["10.111.14.233/32", "10.120.7.135/32", "10.120.7.142/32"]
      source_port_range             = "*"
    }
    "Allow-All_Egress" = {
      access                         = "Allow"
      description                    = "Egress to Multi-Service servers."
      destination_address_prefix     = "0.0.0.0/0"
      destination_port_ranges        = ["*"]
      direction                      = "Outbound"
      priority                       = 272
      protocol                       = "*"
      source_address_prefixes = ["0.0.0.0/0"]
      source_port_range             = "*"
    }
  } : {}

  # Region-01 only (eastus)
  multi_service_one_region_eastus = {
    # No eastus-specific rules currently
  }

  # Region-02 only (northcentralus)
  multi_service_one_region_northcentralus = {
    # No northcentralus-specific rules currently
  }

  enterprise_multi_service_one_rules = merge(
    local.multi_service_one_common,
    local.is_region_eastus ? local.multi_service_one_region_eastus : {},
    local.is_region_northcentralus ? local.multi_service_one_region_northcentralus : {}
  )
}