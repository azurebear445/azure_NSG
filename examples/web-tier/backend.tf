terraform {
  backend "remote" {
    organization = "your-organization-name"

    workspaces {
      name = "azure-nsg-web-tier-example"
    }
  }
}
