locals {
  # =========================================================================
  # Shared Region Configuration - Used by ALL ESG files
  # =========================================================================
  # Define once, use everywhere to avoid duplication
  # 
  # Region Mapping:
  #   - Region-01 (AWS us-east-1 Virginia) → Azure eastus2 (Virginia)
  #   - Region-02 (AWS us-east-2 Ohio) → Azure centralus (Iowa)
  #
  # Note: Azure has no Ohio datacenter. AWS Ohio maps to Azure Central US (Iowa)
  #       for optimal network latency to Midwest regions.
  #
  # Note: Region-01 and Region-02 are peers (not primary/secondary hierarchy).
  #       They have equal preference and can fail over to each other.
  
  # Region-01 locations (AWS us-east-1 Virginia → Azure eastus2 Virginia)
  region_01_locations = ["eastus2"]
  
  # Region-02 locations (AWS us-east-2 Ohio → Azure centralus Iowa)
  region_02_locations = ["centralus"]
  
  # Boolean checks for region type (used by ESG files with for-loop filters)
  is_region_01 = contains(local.region_01_locations, var.location)
  is_region_02 = contains(local.region_02_locations, var.location)

  # =========================================================================
  # Enterprise Security Group Rules
  # =========================================================================
  # Merge all enterprise rules from esg-*.tf files
  # Content-based keys ensure automatic deduplication across ESGs
  # Priority range: 100-1499 (reserved for enterprise rules)
  #
  # Naming Convention: enterprise_[NUMBER]_[NAME]_rules
  # This matches the file naming pattern: esg-[NUMBER]-[NAME].tf
  
  all_enterprise_rules = merge(
    local.enterprise_01_servicenow_rules,
    local.enterprise_02_solarwinds_rules,
    local.enterprise_03_multi_service_rules
    # Add future ESG rules here:
    # local.enterprise_04_multi_service_rules,
    # local.enterprise_05_multi_service_rules,
    # ...
  )

  # =========================================================================
  # User-Defined Rules Processing
  # =========================================================================
  # These rules are provided by application teams via input variables
  # Priority range: 1500-3999 (starts after enterprise rules)

  # Flatten ingress rules from CIDRs for ICMP
  ingress_rules_from_cidrs_icmp = flatten([
    for port, rule in var.ingress_rules["from_cidrs"]["icmp"] : [
      for cidr in rule.cidrs : {
        key                        = "icmp-${replace(cidr, "/", "-")}-inbound"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Icmp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = cidr
        destination_address_prefix = "*"
        description                = try(rule.description, "ICMP from ${cidr}")
      }
    ]
  ])

  # Flatten ingress rules from CIDRs for TCP
  ingress_rules_from_cidrs_tcp = flatten([
    for port, rule in var.ingress_rules["from_cidrs"]["tcp"] : [
      for cidr in rule.cidrs : {
        key                        = "${port}-tcp-${replace(cidr, "/", "-")}-inbound"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = try(rule.to_port, port)
        source_address_prefix      = cidr
        destination_address_prefix = "*"
        description                = try(rule.description, "TCP/${port} from ${cidr}")
      }
    ]
  ])

  # Flatten ingress rules from CIDRs for UDP
  ingress_rules_from_cidrs_udp = flatten([
    for port, rule in var.ingress_rules["from_cidrs"]["udp"] : [
      for cidr in rule.cidrs : {
        key                        = "${port}-udp-${replace(cidr, "/", "-")}-inbound"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Udp"
        source_port_range          = "*"
        destination_port_range     = try(rule.to_port, port)
        source_address_prefix      = cidr
        destination_address_prefix = "*"
        description                = try(rule.description, "UDP/${port} from ${cidr}")
      }
    ]
  ])

  # Flatten ingress rules from ASGs for TCP
  ingress_rules_from_asgs_tcp = flatten([
    for port, rule in var.ingress_rules["from_asgs"]["tcp"] : [
      for asg_id in rule.application_security_group_ids : {
        key                                       = "${port}-tcp-asg-${basename(asg_id)}-inbound"
        direction                                 = "Inbound"
        access                                    = "Allow"
        protocol                                  = "Tcp"
        source_port_range                         = "*"
        destination_port_range                    = try(rule.to_port, port)
        source_application_security_group_ids     = [asg_id]
        destination_application_security_group_ids = null
        description                               = try(rule.description, "TCP/${port} from ASG")
      }
    ]
  ])

  # Flatten ingress rules from ASGs for UDP
  ingress_rules_from_asgs_udp = flatten([
    for port, rule in var.ingress_rules["from_asgs"]["udp"] : [
      for asg_id in rule.application_security_group_ids : {
        key                                       = "${port}-udp-asg-${basename(asg_id)}-inbound"
        direction                                 = "Inbound"
        access                                    = "Allow"
        protocol                                  = "Udp"
        source_port_range                         = "*"
        destination_port_range                    = try(rule.to_port, port)
        source_application_security_group_ids     = [asg_id]
        destination_application_security_group_ids = null
        description                               = try(rule.description, "UDP/${port} from ASG")
      }
    ]
  ])

  # Combine all user ingress rules and assign priorities starting at 1500
  user_ingress_rules = {
    for idx, rule in concat(
      local.ingress_rules_from_cidrs_icmp,
      local.ingress_rules_from_cidrs_tcp,
      local.ingress_rules_from_cidrs_udp,
      local.ingress_rules_from_asgs_tcp,
      local.ingress_rules_from_asgs_udp
    ) : rule.key => merge(rule, { priority = 1500 + idx })
  }

  # Flatten egress rules from CIDRs for TCP
  egress_rules_from_cidrs_tcp = flatten([
    for port, rule in var.egress_rules["to_cidrs"]["tcp"] : [
      for cidr in rule.cidrs : {
        key                        = "${port}-tcp-${replace(cidr, "/", "-")}-outbound"
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = try(rule.to_port, port)
        source_address_prefix      = "*"
        destination_address_prefix = cidr
        description                = try(rule.description, "TCP/${port} to ${cidr}")
      }
    ]
  ])

  # Flatten egress rules from CIDRs for UDP
  egress_rules_from_cidrs_udp = flatten([
    for port, rule in var.egress_rules["to_cidrs"]["udp"] : [
      for cidr in rule.cidrs : {
        key                        = "${port}-udp-${replace(cidr, "/", "-")}-outbound"
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Udp"
        source_port_range          = "*"
        destination_port_range     = try(rule.to_port, port)
        source_address_prefix      = "*"
        destination_address_prefix = cidr
        description                = try(rule.description, "UDP/${port} to ${cidr}")
      }
    ]
  ])

  # Combine all user egress rules and assign priorities starting at 2000
  user_egress_rules = {
    for idx, rule in concat(
      local.egress_rules_from_cidrs_tcp,
      local.egress_rules_from_cidrs_udp
    ) : rule.key => merge(rule, {
      priority = 2000 + length(local.user_ingress_rules) + idx
    })
  }

  # Allow any egress rule
  any_egress_rule = var.enable_any_egress ? {
    "any-egress" = {
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      priority                   = 2500
      description                = "Allow any egress"
    }
  } : {}

  # Combine all user-defined rules
  all_user_rules = merge(
    local.user_ingress_rules,
    local.user_egress_rules,
    local.any_egress_rule
  )
}
