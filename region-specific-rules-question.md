# ESG Region-Specific Rules - Clarification Needed

Hi @[Technical Manager], looping in @[Lead]

During the AWS to Azure NSG migration, I found some ESG rules that have different IPs for us-east-1 (Virginia) vs us-east-2 (Ohio).

**Question:** Are these region-specific IPs intentional (e.g., regional servers)? Or should enterprise rules be the same across all regions?

---

## Region-Specific Rules Found

| ESG | Service | Region | Source IPs | Port(s) |
|-----|---------|--------|------------|---------|
| ESG-01 | ServiceNow | VA only | 10.110.34.0/24 | 49152 |
| ESG-01 | ServiceNow | VA only | 10.111.32.0/24 | 49152 |
| ESG-01 | ServiceNow | OH only | 10.110.34.0/24 | 49152-65535 |
| ESG-01 | ServiceNow | OH only | 10.111.32.0/24 | 49152-65535 |
| ESG-02 | SolarWinds | VA only | 10.111.14.232/32 | 49152-65535 |
| ESG-02 | SolarWinds | VA only | 10.120.7.135/32 | 49152-65535 |
| ESG-05 | Multi-Service | VA only | 10.111.100.235/32 | 0-65535 |
| ESG-05 | Multi-Service | VA only | 10.111.100.244/32 | 0-65535 |
| ESG-05 | Multi-Service | VA only | 10.111.100.246/32 | 0-65535 |
| ESG-05 | Multi-Service | VA only | 10.111.100.247/32 | 0-65535 |
| ESG-05 | Multi-Service | OH only | 10.20.60.110/32 | 135, 445, 5985, 5986, 49152-65535, 1024-65535 |
| ESG-08 | Multi-Service | OH only | 10.111.100.235/32 | 0-65535 |
| ESG-08 | Multi-Service | OH only | 10.111.100.244/32 | 0-65535 |
| ESG-08 | Multi-Service | OH only | 10.111.100.246/32 | 0-65535 |
| ESG-08 | Multi-Service | OH only | 10.111.100.247/32 | 0-65535 |
| ESG-08 | Multi-Service | OH only | 10.111.14.232/32 | 49152-65535 |
| ESG-08 | Multi-Service | OH only | 10.120.7.135/32 | 49152-65535 |

---

## Summary

- **ESG-01, 02, 05, 08** have region-specific rules
- **ESG-03, 04, 06, 07, 09, 10, 11, 12, 13** have NO region-specific rules (all common)

For Azure, I've replicated this same behavior. If they should be identical across regions, we can simplify.
