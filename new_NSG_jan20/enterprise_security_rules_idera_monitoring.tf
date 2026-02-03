# Enterprise Security Rules - Idera Monitoring
# Priority Block: 590-640
#   Currently used: 590-600 (11 rules)
#   Reserved for future: 601-640 (40 slots)

locals {
  # Common rules - Apply to all regions
  idera_monitoring_common = {
    "Allow-IderaMonitoring_TCP_135" = {
      access                         = "Allow"
      description                    = "Ingress from Idera Monitoring servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["135"]
      direction                      = "Inbound"
      priority                       = 590
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.6/32", "10.111.26.8/32", "10.111.41.145/32", "10.111.71.30/32"]
      source_port_range             = "*"
    }
    "Allow-IderaMonitoring_TCP_1433" = {
      access                         = "Allow"
      description                    = "Ingress from Idera Monitoring servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1433"]
      direction                      = "Inbound"
      priority                       = 591
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.6/32", "10.111.26.8/32", "10.111.41.145/32", "10.111.71.30/32"]
      source_port_range             = "*"
    }
    "Allow-IderaMonitoring_TCP_5166" = {
      access                         = "Allow"
      description                    = "Ingress from Idera Monitoring servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5166"]
      direction                      = "Inbound"
      priority                       = 592
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.6/32", "10.111.26.8/32", "10.111.41.145/32", "10.111.71.30/32"]
      source_port_range             = "*"
    }
    "Allow-IderaMonitoring_TCP_5167" = {
      access                         = "Allow"
      description                    = "Ingress from Idera Monitoring servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5167"]
      direction                      = "Inbound"
      priority                       = 593
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.6/32", "10.111.26.8/32", "10.111.41.145/32", "10.111.71.30/32"]
      source_port_range             = "*"
    }
    "Allow-IderaMonitoring_TCP_5169" = {
      access                         = "Allow"
      description                    = "Ingress from Idera Monitoring servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5169"]
      direction                      = "Inbound"
      priority                       = 594
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.6/32", "10.111.26.8/32", "10.111.41.145/32", "10.111.71.30/32"]
      source_port_range             = "*"
    }
    "Allow-IderaMonitoring_TCP_5200" = {
      access                         = "Allow"
      description                    = "Ingress from Idera Monitoring servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5200"]
      direction                      = "Inbound"
      priority                       = 595
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.6/32", "10.111.26.8/32", "10.111.41.145/32", "10.111.71.30/32"]
      source_port_range             = "*"
    }
    "Allow-IderaMonitoring_TCP_5201" = {
      access                         = "Allow"
      description                    = "Ingress from Idera Monitoring servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5201"]
      direction                      = "Inbound"
      priority                       = 596
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.6/32", "10.111.26.8/32", "10.111.41.145/32", "10.111.71.30/32"]
      source_port_range             = "*"
    }
    "Allow-IderaMonitoring_TCP_52731" = {
      access                         = "Allow"
      description                    = "Ingress from Idera Monitoring servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["52731"]
      direction                      = "Inbound"
      priority                       = 597
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.6/32", "10.111.26.8/32", "10.111.41.145/32", "10.111.71.30/32"]
      source_port_range             = "*"
    }
    "Allow-IderaMonitoring_TCP_1024-65535" = {
      access                         = "Allow"
      description                    = "Ingress from Idera Monitoring servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1024-65535"]
      direction                      = "Inbound"
      priority                       = 598
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.6/32", "10.111.26.8/32", "10.111.41.145/32", "10.111.71.30/32"]
      source_port_range             = "*"
    }
    "Allow-IderaMonitoring_TCP_49152-65535" = {
      access                         = "Allow"
      description                    = "Ingress from Idera Monitoring servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["49152-65535"]
      direction                      = "Inbound"
      priority                       = 599
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.6/32", "10.111.26.8/32", "10.111.41.145/32", "10.111.71.30/32"]
      source_port_range             = "*"
    }
    "Allow-IderaMonitoring_ICMP_AllPorts" = {
      access                         = "Allow"
      description                    = "Ingress from Idera Monitoring servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["*"]
      direction                      = "Inbound"
      priority                       = 600
      protocol                       = "Icmp"
      source_address_prefixes        = ["10.111.14.6/32", "10.111.26.8/32", "10.111.41.145/32", "10.111.71.30/32"]
      source_port_range             = "*"
    }
  }

  # Region-01 only (eastus)
  idera_monitoring_region_eastus = {
    # No eastus-specific rules currently
  }

  # Region-02 only (northcentralus)
  idera_monitoring_region_northcentralus = {
    # No northcentralus-specific rules currently
  }

  enterprise_idera_monitoring_rules = merge(
    local.idera_monitoring_common,
    local.is_region_eastus ? local.idera_monitoring_region_eastus : {},
    local.is_region_northcentralus ? local.idera_monitoring_region_northcentralus : {}
  )
}