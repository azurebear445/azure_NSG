# Azure Network Security Group Module

## Description

Terraform module to create Azure Network Security Groups with enterprise-managed rules and user-defined rules. It replicates AWS Security Group functionality for Azure, including 13 Enterprise Security Rules (ESRs) that are applied automatically or via variables.

## Enterprise Security Rule Priority Blocks

Each ESR has a reserved priority block. **Do not use these priority ranges for user-defined rules:**

- ESR-01 (ServiceNow): 100-199
- ESR-02 (SolarWinds): 200-299
- ESR-03 (Multi-Service): 300-399
- ESR-04 (Multi-Service): 400-499
- ESR-05 (Multi-Service): 500-599
- ESR-06 (Rubrik Backup): 600-699
- ESR-07 (Database Admin): 700-799
- ESR-08 (Multi-Service): 800-899
- ESR-09 (Idera Monitoring): 900-999
- ESR-10 (HSA Monitoring): 1000-1099
- ESR-11 (Citrix): 1100-1199
- ESR-12 (SailPoint): 1200-1299
- ESR-13 (Varonis): 1300-1399

**User-defined rules:** Start at priority 1500 and above.

## Release Notes

*Note: Complete any required actions for each set of release notes between the version the module is on and the version it is being upgraded to.*

- Release 0.0.1:
  - Initial release

## Usage examples

References the code in examples/*
