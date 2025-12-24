# Variables Documentation

This document provides detailed information about all variables used in the Azure NSG module.

## Required Variables

### name
- **Type**: `string`
- **Description**: Name of the Network Security Group
- **Usage**: Used as part of the NSG name generation
- **Example**: `"web-tier"`, `"database"`, `"application"`

### location
- **Type**: `string`
- **Description**: Azure region where the NSG will be created
- **Valid Values**: Any valid Azure region
- **Examples**: `"East US"`, `"West Europe"`, `"Southeast Asia"`

### resource_group_name
- **Type**: `string`
- **Description**: Name of the Azure resource group where the NSG will be created
- **Note**: The resource group must already exist
- **Example**: `"rg-production-eastus"`

### environment
- **Type**: `string`
- **Description**: Environment designation for the NSG
- **Valid Values**: `box`, `dev`, `dr`, `prod`, `qa`, `stage`, `uat`
- **Validation**: Enforced at plan time
- **Example**: `"prod"`

### namespace
- **Type**: `string`
- **Description**: Namespace for grouping related resources
- **Constraints**:
  - Only lowercase letters and dashes allowed
  - Must be under 32 characters
- **Validation**: Enforced via regex `^[a-z-]+$`
- **Examples**: `"myapp"`, `"customer-portal"`, `"api-gateway"`

### tags
- **Type**: `object`
- **Description**: Map of tags to apply to the NSG
- **Required Fields**:
  - `architecture`: Must be "native", "legacy", or "migrations"
  - `owner`: Team or person responsible (lowercase with underscores)
  - `purpose`: Detailed description (>40 chars, capital first letter, ends with period)
  - `terraform_resource`: Must be "true"
  - One of: `appid`, `appgid`, `project`, or `serviceid`

- **Optional Fields**:
  - `custom_tags`: Map of additional custom tags
  - `tag_formatting_exceptions`: List of tag keys exempt from validation

- **Example**:
```hcl
tags = {
  architecture       = "native"
  owner              = "platform_team"
  purpose            = "Network security group for controlling web tier traffic and access."
  terraform_resource = "true"
  appid              = "app-12345"
  custom_tags = {
    team        = "infrastructure"
    cost_center = "engineering"
  }
}
```

## Optional Variables

### ingress_rules
- **Type**: Complex object
- **Default**: `{}`
- **Description**: Defines all inbound security rules
- **Structure**:
```hcl
{
  from_cidrs = {
    tcp  = map(object({ cidrs = list(string), protocol = string, to_port = number }))
    udp  = map(object({ cidrs = list(string), protocol = string, to_port = number }))
    icmp = map(object({ cidrs = list(string), protocol = string, to_port = number }))
  }
  from_nsgs = {
    tcp = map(object({ source_nsg_ids = list(string), protocol = string, to_port = number }))
    udp = map(object({ source_nsg_ids = list(string), protocol = string, to_port = number }))
  }
}
```

**Examples**:

1. Allow HTTPS from specific CIDR:
```hcl
ingress_rules = {
  from_cidrs = {
    tcp = {
      "443" = {
        cidrs   = ["10.0.0.0/8"]
        to_port = 443
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
```

2. Allow MySQL from Application Security Group:
```hcl
ingress_rules = {
  from_cidrs = {
    tcp  = {}
    udp  = {}
    icmp = {}
  }
  from_nsgs = {
    tcp = {
      "3306" = {
        source_nsg_ids = ["<asg-id>"]
        to_port        = 3306
      }
    }
    udp = {}
  }
}
```

3. Multiple protocols and ports:
```hcl
ingress_rules = {
  from_cidrs = {
    tcp = {
      "443" = { cidrs = ["0.0.0.0/0"], to_port = 443 }
      "80"  = { cidrs = ["0.0.0.0/0"], to_port = 80 }
      "22"  = { cidrs = ["10.1.1.0/24"], to_port = 22 }
    }
    udp = {
      "53" = { cidrs = ["10.0.0.0/8"], to_port = 53 }
    }
    icmp = {}
  }
  from_nsgs = {
    tcp = {}
    udp = {}
  }
}
```

### egress_rules
- **Type**: Complex object
- **Default**: `{}`
- **Description**: Defines all outbound security rules
- **Structure**:
```hcl
{
  to_cidrs = {
    cidrs    = list(string)
    protocol = string
    to_port  = number
  }
  to_nsgs = map(object({
    source_nsg_ids = list(string)
    protocol       = string
    to_port        = number
  }))
}
```

**Examples**:

1. Allow HTTPS to internet:
```hcl
egress_rules = {
  to_cidrs = {
    cidrs    = ["0.0.0.0/0"]
    protocol = "Tcp"
    to_port  = 443
  }
  to_nsgs = {}
}
```

2. Allow to specific ASG:
```hcl
egress_rules = {
  to_cidrs = {}
  to_nsgs = {
    "3306" = {
      source_nsg_ids = ["<asg-id>"]
      protocol       = "Tcp"
      to_port        = 3306
    }
  }
}
```

