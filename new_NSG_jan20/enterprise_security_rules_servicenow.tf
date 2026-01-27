# Enterprise Security Rules - ServiceNow
# Priority Block: 100-163
#   Currently used: 100-123 (24 rules)
#   Reserved for future: 124-163 (40 slots)

locals {
  # Common rules - Apply to all regions
  servicenow_common = var.enable_default_enterprise_security_rules ? {
    "Allow-ServiceNow_All_AllPorts" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["*"]
      direction                      = "Inbound"
      priority                       = 100
      protocol                       = "*"
      source_address_prefixes        = ["10.111.14.251/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_22" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["22"]
      direction                      = "Inbound"
      priority                       = 101
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.110.34.0/24", "10.111.32.0/24", "10.71.44.0/24", "10.72.44.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_135" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["135"]
      direction                      = "Inbound"
      priority                       = 102
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.1.248.0/24", "10.110.34.0/24", "10.111.19.0/24", "10.111.32.0/24", "10.20.60.101/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_139" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["139"]
      direction                      = "Inbound"
      priority                       = 103
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.1.248.0/24", "10.111.19.0/24", "10.20.60.101/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_443" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["443"]
      direction                      = "Inbound"
      priority                       = 104
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.71.44.0/24", "10.72.44.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_445" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["445"]
      direction                      = "Inbound"
      priority                       = 105
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.1.248.0/24", "10.110.34.0/24", "10.111.19.0/24", "10.111.32.0/24", "10.20.60.101/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_636" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["636"]
      direction                      = "Inbound"
      priority                       = 106
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.71.44.0/24", "10.72.44.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_1556" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1556"]
      direction                      = "Inbound"
      priority                       = 107
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.20.60.182/32", "10.20.60.203/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_1858" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1858"]
      direction                      = "Inbound"
      priority                       = 108
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.71.44.0/24", "10.72.44.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_3389" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["3389"]
      direction                      = "Inbound"
      priority                       = 109
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.71.44.0/24", "10.72.44.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_4699" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["4699"]
      direction                      = "Inbound"
      priority                       = 110
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_4972" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["4972"]
      direction                      = "Inbound"
      priority                       = 111
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.1.248.0/24", "10.111.19.0/24", "10.20.60.101/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_4974" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["4974"]
      direction                      = "Inbound"
      priority                       = 112
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.1.248.0/24", "10.111.19.0/24", "10.20.60.101/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_5500" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5500"]
      direction                      = "Inbound"
      priority                       = 113
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.71.44.0/24", "10.72.44.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_5985" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5985"]
      direction                      = "Inbound"
      priority                       = 114
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.110.34.0/24", "10.111.32.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_5986" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5986"]
      direction                      = "Inbound"
      priority                       = 115
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.110.34.0/24", "10.111.32.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_13724" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["13724"]
      direction                      = "Inbound"
      priority                       = 116
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.20.60.182/32", "10.20.60.203/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_13782" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["13782"]
      direction                      = "Inbound"
      priority                       = 117
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.20.60.182/32", "10.20.60.203/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_15671" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["15671"]
      direction                      = "Inbound"
      priority                       = 118
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_TCP_60777" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["60777"]
      direction                      = "Inbound"
      priority                       = 119
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.1.248.0/24", "10.111.19.0/24", "10.20.60.101/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_UDP_137" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["137"]
      direction                      = "Inbound"
      priority                       = 120
      protocol                       = "Udp"
      source_address_prefixes        = ["10.1.248.0/24", "10.111.19.0/24", "10.20.60.101/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_UDP_138" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["138"]
      direction                      = "Inbound"
      priority                       = 121
      protocol                       = "Udp"
      source_address_prefixes        = ["10.1.248.0/24", "10.111.19.0/24", "10.20.60.101/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_UDP_1813" = {
      access                         = "Allow"
      description                    = "Ingress from ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1813"]
      direction                      = "Inbound"
      priority                       = 122
      protocol                       = "Udp"
      source_address_prefixes        = ["10.71.44.0/24", "10.72.44.0/24"]
      source_port_ranges             = ["*"]
    }
    "Allow-ServiceNow_All_AllPorts" = {
      access                         = "Allow"
      description                    = "Egress to ServiceNow servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["*"]
      direction                      = "Outbound"
      priority                       = 123
      protocol                       = "*"
      source_address_prefixes        = ["0.0.0.0/0"]
      source_port_ranges             = ["*"]
    }
  } : {}

  # Region-01 only (eastus)
  servicenow_region_eastus = {
    # No eastus-specific rules currently
  }

  # Region-02 only (northcentralus)
  servicenow_region_northcentralus = {
    # No northcentralus-specific rules currently
  }

  enterprise_servicenow_rules = merge(
    local.servicenow_common,
    var.location == "eastus" ? local.servicenow_region_eastus : {},
    var.location == "northcentralus" ? local.servicenow_region_northcentralus : {}
  )
}