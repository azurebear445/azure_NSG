locals {
  # Region Configuration
  location = var.location == "eastus" ? var.location : "ncus"

  is_region_eastus         = var.location == "eastus"
  is_region_northcentralus = var.location == "northcentralus"

  # Enterprise Security Rules - Conditional merge
  all_enterprise_rules = merge(
    var.enable_default_enterprise_security_rules ? merge(
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

  # Ingress rules from CIDRs for ICMP - consolidated by port
  ingress_rules_from_cidrs_icmp = [
    for port, rule in try(var.ingress_rules["from_cidrs"]["icmp"], {}) : {
      key                        = "${port}-icmp"
      protocol                   = rule["protocol"]
      from_port                  = tonumber(port)
      to_port                    = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
      source_address_prefixes    = rule["cidrs"]
      destination_address_prefix = "*"
    }
  ]

  # Ingress rules from CIDRs for TCP - consolidated by port
  ingress_rules_from_cidrs_tcp = [
    for port, rule in try(var.ingress_rules["from_cidrs"]["tcp"], {}) : {
      key                        = "${port}-tcp"
      protocol                   = rule["protocol"]
      from_port                  = tonumber(port)
      to_port                    = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
      source_address_prefixes    = rule["cidrs"]
      destination_address_prefix = "*"
    }
  ]

  # Ingress rules from CIDRs for UDP - consolidated by port
  ingress_rules_from_cidrs_udp = [
    for port, rule in try(var.ingress_rules["from_cidrs"]["udp"], {}) : {
      key                        = "${port}-udp"
      protocol                   = rule["protocol"]
      from_port                  = tonumber(port)
      to_port                    = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
      source_address_prefixes    = rule["cidrs"]
      destination_address_prefix = "*"
    }
  ]

  # Flatten ingress rules from ASGs for TCP
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

  # Flatten ingress rules from ASGs for UDP
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

  # Egress rules to CIDRs for ICMP - consolidated by port
  egress_rules_to_cidrs_icmp = [
    for port, rule in try(var.egress_rules["to_cidrs"]["icmp"], {}) : {
      key                         = "egress-${port}-icmp"
      protocol                    = "Icmp"
      from_port                   = 0
      to_port                     = 0
      source_address_prefix       = "*"
      destination_address_prefixes = rule["cidrs"]
    }
  ]

  # Egress rules to CIDRs for TCP - consolidated by port
  egress_rules_to_cidrs_tcp = [
    for port, rule in try(var.egress_rules["to_cidrs"]["tcp"], {}) : {
      key                         = "egress-${port}-tcp"
      protocol                    = "Tcp"
      from_port                   = tonumber(port)
      to_port                     = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
      source_address_prefix       = "*"
      destination_address_prefixes = rule["cidrs"]
    }
  ]

  # Egress rules to CIDRs for UDP - consolidated by port
  egress_rules_to_cidrs_udp = [
    for port, rule in try(var.egress_rules["to_cidrs"]["udp"], {}) : {
      key                         = "egress-${port}-udp"
      protocol                    = "Udp"
      from_port                   = tonumber(port)
      to_port                     = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
      source_address_prefix       = "*"
      destination_address_prefixes = rule["cidrs"]
    }
  ]

  # Flatten egress rules to ASGs for TCP
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

  # Flatten egress rules to ASGs for UDP
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

  # Create maps for each rule type with priorities
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
}
