# Default Example

This example demonstrates the NSG module with enterprise security group rules only. No user-defined ingress rules are added. Enterprise rules are applied automatically based on the deployment region (eastus2 or centralus).

## What This Example Does

- Creates a Resource Group in centralus
- Creates an NSG with no user-defined ingress rules
- Applies all 13 Enterprise Security Group rule sets automatically
- Enables outbound traffic to all destinations

## Resources Created

| Resource | Description |
|----------|-------------|
| azurerm_resource_group | Resource group for the NSG |
| random_id | Unique suffix for NSG naming |
| azurerm_network_security_group | The NSG resource |
| azurerm_network_security_rule | Enterprise rules (470+ rules based on region) |
| azurerm_network_security_rule | Allow any egress rule |

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