### enable_any_egress
- **Type**: `bool`
- **Default**: `true`
- **Description**: If true, creates a rule allowing all outbound traffic to 0.0.0.0/0
- **Use Cases**:
  - `true`: Standard for most applications that need internet access
  - `false`: High-security environments requiring explicit egress rules
- **Example**:
```hcl
enable_any_egress = var.environment == "prod" ? false : true
```

### enable_any_nsg_to_self
- **Type**: `bool`
- **Default**: `true`
- **Description**: If true, allows the NSG to communicate with itself on any port
- **Use Cases**:
  - `true`: Cluster applications, distributed systems
  - `false`: Isolated single-instance applications
- **Example**:
```hcl
enable_any_nsg_to_self = true
```

### nsg_custom_name
- **Type**: `string`
- **Default**: `""`
- **Description**: Override for auto-generated NSG name
- **Use Cases**:
  - Importing existing NSGs
  - Maintaining consistent naming
  - Avoiding name conflicts
- **Note**: When empty, name is generated as: `{namespace}-{environment}-{name}-{random_hex}`
- **Example**:
```hcl
nsg_custom_name = "nsg-legacy-imported-prod"
```

## Variable Relationships

### Priority Management
The module automatically assigns priorities based on rule types:
- **100-199**: Ingress CIDR rules (auto-incrementing)
- **100+N**: Self-to-self rule (where N = number of ingress rules)
- **200-299**: Egress rules (auto-incrementing)
- **300**: Allow-all egress rule

### Tag Inheritance
Tags are applied hierarchically:
1. Base tags from `var.tags` (stripped of metadata)
2. Custom tags from `var.tags.custom_tags`
3. Tag formatting exceptions (joined as comma-separated string)
4. Environment tag from `var.environment`
5. Name tag (auto-generated or custom)

### Name Generation
NSG name is generated based on:
```
{namespace}-{environment}-{name}-{random_hex}
```
Example: `myapp-prod-web-a3f2b1`

Can be overridden with `nsg_custom_name`.

## Validation Rules

### environment
```hcl
condition = var.environment in ["box", "dev", "dr", "prod", "qa", "stage", "uat"]
error     = "Must be one of: box, dev, dr, prod, qa, stage, or uat"
```

### namespace
```hcl
condition = length(var.namespace) < 32 && can(regex("^[a-z-]+$", var.namespace))
error     = "Must contain only lowercase letters and dashes, under 32 characters"
```

### tags.architecture
```hcl
condition = var.tags.architecture in ["native", "legacy", "migrations"]
error     = "Must be 'native', 'legacy', or 'migrations'"
```

### tags.purpose
```hcl
condition = length(var.tags.purpose) > 40 && 
            can(regex("^[A-Z][-.* A-Za-z]+[.]$", var.tags.purpose))
error     = "Must be >40 chars, start with capital, end with period"
```

### tags.terraform_resource
```hcl
condition = var.tags.terraform_resource == "true"
error     = "Must be 'true'"
```

## Best Practices

1. **Always provide empty protocol blocks** in ingress_rules to avoid null errors:
```hcl
ingress_rules = {
  from_cidrs = {
    tcp  = { /* your rules */ }
    udp  = {}  # Even if empty
    icmp = {}  # Even if empty
  }
  from_nsgs = {
    tcp = {}
    udp = {}
  }
}
```

2. **Use descriptive names** that indicate the NSG's purpose:
```hcl
name = "web-tier"     # Good
name = "nsg1"         # Poor
```

3. **Apply consistent tagging** across all environments
4. **Use variables for CIDR blocks** to maintain flexibility
5. **Document custom_tags** for team awareness
6. **Set enable_any_egress = false** for high-security environments
7. **Use Application Security Groups** instead of IP-based rules when possible

## Common Patterns

### Web Application
```hcl
ingress_rules = {
  from_cidrs = {
    tcp = {
      "443" = { cidrs = ["0.0.0.0/0"], to_port = 443 }
      "80"  = { cidrs = ["0.0.0.0/0"], to_port = 80 }
    }
    udp  = {}
    icmp = {}
  }
  from_nsgs = { tcp = {}, udp = {} }
}
enable_any_egress = true
```

### Database (Private)
```hcl
ingress_rules = {
  from_cidrs = { tcp = {}, udp = {}, icmp = {} }
  from_nsgs = {
    tcp = {
      "3306" = {
        source_nsg_ids = [azurerm_application_security_group.app.id]
        to_port        = 3306
      }
    }
    udp = {}
  }
}
enable_any_egress = false
```

### Jump Box / Bastion
```hcl
ingress_rules = {
  from_cidrs = {
    tcp = {
      "22" = { cidrs = ["<your-ip>/32"], to_port = 22 }
    }
    udp  = {}
    icmp = {}
  }
  from_nsgs = { tcp = {}, udp = {} }
}
enable_any_egress = true
```
