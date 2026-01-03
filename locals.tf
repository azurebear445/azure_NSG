locals {
  # =========================================================================
  # Shared Region Configuration - Used by ALL ESG files
  # =========================================================================
  # Define once, use everywhere to avoid duplication
  
  # Regions that should get "Virginia Primary" rules (from AWS us-east-1)
  virginia_primary_regions = ["eastus"]
  
  # Regions that should get "Virginia Secondary" rules (from AWS us-east-2)
  # Note: These were originally from AWS Ohio (us-east-2) but map to Azure eastus2
  virginia_secondary_regions = ["eastus2"]
  
  # Determine which rule set to apply based on var.location
  is_virginia_primary = contains(local.virginia_primary_regions, var.location)
  is_virginia_secondary = contains(local.virginia_secondary_regions, var.location)

  # =========================================================================
  # Enterprise Security Group Rules
  # =========================================================================
  # Merge all enterprise rules from esg-*.tf files
  # Content-based keys ensure automatic deduplication across ESGs
  # Priority range: 100-1499 (reserved for enterprise rules)
  
  all_enterprise_rules = merge(
    local.enterprise_servicenow_rules,
    local.enterprise_solarwinds_rules,
    local.enterprise_multi_service_rules
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
