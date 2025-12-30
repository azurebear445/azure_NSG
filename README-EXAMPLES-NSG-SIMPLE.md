# NSG Module Example

Example configuration demonstrating the Azure Network Security Group module with enterprise-managed rules and user-defined rules.

## What Gets Created

- 1 Resource Group
- 1 Network Security Group
- ~60 Enterprise rules (ServiceNow ESG - auto-applied based on region)
- 6 User-defined rules (TCP/UDP/special rules)

**Total: ~69 resources**

## Quick Start

### Deploy to eastus

```bash
# Initialize
terraform init

# Review plan
terraform plan

# Deploy
terraform apply
```

### Deploy to eastus2

```bash
# Update location
sed -i 's/eastus"/eastus2"/' main.tf

# Deploy
terraform destroy  # Clean up eastus first
rm -rf .terraform
terraform init
terraform apply
```

## What's Deployed

### Enterprise Rules (Auto-Applied)
**Priority 100-159**: ServiceNow ESG rules (~60 rules)
- Ports: 138, 13724, 1433, 1521, 22, 23, 3389, 443, 445, 49152, 5986, 60777, 4699
- Protocols: TCP, UDP, ICMP
- Sources: Various /24 and /32 ranges from 10.x.x.x networks

### User Rules (Example Configuration)
- **Priority 1500**: tcp/443 from 0.0.0.0/0 (HTTPS)
- **Priority 1501**: tcp/80 from 0.0.0.0/0 (HTTP)
- **Priority 1502**: tcp/22 from 10.0.0.0/8 (SSH)
- **Priority 1503**: udp/53 from 10.0.0.0/8 (DNS)
- **Priority 1504**: Allow VirtualNetwork to VirtualNetwork (if enabled)
- **Priority 2500**: Allow all egress (if enabled)

## Region Differences

The example demonstrates region-specific enterprise rules:

| Region | Port 49152 Rules |
|--------|------------------|
| **eastus** | Single port: `49152` |
| **eastus2** | Port range: `49152-65535` |

This reflects the mapping from AWS us-east-1 (eastus) vs us-east-2 (eastus2).

## Verification

### Check deployed rules

```bash
# List all rules with priorities
az network nsg rule list \
  --nsg-name test-app-dev-web-tier-* \
  --resource-group rg-nsg-module-test \
  --query "[].{Priority:priority, Name:name, Port:destinationPortRange}" \
  --output table

# Count enterprise rules (should be 60)
az network nsg rule list \
  --nsg-name test-app-dev-web-tier-* \
  --resource-group rg-nsg-module-test \
  --query "[?priority>=100 && priority<200]" | jq length

# Count user rules (should be 6-7)
az network nsg rule list \
  --nsg-name test-app-dev-web-tier-* \
  --resource-group rg-nsg-module-test \
  --query "[?priority>=1500]" | jq length
```

### Verify no conflicts

```bash
terraform plan | grep -i "conflict"
# Expected: No output
```

## Customization

### Add user rules

Edit `main.tf` in the `ingress_rules` block:

```hcl
tcp = {
  "443" = {
    cidrs   = ["0.0.0.0/0"]
    to_port = 443
  }
  "8080" = {  # Add your rule here
    cidrs   = ["10.0.0.0/16"]
    to_port = 8080
  }
}
```

### Change resource group

Edit `main.tf`:

```hcl
resource "azurerm_resource_group" "test" {
  name     = "rg-your-custom-name"
  location = "eastus"
}
```

### Disable allow-any-egress

Edit `main.tf`:

```hcl
enable_any_egress = false
```

## Clean Up

```bash
terraform destroy
```

Destroying ~69 resources typically takes 3-7 minutes.

## Troubleshooting

### Destroy taking too long (>10 minutes)

```bash
# Cancel and clean up manually
Ctrl+C

# Delete resource group in Azure Portal, then:
terraform refresh
```

### Priority conflicts

If you see `SecurityRuleConflict` errors:

```bash
# Clean cache and retry
rm -rf .terraform
terraform init
terraform apply
```

### Wrong number of resources

Verify the location is `eastus` or `eastus2`:

```bash
grep "location" main.tf
```

## Files

```
examples/nsg/
├── main.tf          # Example configuration
├── providers.tf     # Azure provider setup
└── README.md        # This file
```

## Notes

- Enterprise rules are automatically applied based on deployment region
- User rules start at priority 1500 to avoid conflicts with enterprise rules (100-1499)
- Orange warnings in Azure Portal for 0.0.0.0/0 rules are normal for dev/test environments
