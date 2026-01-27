# Azure Network Security Group Module

## Description

Terraform module to create Azure Network Security Groups with enterprise-managed rules and user-defined rules. It replicates AWS Enterprise Security Group functionality via variables.

## Notes

This module creates and manages Azure Network Security Groups with:
- **Enterprise security rules**: 13 pre-configured rule files containing enterprise-managed security rules that apply automatically based on deployment region
- **User-defined rules**: Custom ingress/egress rules for application-specific traffic
- **Default security rules**: Optional allow-all-egress and NSG-to-self communication rules
- **Automatic priority management**: Enterprise rules use priority range 100-1499, user rules use 1500+, preventing conflicts
- **Regional rule application**: Enterprise rules conditionally applied based on location (eastus or northcentralus)

**Enterprise security rules:**
- **Default rules** (enabled by default, opt-out available): Access from organization-wide connectivity and monitoring applications
  - Set `enable_default_enterprise_security_rules = false` to opt-out of all default rules
- **Opt-in rules** (enable via variables): Rubrik Backup, Database Admin, Idera Monitoring, HSA Monitoring, Citrix, Sailpoint, Varonis
- Rules apply automatically based on deployment region - no manual rule management required
- Regional differences: Some rules apply only to specific regions (eastus vs northcentralus)

## Release Notes

*Note: Complete any required actions for each set of release notes between the version the module is on and the version it is being upgraded to.*

- Release 0.0.1:
  - Initial release

## Usage examples

```Reference the code in examples/*```