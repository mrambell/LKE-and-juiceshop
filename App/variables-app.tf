variable "namespace" {
  description = "namespace for app"
  default = "changeme"
}

variable "thehost" {
  description = "the host for external DNS and deployment. will be added to Akaami EDNS"
  default = "changeme.domain.com"
}

### AKAMAI Platform Variables - edgeRC - needs to convert to secrets in Vault

variable aka_client_secret {
  type    = string
  default = ""
}
variable aka_host {
  type    = string
  default = ""
}
variable aka_access_token {
  type    = string
  default = ""
}
variable aka_client_token {
  type    = string
  default = ""
}