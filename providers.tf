terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~> 1.27.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.7.0"
    }
    akamai = {
      source = "akamai/akamai"
    }
  }
  required_version = ">= 0.13"

}