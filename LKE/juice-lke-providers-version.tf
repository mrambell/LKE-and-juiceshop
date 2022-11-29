terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~> 1.27.0"
    }
  }
  required_version = ">= 0.13"

}