# WIZ Findings Explanation - Azure NSG Module

This document explains the WIZ security findings for the Azure Network Security Group module and provides justification for each finding.

---

## High Severity Findings

### Firewall-008: Network Security Group access from entire private IP ranges is allowed

**Finding:** Access is allowed from 10.0.0.0/8

**Reason:** These rules are migrated from existing AWS Security Groups (ESG files). The enterprise security rules require broad internal network access for services like ServiceNow, SolarWinds, and other monitoring/management tools that need to communicate across the internal network.

**Source Files:**
- esg-01-servicenow.tf
- esg-02-solarwinds.tf
- esg-03-multi-service.tf
- esg-04-multi-service.tf
- esg-05-multi-service.tf
- And other ESG files

**Note:** User-defined rules in the examples use specific /24 subnets (e.g., 10.100.1.0/24) which do not trigger this finding.

---

### Firewall-009: Network Security Group access is allowed over port ranges

**Finding:** Port ranges (49152-65535, 1024-65535) are allowed instead of specific ports.

**Reason:** These port ranges are required for Windows Dynamic/RPC ports and are migrated from the corresponding AWS Security Group configurations.

**Source Files with Port Ranges:**

| Azure ESG File | AWS Security Group File | Port Range |
|----------------|------------------------|------------|
| esg-01-servicenow.tf | sec_sg_01_servicenow.tf | 49152-65535 |
| esg-02-solarwinds.tf | sec_sg_02_solarwinds.tf | 49152-65535 |
| esg-03-multi-service.tf | sec_sg_03_multi_service.tf | 49152-65535 |
| esg-04-multi-service.tf | sec_sg_04_multi_service.tf | 49152-65535 |
| esg-05-multi-service.tf | sec_sg_05_multi_service.tf | 1024-65535 |

---

### Firewall-102: Network Security Group outbound rules allow access to all protocols and all ports

**Finding:** Outbound rules allow unrestricted egress (all-all-0-0-0-0-0-outbound/egress, allow-any-egress).

**Reason:** These allow-all egress rules are migrated from the corresponding AWS Security Group configurations. This is standard practice for internal workloads that need outbound internet access for updates, API calls, etc.

**Source Files with Allow-All Egress:**

| Azure ESG File | AWS Security Group File | Rule Name |
|----------------|------------------------|-----------|
| esg-01-servicenow.tf | sec_sg_01_servicenow.tf | all-all-0-0-0-0-0-outbound |
| esg-02-solarwinds.tf | sec_sg_02_solarwinds.tf | all-all-0-0-0-0-0-outbound |
| esg-03-multi-service.tf | sec_sg_03_multi_service.tf | all-all-0-0-0-0-0-outbound |
| esg-04-multi-service.tf | sec_sg_04_multi_service.tf | all-all-0-0-0-0-0-outbound |
| esg-05-multi-service.tf | sec_sg_05_multi_service.tf | all-all-0-0-0-0-0-egress |
| esg-06-rubrik-backup.tf | sec_sg_06_rubrik_backup.tf | all-all-0-0-0-0-0-egress |
| esg-07-database-admin.tf | sec_sg_07_database_admin.tf | all-all-0-0-0-0-0-egress |

Additionally, the module has `enable_any_egress = true` by default which creates an allow-any-egress rule.

---

## Low Severity Findings

### Firewall-094: Network Security Group flow logs are not enabled

**Finding:** NSG Flow Logs are not enabled.

**Reason:** NSG Flow Logs are being **retired by Azure on September 30, 2027**. Azure recommends migrating to **Virtual Network Flow Logs** instead.

**Recommendation:** If flow logging is required, enable Virtual Network Flow Logs at the VNet level rather than NSG Flow Logs. Benefits:
- Covers all traffic in the VNet, not just NSG-filtered traffic
- Future-proof (not being deprecated)
- Configured at VNet level, not per-NSG
- May already be enabled in your Azure subscription

Virtual Network Flow Logs should be configured in the VNet module or separately, not in this NSG module.

---

### Firewall-095: Network Security Groups traffic analytics are disabled

**Finding:** Traffic analytics is not enabled.

**Reason:** Traffic analytics is a feature of NSG Flow Logs. Since NSG Flow Logs are being **retired by Azure on September 30, 2027**, we are not enabling this feature.

**Recommendation:** Use Virtual Network Flow Logs with traffic analytics instead, configured at the VNet level.

---

### Firewall-096: Network Security Group flow logs retention is less than 90 days

**Finding:** Flow logs retention is not set to 90+ days.

**Reason:** NSG Flow Logs are not enabled because they are being **retired by Azure on September 30, 2027**.

**Recommendation:** Use Virtual Network Flow Logs with appropriate retention settings, configured at the VNet level.

---

### Firewall-214: Network Security Group diagnostic settings does not collect event logs

**Finding:** Diagnostic settings are not configured to collect NetworkSecurityGroupEvent logs.

**Status:** ✅ **RESOLVED via Azure Policy**

**Explanation:** NSG Diagnostic Settings are automatically enabled by Azure Policy shortly after NSG creation. The policy configures:

- **Diagnostic Setting Name:** setByPolicy
- **Log Categories Enabled:**
  - NetworkSecurityGroupEvent ✅
  - NetworkSecurityGroupRuleCounter ✅
- **Destination:** Organization's centralized Log Analytics Workspace
  - Workspace: AZPrd-la-8a90d2fe-83fe-4c20-a5de-23adf84fb1bb
  - Subscription: AZProdLZ-ManagementProd
  - Region: East US 2
- **Data Retention:** 180 days (configured at workspace level)

**Note:** No code is required in the NSG module to enable diagnostic settings. Azure Policy automatically attaches the centralized Log Analytics Workspace to all NSGs created in the subscription.

---

## Summary

| Finding | Severity | Status | Reason |
|---------|----------|--------|--------|
| Firewall-008 | High | Expected | Enterprise rules migrated from AWS |
| Firewall-009 | High | Expected | Windows RPC port ranges from AWS |
| Firewall-102 | High | Expected | Allow-all egress from AWS |
| Firewall-094 | Low | Expected | NSG Flow Logs retiring Sept 2027 |
| Firewall-095 | Low | Expected | NSG Flow Logs retiring Sept 2027 |
| Firewall-096 | Low | Expected | NSG Flow Logs retiring Sept 2027 |
| Firewall-214 | Low | Resolved | Azure Policy enables diagnostic settings |

---

## References

- [Azure NSG Flow Logs Retirement Notice](https://learn.microsoft.com/en-us/azure/network-watcher/nsg-flow-logs-overview)
- [Virtual Network Flow Logs](https://learn.microsoft.com/en-us/azure/network-watcher/vnet-flow-logs-overview)
- [NSG Diagnostic Settings](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-nsg-manage-log)
