# Enterprise Security Rules - HSA Monitoring
# Priority Block: 1000-1039
#   Currently used: 1000-1002 (3 rules)
#   Reserved for future: 1003-1039 (37 slots)

locals {
    # Common rules - Apply to all regions
  hsa_monitoring_common = {
    "Allow_HSAMonitoring_TCP_135_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1000
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["135"]
      source_address_prefixes      = ["10.111.41.153/32"]
      destination_address_prefix = "*"
      description                = "Ingress from HSA Monitoring servers."
    }
    "Allow_HSAMonitoring_TCP_1024to65535_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1001
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1024-65535"]
      source_address_prefixes      = ["10.111.41.153/32"]
      destination_address_prefix = "*"
      description                = "Ingress from HSA Monitoring servers."
    }
    "Allow_HSAMonitoring_ICMP_AllPorts_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1002
      protocol                   = "Icmp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["*"]
      source_address_prefixes      = ["10.111.41.153/32"]
      destination_address_prefix = "*"
      description                = "Ingress from HSA Monitoring servers."
    }
  }
    # Region-01 only (eastus)
  hsa_monitoring_region_eastus = {
      # No Region-01 specific rules currently
          # EXAMPLE: How to add a new Region-01 only rule:
          # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1003  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_ranges          = ["*"]
      #   destination_port_ranges     = ["3306"]
      #   source_address_prefixes      = ["192.168.1.0/24"]
      #   destination_address_prefix = "*"
      #   description                = "Ingress from HSA Monitoring servers."
      # }
  }
    # Region-02 only (northcentralus)
  hsa_monitoring_region_northcentralus = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
          # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1003  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_ranges          = ["*"]
      #   destination_port_ranges     = ["8080"]
      #   source_address_prefixes      = ["10.1.1.0/24"]
      #   destination_address_prefix = "*"
      #   description                = "Ingress from HSA Monitoring servers."
      # }
  }
  enterprise_hsa_monitoring_rules = merge(
    local.hsa_monitoring_common,
    var.location == "eastus" ? local.hsa_monitoring_region_eastus : {},
    var.location == "northcentralus" ? local.hsa_monitoring_region_northcentralus : {}
  )
}
