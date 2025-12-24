# Azure NSG Module - Implementation Guide

## Overview
This Azure Network Security Group (NSG) module replicates the functionality of your AWS Security Group module, maintaining consistent structure, tagging, and behavior patterns across both cloud providers.

## Module Structure

```
azure-nsg-module/
├── main.tf              # NSG and security rules resources
├── variables.tf         # Input variable definitions
├── outputs.tf           # Output definitions
├── locals.tf            # Local value computations and rule flattening
├── tags.tf              # Tag management logic
├── versions.tf          # Provider version constraints
├── README.md            # Module documentation
├── MIGRATION.md         # AWS to Azure migration guide
├── VARIABLES.md         # Detailed variable documentation
├── CHANGELOG.md         # Version history
├── .gitignore           # Git ignore patterns
├── examples/
│   ├── complete/        # Comprehensive example
│   │   └── main.tf
│   └── simple/          # Basic example
│       └── main.tf
└── tests/
    └── test.tf          # Test configuration
```

## Key Features Implemented

### 1. Rule Management (Matches AWS Module)
- ✅ Ingress rules from CIDRs (ICMP, TCP, UDP)
- ✅ Ingress rules from NSGs (via Application Security Groups)
- ✅ Egress rules to CIDRs
- ✅ Egress rules to NSGs
- ✅ Self-to-self communication rules
- ✅ Allow-all egress option
- ✅ Automatic priority management

### 2. Tag Management (Identical to AWS)
- ✅ Required tags: architecture, owner, purpose, terraform_resource
- ✅ One of: appid, appgid, project, serviceid
- ✅ Custom tags support
- ✅ Tag formatting exceptions
- ✅ Environment tag injection
- ✅ Same validation rules as AWS

### 3. Naming Strategy
- ✅ Random ID generation for uniqueness
- ✅ Custom name override option
- ✅ Format: `{namespace}-{environment}-{name}-{random_hex}`

### 4. Locals Processing
- ✅ Rule flattening from nested structures
- ✅ Priority auto-assignment
- ✅ Protocol-based rule grouping

## Quick Start - Testing in Sandbox

### Prerequisites
```bash
# Ensure you have:
# 1. Azure subscription access
# 2. Terraform >= 1.5.0
# 3. Azure CLI logged in

az login
az account set --subscription "<your-sandbox-subscription-id>"
```

### Step 1: Create Test Directory
```bash
mkdir -p ~/azure-nsg-test
cd ~/azure-nsg-test
```

### Step 2: Copy Module
```bash
# Copy the azure-nsg-module directory to your test location
cp -r /path/to/azure-nsg-module ./
```

### Step 3: Create Test Configuration
Create `test-nsg.tf`:

```hcl
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  # subscription_id = "your-sandbox-subscription-id"  # Uncomment if needed
}

# Create resource group
resource "azurerm_resource_group" "sandbox" {
  name     = "rg-nsg-sandbox-test"
  location = "East US"
}

# Test NSG module
module "nsg_test" {
  source = "./azure-nsg-module"

  name                = "test-web"
  location            = azurerm_resource_group.sandbox.location
  resource_group_name = azurerm_resource_group.sandbox.name
  environment         = "dev"
  namespace           = "sandbox-test"

  # Test ingress rules
  ingress_rules = {
    from_cidrs = {
      tcp = {
        "443" = {
          cidrs   = ["10.0.0.0/8", "172.16.0.0/12"]
          to_port = 443
        }
        "80" = {
          cidrs   = ["0.0.0.0/0"]
          to_port = 80
        }
        "22" = {
          cidrs   = ["10.1.1.0/24"]
          to_port = 22
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

  # Test egress rules
  egress_rules = {
    to_cidrs = {}
    to_nsgs  = {}
  }

  enable_any_egress      = true
  enable_any_nsg_to_self = true

  # Test tags
  tags = {
    architecture       = "native"
    owner              = "test_team"
    purpose            = "Testing Azure NSG module functionality for sandbox validation and rule verification."
    terraform_resource = "true"
    project            = "nsg-module-testing"
    custom_tags = {
      test_id     = "sandbox-001"
      created_by  = "platform-team"
    }
  }
}

# Outputs
output "nsg_id" {
  value       = module.nsg_test.id
  description = "NSG ID"
}

output "nsg_name" {
  value       = module.nsg_test.name
  description = "NSG Name"
}

output "nsg_resource_group" {
  value       = module.nsg_test.resource_group_name
  description = "Resource Group"
}
```

