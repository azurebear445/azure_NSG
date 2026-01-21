# Azure Network Security Group Module

## Description

Terraform module to create Azure Network Security Groups with enterprise-managed rules and user-defined rules. It replicates AWS Security Group functionality for Azure, including 13 Enterprise Security Rule files that are applied automatically or via variables.

## Enterprise Security Rule Priority Blocks

Each rule file has a reserved priority block. **Do not use these priority ranges for user-defined rules:**

| Service | File | Priority Range |
|---------|------|----------------|
| ServiceNow | `enterprise_security_rules_servicenow.tf` | 100-199 |
| SolarWinds | `enterprise_security_rules_solarwinds.tf` | 200-299 |
| Multi-Service One | `enterprise_security_rules_multi_service_one.tf` | 300-399 |
| Multi-Service Two | `enterprise_security_rules_multi_service_two.tf` | 400-499 |
| Multi-Service Three | `enterprise_security_rules_multi_service_three.tf` | 500-599 |
| Rubrik Backup | `enterprise_security_rules_rubrik_backup.tf` | 600-699 |
| Database Admin | `enterprise_security_rules_database_admin.tf` | 700-799 |
| Multi-Service Four | `enterprise_security_rules_multi_service_four.tf` | 800-899 |
| Idera Monitoring | `enterprise_security_rules_idera_monitoring.tf` | 900-999 |
| HSA Monitoring | `enterprise_security_rules_hsa_monitoring.tf` | 1000-1099 |
| Citrix | `enterprise_security_rules_citrix.tf` | 1100-1199 |
| SailPoint | `enterprise_security_rules_sailpoint.tf` | 1200-1299 |
| Varonis Collectors | `enterprise_security_rules_varonis_collectors.tf` | 1300-1399 |

**User-defined rules:** Start at priority 1500 and above.

## Release Notes

*Note: Complete any required actions for each set of release notes between the version the module is on and the version it is being upgraded to.*

- Release 0.0.1:
  - Initial release

## Usage examples

References the code in examples/*
