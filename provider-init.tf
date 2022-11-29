provider "linode" {
  api_version = "v4beta"
  token = var.linode_token
}

provider "helm" {
  kubernetes {
    config_path = "${path.cwd}/LKE/kubeconfig.yaml" #replace with var?
  }
}

provider "akamai" {
  config { # NOTE : Replace values with valid variables
    client_secret = var.aka_client_secret
    host = var.aka_host
    access_token = var.aka_access_token
    client_token = var.aka_client_token
  }
}