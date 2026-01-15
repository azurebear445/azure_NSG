# Terraform AzureRM Network Security Group Module

## Description

Terraform module to create Azure Network Security Groups with embedded Enterprise Security Rules (ESRs). It tags resources with environment, module_name, module_version, namespace, owner, purpose, repo, terraform_resource, and one of appid|appgid|project.

## What is this module responsible for?

This module creates and manages Azure Network Security Groups with:
- **Enterprise Security Rules (ESRs)**: 13 pre-configured ESR files containing enterprise-managed security rules that apply automatically based on deployment region
- **User-defined rules**: Custom ingress/egress rules for application-specific traffic
- **Default security rules**: Optional allow-all-egress and NSG-to-self communication rules
- **Automatic priority management**: Enterprise rules use priority range 100-1499, user rules use 1500+, preventing conflicts
- **Regional rule application**: Rules conditionally applied based on location (eastus or northcentralus)

## Who is allowed to use it, and how?

**Usage Requirements:**
- Provider for the **AZProdLZ-NetworkingProd** subscription must be passed to the module
- Must have appropriate Azure RBAC permissions to create NSGs in target subscription
- Module must be called with required variables: `namespace`, `environment`, `location`, `resource_group_name`
- Required tags must be provided: `owner`, `purpose`, `appid` (or appgid/project)
- Provider credentials configured via Terraform variables: `client_id`, `client_secret`, `subscription_id`, `tenant_id`
- Reference the code in **examples/** for usage patterns

## Notes

**Enterprise Security Rules (ESRs):**
- **Default ESRs** (enabled by default, opt-out available): ESR-01 (ServiceNow), ESR-02 (SolarWinds), ESR-03, ESR-04, ESR-05, ESR-08 (Multi-Service)
  - Set `enable_enterprise_security_rules = false` to opt-out of all default ESRs
- **Opt-in ESRs** (enable via variables): ESR-06 (Rubrik Backup), ESR-07 (Database Admin), ESR-09 (Idera Monitoring), ESR-10 (HSA Monitoring), ESR-11 (Citrix), ESR-12 (SailPoint), ESR-13 (Varonis)
- ESRs apply automatically based on deployment region - no manual rule management required
- Regional differences: Some rules apply only to specific regions (eastus vs northcentralus)

**Critical - How to not break things:**
- **Do NOT modify ESR files** directly - these are enterprise-managed and changes will be overwritten
- **Do NOT use priority range 100-1499** for user-defined rules - this range is reserved for enterprise rules
- **Do NOT create NSGs outside this module** for resources requiring enterprise security compliance
- **Always specify location** as either `eastus` or `northcentralus` - other regions are not supported
- **Test in non-production first** - Enterprise rules may block application traffic if not properly planned
- **Namespace naming**: Do NOT include "nsg" in the namespace value (e.g., use `namespace = "myapp"` not `namespace = "myapp-nsg"`) - the module automatically adds "-nsg" to the resource name

## What is explicitly out of scope?

This module does **NOT**:
- Associate NSGs with subnets or network interfaces (done separately by application teams)
- Manage NSG Flow Logs or diagnostic settings (handled by Azure Policy)
- Allow modification of enterprise-managed ESR rules
- Support regions other than eastus and northcentralus
- Provide rule-level exceptions or overrides for ESRs

## Release Notes

*Note: Complete any required actions for each set of release notes between the version the module is on and the version it is being upgraded to.*

- Release **0.0.1**:
  - Initial release

## Usage examples

Reference the code in **examples/***
