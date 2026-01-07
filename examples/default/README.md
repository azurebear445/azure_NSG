# Default Example

This example demonstrates the NSG module with **enterprise rules only** (no user-defined rules). All 13 Enterprise Security Group rule sets are applied automatically based on the deployment region.

## What This Example Does

- Creates a Resource Group in centralus
- Creates an NSG with enterprise rules only
- Applies all 13 Enterprise Security Group rule sets automatically
- Enables outbound traffic to all destinations
- Enables self-to-self communication within the VNet
- Diagnostic settings are automatically added by Azure Policy

## Resources Created

| Resource | Description |
|----------|-------------|
| azurerm_resource_group | Resource group for the NSG |
| random_id | Unique suffix for NSG naming |
| azurerm_network_security_group | The NSG resource |
| azurerm_network_security_rule | Enterprise rules (470+ rules based on region) |
| azurerm_network_security_rule | Allow any egress rule |
| azurerm_network_security_rule | Allow self-to-self rule |

## Expected Resource Count

- **centralus:** ~482 resources to add
- **eastus2:** ~490 resources to add (includes region-specific rules)

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## Clean Up

```bash
terraform destroy
```

## Notes

- No user-defined ingress or egress rules are configured in this example
- Enterprise rules are applied automatically based on the `location` value
- Diagnostic settings are automatically enabled by Azure Policy after NSG creation
