# Azure Network Security Group Module

## Description

This module creates Azure Network Security Groups with enterprise-managed rules and user-defined rules. It tags all resources with architecture, environment, owner, purpose, terraform_resource, and one of appid|appgid|project.

## Notes

- Enterprise Security Group rules are applied automatically based on deployment region
- Users cannot disable or select individual ESGs - all rules are applied by default
- Priority ranges are managed automatically to prevent conflicts

## Release Notes

***Note: Complete any required actions for each set of release notes between the version the module is on and the version it is being upgraded to.***

- Release **1.0.0** (Initial Release):
  - Azure Network Security Group resource with automatic naming
  - 13 Enterprise Security Groups with region-specific rules
  - User-defined ingress rules (TCP, UDP, ICMP) from CIDRs and NSGs
  - User-defined egress rules
  - Automatic priority assignment (enterprise: 100-1499, user: 1500+)
  - Content-based deduplication across ESGs
  - Tag validation for compliance
  - ACTION REQUIRED:
    - No action required (new module)

## Architecture

```
Priority Range  | Purpose                      | Managed By
----------------|------------------------------|------------------
100-1499        | Enterprise Security Groups   | Platform Team
1500-1999       | User Ingress Rules           | Application Teams
2000-2499       | User Egress Rules            | Application Teams
2500            | Allow Any Egress             | Auto (if enabled)
4000-4096       | Reserved                     | -
```

## Basic Example

```hcl
module "nsg_web" {
  source = "git::ssh://git@gitlab.com/your-org/terraform-azurerm-network_security_group.git?ref=v1.0.0"

  name                = "web-tier"
  resource_group_name = azurerm_resource_group.example.name
  location            = "eastus2"
  environment         = "prod"
  namespace           = "myapp"

  ingress_rules = {
    from_cidrs = {
      tcp = {
        "443" = {
          cidrs   = ["10.0.0.0/8"]
          to_port = 443
        }
        "80" = {
          cidrs   = ["10.0.0.0/8"]
          to_port = 80
        }
      }
      udp  = {}
      icmp = {}
    }
    from_nsgs = {
      tcp = {}
      udp = {}
    }
  }

  egress_rules = {
    to_cidrs = null
    to_nsgs  = {}
  }

  enable_any_egress      = true
  enable_any_nsg_to_self = false

  tags = {
    architecture       = "native"
    owner              = "platform_team"
    purpose            = "Web tier NSG for frontend applications handling HTTP and HTTPS traffic."
    terraform_resource = "true"
    appid              = "app-12345"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | Name of the NSG | `string` | n/a | yes |
| resource_group_name | Resource group name | `string` | n/a | yes |
| location | Azure region (eastus2 or centralus) | `string` | n/a | yes |
| environment | Environment (box/dev/dr/prod/qa/stage/uat) | `string` | n/a | yes |
| namespace | Application namespace | `string` | n/a | yes |
| ingress_rules | Ingress rule configuration | `object` | `{}` | no |
| egress_rules | Egress rule configuration | `object` | `{}` | no |
| enable_any_egress | Allow all outbound traffic | `bool` | `true` | no |
| enable_any_nsg_to_self | Allow VirtualNetwork to VirtualNetwork | `bool` | `true` | no |
| tags | Resource tags | `object` | n/a | yes |
| nsg_custom_name | Custom name override for imports | `string` | `""` | no |
| log_analytics_workspace_id | Log Analytics Workspace ID for NSG diagnostic settings | `string` | `null` | no |

### Ingress Rules Structure

```hcl
ingress_rules = {
  from_cidrs = {
    tcp = {
      "<port>" = {
        cidrs   = ["<cidr1>", "<cidr2>"]
        to_port = <end_port>  # Optional, for port ranges
      }
    }
    udp = {
      "<port>" = {
        cidrs   = ["<cidr1>", "<cidr2>"]
        to_port = <end_port>  # Optional
      }
    }
    icmp = {
      "<type>" = {
        cidrs   = ["<cidr1>", "<cidr2>"]
        to_port = <code>  # Optional
      }
    }
  }
  from_nsgs = {
    tcp = {
      "<port>" = {
        source_nsg_ids = ["<nsg_id1>", "<nsg_id2>"]
        to_port        = <end_port>  # Optional
      }
    }
    udp = {}
  }
}
```

## Outputs

| Name | Description |
|------|-------------|
| nsg_id | Network Security Group ID |
| nsg_name | Network Security Group name |
| enterprise_rule_count | Number of enterprise rules applied |
| user_rule_count | Number of user-defined rules |

## Region Mapping

| AWS Region | Azure Region | Location |
|------------|--------------|----------|
| us-east-1  | eastus2      | Virginia |
| us-east-2  | centralus    | Iowa     |

## Enterprise Security Groups

| ESG | File | Priority Range | Service |
|-----|------|----------------|---------|
| 01 | esg-01-servicenow.tf | 100-159 | ServiceNow |
| 02 | esg-02-solarwinds.tf | 200-261 | SolarWinds |
| 03 | esg-03-multi-service.tf | 300-361 | Multi Service |
| 04 | esg-04-multi-service.tf | 400-458 | Multi Service |
| 05 | esg-05-multi-service.tf | 500-563 | Multi Service |
| 06 | esg-06-rubrik-backup.tf | 600-603 | Rubrik Backup |
| 07 | esg-07-database-admin.tf | 700-736 | Database Admin |
| 08 | esg-08-multi-service.tf | 800-854 | Multi Service |
| 09 | esg-09-idera-monitoring.tf | 900-944 | Idera Monitoring |
| 10 | esg-10-hsa-monitoring.tf | 1000-1003 | HSA Monitoring |
| 11 | esg-11-citrix.tf | 1040-1051 | Citrix |
| 12 | esg-12-sailpoint.tf | 1090-1110 | SailPoint |
| 13 | esg-13-varonis-collectors.tf | 1150-1164 | Varonis Collectors |

## Tag Requirements

| Tag | Requirement |
|-----|-------------|
| architecture | Must be "native", "legacy", or "migrations" |
| owner | Owner or team name |
| purpose | Must be >40 chars, start with capital, end with period |
| terraform_resource | Must be "true" |
| appid/appgid/project/serviceid | At least one required |

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| azurerm | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 3.0 |
| random | >= 3.0 |

## Resources

- `azurerm_network_security_group`
- `azurerm_network_security_rule` (enterprise rules)
- `azurerm_network_security_rule` (user rules)
- `azurerm_monitor_diagnostic_setting` (optional, if log_analytics_workspace_id provided)
- `random_id`

## Diagnostic Settings (Optional)

To enable NSG diagnostic settings for compliance and monitoring, pass your Log Analytics Workspace ID:

```hcl
module "nsg_web" {
  source = "../../"
  # ... other variables
  
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
}
```

If not provided, diagnostic settings will not be configured.

## Usage Examples

Reference the code in `examples/*`:

- `examples/default/` - Enterprise rules only (no user-defined rules)
- `examples/web-tier/` - Enterprise rules + user-defined web traffic rules
