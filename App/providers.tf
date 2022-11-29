terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.7.0"
    }
  }
  required_version = ">= 0.13"

}