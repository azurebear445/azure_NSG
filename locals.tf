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
  # Merge all enterprise rules from enterprise-*.tf files
  # Content-based keys ensure automatic deduplication across ESGs
  # Priority range: 100-1499 (reserved for enterprise rules)
  # =========================================================================
  all_enterprise_rules = merge(
    local.enterprise_servicenow_rules,
    # Future: Add other 12 ESG rules here
    # local.enterprise_monitoring_rules,
    # local.enterprise_backup_rules,
    # etc.
  )
  
  # =========================================================================
  # User-Defined Rules Processing
  # =========================================================================
  # These rules are provided by application teams via input variables
  # Priority range: 1500-3999 (starts after enterprise rules)
  # =========================================================================
  
  # Flatten ingress rules from CIDRs for ICMP
  ingress_rules_from_cidrs_icmp = flatten([
    for port, rule in var.ingress_rules["from_cidrs"]["icmp"] : [
      for cidr in rule["cidrs"] : {
        key                       = "${port}-icmp-${replace(cidr, "/", "-")}"
        protocol                  = rule["protocol"]
        from_port                 = tonumber(port)
        to_port                   = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
        source_address_prefix     = cidr
        destination_address_prefix = "*"
      }
    ]
  ])

  # Flatten ingress rules from CIDRs for TCP
  ingress_rules_from_cidrs_tcp = flatten([
    for port, rule in var.ingress_rules["from_cidrs"]["tcp"] : [
      for cidr in rule["cidrs"] : {
        key                       = "${port}-tcp-${replace(cidr, "/", "-")}"
        protocol                  = rule["protocol"]
        from_port                 = tonumber(port)
        to_port                   = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
        source_address_prefix     = cidr
        destination_address_prefix = "*"
      }
    ]
  ])

  # Flatten ingress rules from CIDRs for UDP
  ingress_rules_from_cidrs_udp = flatten([
    for port, rule in var.ingress_rules["from_cidrs"]["udp"] : [
      for cidr in rule["cidrs"] : {
        key                       = "${port}-udp-${replace(cidr, "/", "-")}"
        protocol                  = rule["protocol"]
        from_port                 = tonumber(port)
        to_port                   = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
        source_address_prefix     = cidr
        destination_address_prefix = "*"
      }
    ]
  ])

  # Flatten ingress rules from NSGs for TCP
  ingress_rules_from_nsgs_tcp = flatten([
    for port, x in var.ingress_rules["from_nsgs"]["tcp"] : [
      for y, nsg_id in x["source_nsg_ids"] : {
        key                              = "${port}-tcp-nsg-${y}"
        protocol                         = x["protocol"]
        from_port                        = tonumber(port)
        to_port                          = x["to_port"] != null ? tonumber(x["to_port"]) : tonumber(port)
        source_application_security_group_ids = [nsg_id]
        destination_address_prefix       = "*"
      }
    ]
  ])

  # Flatten ingress rules from NSGs for UDP
  ingress_rules_from_nsgs_udp = flatten([
    for port, x in var.ingress_rules["from_nsgs"]["udp"] : [
      for y, nsg_id in x["source_nsg_ids"] : {
        key                              = "${port}-udp-nsg-${y}"
        protocol                         = x["protocol"]
        from_port                        = tonumber(port)
        to_port                          = x["to_port"] != null ? tonumber(x["to_port"]) : tonumber(port)
        source_application_security_group_ids = [nsg_id]
        destination_address_prefix       = "*"
      }
    ]
  ])

  # Flatten egress rules to CIDRs
  egress_rules_to_cidrs = try(length(var.egress_rules["to_cidrs"]["cidrs"]) > 0 ? flatten([
    for cidr in var.egress_rules["to_cidrs"]["cidrs"] : {
      key                       = "egress-${var.egress_rules["to_cidrs"]["protocol"]}-${replace(cidr, "/", "-")}"
      protocol                  = var.egress_rules["to_cidrs"]["protocol"]
      from_port                 = 0
      to_port                   = var.egress_rules["to_cidrs"]["to_port"] != null ? var.egress_rules["to_cidrs"]["to_port"] : 0
      source_address_prefix     = "*"
      destination_address_prefix = cidr
    }
  ]) : [], [])

  # Flatten egress rules to NSGs
  egress_rules_to_nsgs = flatten([
    for port, v in var.egress_rules["to_nsgs"] : [
      for k, nsg_id in v["source_nsg_ids"] : {
        key                              = "egress-${port}-${v["protocol"]}-nsg-${k}"
        protocol                         = v["protocol"]
        from_port                        = tonumber(port)
        to_port                          = v["to_port"] != null ? tonumber(v["to_port"]) : tonumber(port)
        source_address_prefix            = "*"
        destination_application_security_group_ids = [nsg_id]
      }
    ]
  ])

  # Combine all ingress rules
  all_ingress_rules = concat(
    local.ingress_rules_from_cidrs_icmp,
    local.ingress_rules_from_cidrs_tcp,
    local.ingress_rules_from_cidrs_udp,
    local.ingress_rules_from_nsgs_tcp,
    local.ingress_rules_from_nsgs_udp
  )

  # Combine all egress rules
  all_egress_rules = concat(
    local.egress_rules_to_cidrs,
    local.egress_rules_to_nsgs
  )

  # Create map of all rules with priorities
  # User rules start at priority 1500 to avoid conflict with enterprise rules (100-1499)
  all_rules_map = merge(
    # Ingress rules with auto-incrementing priorities starting at 1500
    { for idx, rule in local.all_ingress_rules : rule.key => merge(rule, {
      direction = "Inbound"
      access    = "Allow"
      priority  = 1500 + idx
    }) },
    # Self-to-self rule if enabled
    var.enable_any_nsg_to_self ? {
      "allow-self-to-self" = {
        key                       = "allow-self-to-self"
        protocol                  = "*"
        from_port                 = 0
        to_port                   = 0
        source_address_prefix     = "VirtualNetwork"
        destination_address_prefix = "VirtualNetwork"
        direction                 = "Inbound"
        access                    = "Allow"
        priority                  = 1500 + length(local.all_ingress_rules)
      }
    } : {},
    # Egress rules with auto-incrementing priorities starting at 2000
    { for idx, rule in local.all_egress_rules : rule.key => merge(rule, {
      direction = "Outbound"
      access    = "Allow"
      priority  = 2000 + idx
    }) },
    # Any egress rule if enabled
    var.enable_any_egress ? {
      "allow-any-egress" = {
        key                       = "allow-any-egress"
        protocol                  = "*"
        from_port                 = 0
        to_port                   = 0
        source_address_prefix     = "*"
        destination_address_prefix = "*"
        direction                 = "Outbound"
        access                    = "Allow"
        priority                  = 2500
      }
    } : {}
  )
}
