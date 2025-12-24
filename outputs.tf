output "id" {
  value       = azurerm_network_security_group.this.id
  description = "(string) - The ID of the NSG created."
}

output "name" {
  value       = azurerm_network_security_group.this.name
  description = "(string) - The name of the NSG created."
}

output "resource_group_name" {
  value       = azurerm_network_security_group.this.resource_group_name
  description = "(string) - The resource group name where the NSG was created."
}

output "location" {
  value       = azurerm_network_security_group.this.location
  description = "(string) - The Azure location where the NSG was created."
}
