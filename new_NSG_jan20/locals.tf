locals {
  # Region Configuration
  location = {
    eastus         = "eastus"
    northcentralus = "ncus"
  }

  region_eastus_locations         = ["eastus"]
  region_northcentralus_locations = ["northcentralus"]
  is_region_eastus                = contains(local.region_eastus_locations, var.location)
  is_region_northcentralus        = contains(local.region_northcentralus_locations, var.location)

  # Enterprise Security Rules - Conditional merge
  all_enterprise_rules = merge(
    var.enable_enterprise_security_rules ? merge(
      local.enterprise_servicenow_rules,
      local.enterprise_solarwinds_rules,
      local.enterprise_multi_service_one_rules,
      local.enterprise_multi_service_two_rules,
      local.enterprise_multi_service_three_rules,
      local.enterprise_multi_service_four_rules
    ) : {},
    var.enable_rubrik_backup ? local.enterprise_rubrik_backup_rules : {},
    var.enable_db_admin_access ? local.enterprise_database_admin_rules : {},
    var.enable_idera_monitoring ? local.enterprise_idera_monitoring_rules : {},
    var.enable_hsa_monitoring ? local.enterprise_hsa_monitoring_rules : {},
    var.enable_citrix_ingress ? local.enterprise_citrix_rules : {},
    var.enable_sailpoint_ingress ? local.enterprise_sailpoint_rules : {},
    var.enable_varonis_ingress ? local.enterprise_varonis_collectors_rules : {}
  )

  # User-Defined Rules Processing

  # Flatten ingress rules from CIDRs for ICMP
  ingress_rules_from_cidrs_icmp = flatten([
    for port, rule in try(var.ingress_rules["from_cidrs"]["icmp"], {}) : [
      for cidr in rule["cidrs"] : {
        key                        = "${port}-icmp-${replace(cidr, "/", "-")}"
        protocol                   = rule["protocol"]
        from_port                  = tonumber(port)
        to_port                    = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
        source_address_prefix      = cidr
        destination_address_prefix = "*"
      }
    ]
  ])

  # Flatten ingress rules from CIDRs for TCP
  ingress_rules_from_cidrs_tcp = flatten([
    for port, rule in try(var.ingress_rules["from_cidrs"]["tcp"], {}) : [
      for cidr in rule["cidrs"] : {
        key                        = "${port}-tcp-${replace(cidr, "/", "-")}"
        protocol                   = rule["protocol"]
        from_port                  = tonumber(port)
        to_port                    = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
        source_address_prefix      = cidr
        destination_address_prefix = "*"
      }
    ]
  ])

  # Flatten ingress rules from CIDRs for UDP
  ingress_rules_from_cidrs_udp = flatten([
    for port, rule in try(var.ingress_rules["from_cidrs"]["udp"], {}) : [
      for cidr in rule["cidrs"] : {
        key                        = "${port}-udp-${replace(cidr, "/", "-")}"
        protocol                   = rule["protocol"]
        from_port                  = tonumber(port)
        to_port                    = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
        source_address_prefix      = cidr
        destination_address_prefix = "*"
      }
    ]
  ])

  # Flatten ingress rules from ASGs for TCP (Change 26: nsgs -> asgs)
  ingress_rules_from_asgs_tcp = flatten([
    for port, x in try(var.ingress_rules["from_asgs"]["tcp"], {}) : [
      for y, asg_id in x["source_asg_ids"] : {
        key                                    = "${port}-tcp-asg-${y}"
        protocol                               = x["protocol"]
        from_port                              = tonumber(port)
        to_port                                = x["to_port"] != null ? tonumber(x["to_port"]) : tonumber(port)
        source_application_security_group_ids = [asg_id]
        destination_address_prefix             = "*"
      }
    ]
  ])

  # Flatten ingress rules from ASGs for UDP (Change 26: nsgs -> asgs)
  ingress_rules_from_asgs_udp = flatten([
    for port, x in try(var.ingress_rules["from_asgs"]["udp"], {}) : [
      for y, asg_id in x["source_asg_ids"] : {
        key                                    = "${port}-udp-asg-${y}"
        protocol                               = x["protocol"]
        from_port                              = tonumber(port)
        to_port                                = x["to_port"] != null ? tonumber(x["to_port"]) : tonumber(port)
        source_application_security_group_ids = [asg_id]
        destination_address_prefix             = "*"
      }
    ]
  ])

  # Flatten egress rules to CIDRs for ICMP
  egress_rules_to_cidrs_icmp = try(var.egress_rules["to_cidrs"]["icmp"] != null ? flatten([
    for port, rule in var.egress_rules["to_cidrs"]["icmp"] : [
      for cidr in rule["cidrs"] : {
        key                        = "egress-${port}-icmp-${replace(cidr, "/", "-")}"
        protocol                   = "Icmp"
        from_port                  = 0
        to_port                    = 0
        source_address_prefix      = "*"
        destination_address_prefix = cidr
      }
    ]
  ]) : [], [])

  # Flatten egress rules to CIDRs for TCP
  egress_rules_to_cidrs_tcp = try(var.egress_rules["to_cidrs"]["tcp"] != null ? flatten([
    for port, rule in var.egress_rules["to_cidrs"]["tcp"] : [
      for cidr in rule["cidrs"] : {
        key                        = "egress-${port}-tcp-${replace(cidr, "/", "-")}"
        protocol                   = "Tcp"
        from_port                  = tonumber(port)
        to_port                    = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
        source_address_prefix      = "*"
        destination_address_prefix = cidr
      }
    ]
  ]) : [], [])

  # Flatten egress rules to CIDRs for UDP
  egress_rules_to_cidrs_udp = try(var.egress_rules["to_cidrs"]["udp"] != null ? flatten([
    for port, rule in var.egress_rules["to_cidrs"]["udp"] : [
      for cidr in rule["cidrs"] : {
        key                        = "egress-${port}-udp-${replace(cidr, "/", "-")}"
        protocol                   = "Udp"
        from_port                  = tonumber(port)
        to_port                    = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
        source_address_prefix      = "*"
        destination_address_prefix = cidr
      }
    ]
  ]) : [], [])

  # Flatten egress rules to ASGs for TCP (Change 26: nsgs -> asgs)
  egress_rules_to_asgs_tcp = flatten([
    for port, v in try(var.egress_rules["to_asgs"]["tcp"], {}) : [
      for k, asg_id in v["destination_asg_ids"] : {
        key                                        = "egress-${port}-tcp-asg-${k}"
        protocol                                   = "Tcp"
        from_port                                  = tonumber(port)
        to_port                                    = v["to_port"] != null ? tonumber(v["to_port"]) : tonumber(port)
        source_address_prefix                      = "*"
        destination_application_security_group_ids = [asg_id]
      }
    ]
  ])

  # Flatten egress rules to ASGs for UDP (Change 26: nsgs -> asgs)
  egress_rules_to_asgs_udp = flatten([
    for port, v in try(var.egress_rules["to_asgs"]["udp"], {}) : [
      for k, asg_id in v["destination_asg_ids"] : {
        key                                        = "egress-${port}-udp-asg-${k}"
        protocol                                   = "Udp"
        from_port                                  = tonumber(port)
        to_port                                    = v["to_port"] != null ? tonumber(v["to_port"]) : tonumber(port)
        source_address_prefix                      = "*"
        destination_application_security_group_ids = [asg_id]
      }
    ]
  ])

  # Create maps for each rule type with priorities (Change 27: Split for separate resources)
  # User rules start at priority 1500 to avoid conflict with enterprise rules (100-1499)

  # Ingress ICMP from CIDRs
  ingress_rules_from_cidrs_icmp_map = {
    for idx, rule in local.ingress_rules_from_cidrs_icmp : rule.key => merge(rule, {
      direction = "Inbound"
      access    = "Allow"
      priority  = 1500 + idx
    })
  }

  # Ingress TCP from CIDRs
  ingress_rules_from_cidrs_tcp_map = {
    for idx, rule in local.ingress_rules_from_cidrs_tcp : rule.key => merge(rule, {
      direction = "Inbound"
      access    = "Allow"
      priority  = 1600 + idx
    })
  }

  # Ingress UDP from CIDRs
  ingress_rules_from_cidrs_udp_map = {
    for idx, rule in local.ingress_rules_from_cidrs_udp : rule.key => merge(rule, {
      direction = "Inbound"
      access    = "Allow"
      priority  = 1700 + idx
    })
  }

  # Ingress TCP from ASGs
  ingress_rules_from_asgs_tcp_map = {
    for idx, rule in local.ingress_rules_from_asgs_tcp : rule.key => merge(rule, {
      direction = "Inbound"
      access    = "Allow"
      priority  = 1800 + idx
    })
  }

  # Ingress UDP from ASGs
  ingress_rules_from_asgs_udp_map = {
    for idx, rule in local.ingress_rules_from_asgs_udp : rule.key => merge(rule, {
      direction = "Inbound"
      access    = "Allow"
      priority  = 1900 + idx
    })
  }

  # Egress ICMP to CIDRs
  egress_rules_to_cidrs_icmp_map = {
    for idx, rule in local.egress_rules_to_cidrs_icmp : rule.key => merge(rule, {
      direction = "Outbound"
      access    = "Allow"
      priority  = 2000 + idx
    })
  }

  # Egress TCP to CIDRs
  egress_rules_to_cidrs_tcp_map = {
    for idx, rule in local.egress_rules_to_cidrs_tcp : rule.key => merge(rule, {
      direction = "Outbound"
      access    = "Allow"
      priority  = 2100 + idx
    })
  }

  # Egress UDP to CIDRs
  egress_rules_to_cidrs_udp_map = {
    for idx, rule in local.egress_rules_to_cidrs_udp : rule.key => merge(rule, {
      direction = "Outbound"
      access    = "Allow"
      priority  = 2200 + idx
    })
  }

  # Egress TCP to ASGs
  egress_rules_to_asgs_tcp_map = {
    for idx, rule in local.egress_rules_to_asgs_tcp : rule.key => merge(rule, {
      direction = "Outbound"
      access    = "Allow"
      priority  = 2300 + idx
    })
  }

  # Egress UDP to ASGs
  egress_rules_to_asgs_udp_map = {
    for idx, rule in local.egress_rules_to_asgs_udp : rule.key => merge(rule, {
      direction = "Outbound"
      access    = "Allow"
      priority  = 2400 + idx
    })
  }

  # Self-to-self rule
  self_to_self_rule = var.enable_any_nsg_to_self ? {
    "allow-self-to-self" = {
      key                        = "allow-self-to-self"
      protocol                   = "*"
      from_port                  = 0
      to_port                    = 0
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 2500
    }
  } : {}

  # Any egress rule
  any_egress_rule = var.enable_any_egress ? {
    "allow-any-egress" = {
      key                        = "allow-any-egress"
      protocol                   = "*"
      from_port                  = 0
      to_port                    = 0
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 2600
    }
  } : {}
}
