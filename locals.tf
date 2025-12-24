locals {
  # Flatten ingress rules from CIDRs for ICMP
  ingress_rules_from_cidrs_icmp = flatten([
    for port, rule in var.ingress_rules["from_cidrs"]["icmp"] : [
      for cidr in rule["cidrs"] : {
        key                       = "${port}-icmp-${cidr}"
        protocol                  = rule["protocol"]
        from_port                 = tonumber(port)
        to_port                   = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
        source_address_prefix     = cidr
        destination_address_prefix = "*"
      }
    ]
  ])

