# Azure Network Security Group Module

Terraform module for creating Azure Network Security Groups with support for enterprise-managed rules and user-defined rules.

## Features

- **Enterprise Security Group Rules**: Pre-configured enterprise-managed rules with automatic priority assignment
- **User-Defined Rules**: Application-specific rules with automatic priority assignment to avoid conflicts
- **Region-Specific Rules**: Support for different rule sets based on deployment region
- **Content-Based Deduplication**: Automatic deduplication of rules across multiple Enterprise Security Groups
- **Flexible Priority Management**: Reserved priority ranges for enterprise (100-1499) and user rules (1500+)
- **Tag Validation**: Required tags with validation for compliance

## Architecture

```
Priority Range    | Purpose                      | Managed By
------------------|------------------------------|------------
100-1499         | Enterprise Security Groups   | Platform Team
1500-3999        | User/Application Rules       | Application Teams
4000-4096        | Reserved                     | -
```

## Usage

### Basic Example

```hcl
module "nsg_web" {
  source = "git::ssh://git@gitlab.com/your-org/terraform-azurerm-network_security_group.git?ref=v1.0.0"

  name                = "web-tier"
  resource_group_name = azurerm_resource_group.example.name
  location            = "eastus"
  environment         = "prod"
  namespace           = "myapp"

  # User-defined ingress rules
  ingress_rules = {
    from_cidrs = {
      tcp = {
        "443" = {
          cidrs   = ["0.0.0.0/0"]
          to_port = 443
        }
        "80" = {
          cidrs   = ["0.0.0.0/0"]
          to_port = 80
        }
      }
      udp = {}
      icmp = {}
    }
    from_nsgs = {
      tcp = {}
      udp = {}
    }
  }

  # Egress rules
  egress_rules = {
    to_cidrs = null
    to_nsgs  = {}
  }

  enable_any_egress      = true
  enable_any_nsg_to_self = false

  tags = {
    architecture      = "native"
    owner            = "platform-team"
    purpose          = "web-frontend"
    terraform_resource = "true"
    appid            = "app-12345"
  }
}
```

### Advanced Example with Port Ranges

```hcl
module "nsg_app" {
  source = "git::ssh://git@gitlab.com/your-org/terraform-azurerm-network_security_group.git?ref=v1.0.0"

  name                = "app-tier"
  resource_group_name = azurerm_resource_group.example.name
  location            = "eastus"
  environment         = "prod"
  namespace           = "myapp"

  ingress_rules = {
    from_cidrs = {
      tcp = {
        "8080" = {
          cidrs   = ["10.0.0.0/16"]
          to_port = 8080
        }
        # Port range example
        "9000" = {
          cidrs   = ["10.0.0.0/16"]
          to_port = 9999  # Creates range 9000-9999
        }
      }
      udp = {
        "53" = {
          cidrs   = ["10.0.0.0/8"]
          to_port = 53
        }
      }
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
  enable_any_nsg_to_self = true

  tags = {
    architecture      = "native"
    owner            = "app-team"
    purpose          = "application-backend"
    terraform_resource = "true"
    appid            = "app-67890"
  }
}
```

## Enterprise Security Group Rules

Enterprise rules are automatically applied based on deployment region. These rules are managed by the platform team and include:

- **ServiceNow ESG**: Communication rules for ServiceNow infrastructure
- *(Additional ESGs will be added in future releases)*

### Region Mapping

| AWS Region | Azure Region | Enterprise Rules Applied |
|------------|--------------|--------------------------|
| us-east-1  | eastus       | Virginia Primary rules   |
| us-east-2  | eastus2      | Virginia Secondary rules |

Enterprise rules use priorities 100-1499 and are automatically deduplicated across multiple ESGs.

## Priority Assignment

Priorities are automatically assigned to prevent conflicts:

- **Enterprise Rules**: 100-1499 (managed by platform, content-based keys ensure deduplication)
- **User Ingress Rules**: 1500+ (auto-incremented)
- **User Egress Rules**: 2000+ (auto-incremented)
- **Allow Any Egress**: 2500 (if enabled)

Users cannot specify priorities directly, ensuring no conflicts occur.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the NSG | `string` | n/a | yes |
| resource_group_name | Resource group name | `string` | n/a | yes |
| location | Azure region | `string` | n/a | yes |
| environment | Environment (dev/qa/prod) | `string` | n/a | yes |
| namespace | Application namespace | `string` | n/a | yes |
| ingress_rules | Ingress rule configuration | `object` | n/a | yes |
| egress_rules | Egress rule configuration | `object` | n/a | yes |
| enable_any_egress | Allow all outbound traffic | `bool` | `false` | no |
| enable_any_nsg_to_self | Allow VirtualNetwork to VirtualNetwork | `bool` | `false` | no |
| tags | Resource tags | `map(string)` | n/a | yes |

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
        source_nsg_ids = ["<asg_id1>", "<asg_id2>"]
        to_port        = <end_port>  # Optional
      }
    }
    udp = {
      "<port>" = {
        source_nsg_ids = ["<asg_id1>", "<asg_id2>"]
        to_port        = <end_port>  # Optional
      }
    }
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

## Tag Requirements

The following tags are required and validated:

- `architecture`: Must be "native" or "vendor"
- `owner`: Owner or team name
- `purpose`: Purpose of the resource
- `terraform_resource`: Must be "true"
- `appid`: Application ID

## Examples

See the `examples/` directory for complete working examples:

- `examples/nsg/`: Basic NSG with web tier rules

## Enterprise Security Groups

### Available ESGs

The module includes the following Enterprise Security Groups:

- **ServiceNow ESG** (`enterprise-servicenow.tf`): Priority range 100-159
  - Virginia Primary (eastus): 60 rules from AWS us-east-1
  - Virginia Secondary (eastus2): 60 rules from AWS us-east-2

Additional ESGs are managed in separate files following the naming convention `enterprise-<name>.tf`. Each ESG has a designated priority range to prevent conflicts:

```hcl
# locals.tf
all_enterprise_rules = merge(
  local.enterprise_servicenow_rules,
  # Additional ESGs merged here
)
```

### ESG Priority Allocation

| Priority Range | ESG Name | Status |
|----------------|----------|--------|
| 100-159 | ServiceNow | Active |
| 160-1499 | Reserved | Available for future ESGs |

### Testing

```bash
cd examples/nsg
terraform init
terraform plan
terraform apply
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| azurerm | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 3.0 |

## Resources

- `azurerm_network_security_group`
- `azurerm_network_security_rule` (enterprise rules)
- `azurerm_network_security_rule` (user rules)

## License

Internal use only - Property of [Your Organization]

## Support

For issues or questions:
- Platform Team: platform-team@example.com
- Slack: #terraform-support
- Documentation: https://wiki.example.com/terraform/azure-nsg

## Changelog

### Version 1.0.0 (2024-12-30)
- Initial release
- ServiceNow Enterprise Security Group rules (60 rules per region)
- Support for user-defined TCP, UDP, and ICMP rules
- Automatic priority management
- Region-specific rule support (eastus, eastus2)
- Content-based deduplication
