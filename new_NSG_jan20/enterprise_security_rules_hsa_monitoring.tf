# Enterprise Security Rules - HSA Monitoring
# Priority Block: 641-683
#   Currently used: 641-643 (3 rules)
#   Reserved for future: 644-683 (40 slots)

locals {
  # Common rules - Apply to all regions
  hsa_monitoring_common = {
    "Allow-HSAMonitoring_TCP_135" = {
      access                         = "Allow"
      description                    = "Ingress from HSA Monitoring servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["135"]
      direction                      = "Inbound"
      priority                       = 641
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.41.153/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-HSAMonitoring_TCP_1024-65535" = {
      access                         = "Allow"
      description                    = "Ingress from HSA Monitoring servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1024-65535"]
      direction                      = "Inbound"
      priority                       = 642
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.41.153/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-HSAMonitoring_ICMP_AllPorts" = {
      access                         = "Allow"
      description                    = "Ingress from HSA Monitoring servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["*"]
      direction                      = "Inbound"
      priority                       = 643
      protocol                       = "Icmp"
      source_address_prefixes        = ["10.111.41.153/32"]
      source_port_ranges             = ["*"]
    }
  }

  # Region-01 only (eastus)
  hsa_monitoring_region_eastus = {
    # No eastus-specific rules currently
  }

  # Region-02 only (northcentralus)
  hsa_monitoring_region_northcentralus = {
    # No northcentralus-specific rules currently
  }

  enterprise_hsa_monitoring_rules = merge(
    local.hsa_monitoring_common,
    var.location == "eastus" ? local.hsa_monitoring_region_eastus : {},
    var.location == "northcentralus" ? local.hsa_monitoring_region_northcentralus : {}
  )
}