### Step 4: Initialize and Plan
```bash
terraform init
terraform plan
```

### Step 5: Apply
```bash
terraform apply
```

### Step 6: Verify in Azure Portal
1. Navigate to Azure Portal
2. Go to Resource Groups → `rg-nsg-sandbox-test`
3. Click on the NSG resource
4. Verify:
   - NSG name follows pattern: `sandbox-test-dev-test-web-<random>`
   - All tags are present
   - Inbound security rules created (check priorities)
   - Outbound security rules created
   - Self-to-self rule exists (if enabled)

### Step 7: Cleanup
```bash
terraform destroy
```

## Testing Different Scenarios

### Scenario 1: Application Security Group Rules

First, create an ASG:
```hcl
resource "azurerm_application_security_group" "app" {
  name                = "asg-test-app"
  location            = azurerm_resource_group.sandbox.location
  resource_group_name = azurerm_resource_group.sandbox.name
}

module "nsg_with_asg" {
  source = "./azure-nsg-module"

  name                = "test-asg"
  location            = azurerm_resource_group.sandbox.location
  resource_group_name = azurerm_resource_group.sandbox.name
  environment         = "dev"
  namespace           = "sandbox-test"

  ingress_rules = {
    from_cidrs = {
      tcp  = {}
      udp  = {}
      icmp = {}
    }
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

  egress_rules = {
    to_cidrs = {}
    to_nsgs  = {}
  }

  enable_any_egress = false

  tags = {
    architecture       = "native"
    owner              = "test_team"
    purpose            = "Testing NSG with Application Security Group references for database access."
    terraform_resource = "true"
    appid              = "test-app-001"
  }
}
```

### Scenario 2: Multiple Protocols and Ports
```hcl
module "nsg_multi_protocol" {
  source = "./azure-nsg-module"

  name                = "test-multi"
  location            = azurerm_resource_group.sandbox.location
  resource_group_name = azurerm_resource_group.sandbox.name
  environment         = "qa"
  namespace           = "sandbox-test"

  ingress_rules = {
    from_cidrs = {
      tcp = {
        "443"  = { cidrs = ["0.0.0.0/0"], to_port = 443 }
        "80"   = { cidrs = ["0.0.0.0/0"], to_port = 80 }
        "8080" = { cidrs = ["10.0.0.0/16"], to_port = 8080 }
        "3000" = { cidrs = ["10.1.0.0/16"], to_port = 3000 }
      }
      udp = {
        "53"  = { cidrs = ["10.0.0.0/8"], to_port = 53 }
        "123" = { cidrs = ["10.0.0.0/8"], to_port = 123 }
      }
      icmp = {
        "0" = { cidrs = ["10.0.0.0/8"], to_port = 0 }
      }
    }
    from_nsgs = {
      tcp = {}
      udp = {}
    }
  }

  egress_rules = {
    to_cidrs = {
      cidrs    = ["0.0.0.0/0"]
      protocol = "Tcp"
      to_port  = 443
    }
    to_nsgs = {}
  }

  enable_any_egress      = true
  enable_any_nsg_to_self = false

  tags = {
    architecture       = "native"
    owner              = "qa_team"
    purpose            = "Multi-protocol NSG testing for comprehensive rule validation and verification."
    terraform_resource = "true"
    serviceid          = "svc-test-001"
  }
}
```

### Scenario 3: Custom Name
```hcl
module "nsg_custom_name" {
  source = "./azure-nsg-module"

  name                = "custom"
  nsg_custom_name     = "nsg-legacy-imported-prod"
  location            = azurerm_resource_group.sandbox.location
  resource_group_name = azurerm_resource_group.sandbox.name
  environment         = "prod"
  namespace           = "legacy"

  ingress_rules = {
    from_cidrs = {
      tcp  = {}
      udp  = {}
      icmp = {}
    }
    from_nsgs = {
      tcp = {}
      udp = {}
    }
  }

  egress_rules = {
    to_cidrs = {}
    to_nsgs  = {}
  }

  enable_any_egress = true

  tags = {
    architecture       = "legacy"
    owner              = "migration_team"
    purpose            = "Legacy NSG imported from manual Azure configuration for standardization."
    terraform_resource = "true"
    appgid             = "legacy-app-group-001"
  }
}
```

