# Azure Network Security Group Module

## Description

Terraform module to create Azure Network Security Groups with enterprise-managed rules and user-defined rules. It replicates AWS Security Group functionality for Azure, including 13 enterprise security rule files that are applied automatically or via variables.

## What is this module responsible for?

This module creates and manages Azure Network Security Groups with:
- **Enterprise security rules**: 13 pre-configured rule files containing enterprise-managed security rules that apply automatically based on deployment region
- **User-defined rules**: Custom ingress/egress rules for application-specific traffic
- **Default security rules**: Optional allow-all-egress and NSG-to-self communication rules
- **Automatic priority management**: Enterprise rules use priority range 100-1499, user rules use 1500+, preventing conflicts
- **Regional rule application**: Rules conditionally applied based on location (eastus or northcentralus)

## Notes

**Enterprise security rules:**
- **Default rules** (enabled by default, opt-out available): ServiceNow, SolarWinds, Multi-Service One, Multi-Service Two, Multi-Service Three, Multi-Service Four
  - Set `enable_enterprise_security_rules = false` to opt-out of all default rules
- **Opt-in rules** (enable via variables): Rubrik Backup, Database Admin, Idera Monitoring, HSA Monitoring, Citrix, SailPoint, Varonis
- Rules apply automatically based on deployment region - no manual rule management required
- Regional differences: Some rules apply only to specific regions (eastus vs northcentralus)

**Critical - How to not break things:**
- **Do NOT modify enterprise rule files directly** - these are enterprise-managed and changes will be overwritten
- **Do NOT use priority range 100-1499** for user-defined rules - this range is reserved for enterprise rules
- **Always specify location** as either `eastus` or `northcentralus` - other regions are not supported

## What is explicitly out of scope?

This module does **NOT**:
- Associate NSGs with subnets or network interfaces (done separately by application teams)
- Manage NSG Flow Logs or diagnostic settings (handled by Azure Policy)
- Allow modification of enterprise-managed rules
- Support regions other than eastus and northcentralus
- Provide rule-level exceptions or overrides for enterprise rules

## Release Notes

*Note: Complete any required actions for each set of release notes between the version the module is on and the version it is being upgraded to.*

- Release 0.0.1:
  - Initial release

## Usage examples

References the code in examples/*
