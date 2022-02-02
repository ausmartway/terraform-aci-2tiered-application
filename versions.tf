##Add your terraform core and provider version constrains here.
terraform {
  required_version = ">= 1.0"
  required_providers {
    aci = {
      source  = "ciscodevnet/aci"
      version = "~> 2.0"
    }
  }
}