## Validation Checklist

After deploying, verify:

- [ ] NSG created in correct resource group
- [ ] NSG name follows expected pattern (or custom name)
- [ ] All tags present and correct
- [ ] Environment tag matches input
- [ ] Ingress rules created with correct priorities
- [ ] Egress rules created with correct priorities
- [ ] Self-to-self rule present (if enabled)
- [ ] Allow-all egress rule present (if enabled)
- [ ] Protocol types correct (Tcp, Udp, Icmp, *)
- [ ] Port ranges correct
- [ ] CIDR blocks correct
- [ ] ASG references correct (if used)

## Common Issues and Solutions

### Issue 1: "Invalid protocol"
**Error**: Protocol must be Tcp, Udp, Icmp, or *
**Solution**: Ensure protocol is capitalized: `"Tcp"` not `"tcp"`

### Issue 2: "Priority already exists"
**Error**: A rule with this priority already exists
**Solution**: Module manages priorities automatically. Check for conflicting manual rules.

### Issue 3: "Tag validation failed"
**Error**: Tags don't meet requirements
**Solution**: 
- Ensure `purpose` is >40 chars, starts with capital, ends with period
- Ensure `architecture` is "native", "legacy", or "migrations"
- Ensure `terraform_resource` is "true"

### Issue 4: "Cannot find ASG"
**Error**: Application Security Group not found
**Solution**: Create ASG resource before referencing in `source_nsg_ids`

## Integration with Existing Infrastructure

### Option 1: Data Source Approach
If you need to reference existing resources:

```hcl
data "azurerm_resource_group" "existing" {
  name = "rg-existing-prod"
}

data "azurerm_application_security_group" "app" {
  name                = "asg-existing-app"
  resource_group_name = data.azurerm_resource_group.existing.name
}

module "nsg" {
  source = "./azure-nsg-module"

  name                = "new-nsg"
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  environment         = "prod"
  namespace           = "myapp"

  ingress_rules = {
    from_nsgs = {
      tcp = {
        "443" = {
          source_nsg_ids = [data.azurerm_application_security_group.app.id]
          to_port        = 443
        }
      }
    }
  }
  # ... rest of configuration
}
```

### Option 2: Variable-Driven Approach
Create a variables file for different environments:

**prod.tfvars:**
```hcl
environment         = "prod"
namespace           = "myapp"
resource_group_name = "rg-prod-eastus"
location            = "East US"

ingress_rules = {
  from_cidrs = {
    tcp = {
      "443" = { cidrs = ["0.0.0.0/0"], to_port = 443 }
    }
    udp  = {}
    icmp = {}
  }
  from_nsgs = {
    tcp = {}
    udp = {}
  }
}

enable_any_egress = false
```

Then apply:
```bash
terraform apply -var-file="prod.tfvars"
```

## Performance Considerations

- Module handles up to ~500 rules efficiently
- Azure NSG limit is 1000 rules per NSG
- Large rule sets (>200 rules) may slow plan/apply
- Consider splitting into multiple NSGs for very large deployments

## Next Steps

1. **Review Documentation**: Read README.md and MIGRATION.md
2. **Test in Sandbox**: Use provided test configurations
3. **Adapt for Your Use Case**: Modify examples for your requirements
4. **Integrate with CI/CD**: Add to your deployment pipelines
5. **Version Control**: Tag stable versions in Git
6. **Share with Team**: Document custom patterns in your organization

## Support and Contribution

For issues or questions:
1. Check VARIABLES.md for detailed parameter documentation
2. Review MIGRATION.md for AWS-to-Azure specifics
3. Examine examples/ directory for patterns
4. Consult team's Terraform guidelines

## Additional Resources

- [Azure NSG Documentation](https://docs.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview)
- [Azure Application Security Groups](https://docs.microsoft.com/en-us/azure/virtual-network/application-security-groups)
- [Terraform AzureRM Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
