
# PASS these vars from parent calling this module.
variable "linode_token" {
  description = "your Linode API token"
  default = ""
}

variable "lke_name" {
  description = "The cluster name to use"
  default = ""
}
variable "lke_k8s_version" {
  description = "The desired LKE-k8s version (major.minor)"
  default = ""
  type = string
}
variable "lke_region" {
  description = "The desired LKE region, std us-east - eu-west"
  default = ""
  type = string
}
variable "lke_tags" {
  description = "A List of tags to identify the cluster"
  default = ["default: tag"]
  type = list
}
variable "lke_controlplane_ha" {
  # Please enable "api_version=v4beta" when using this
  description = "Enable Cluster Control Plane High availability"
  default = true
  type = bool
}

# Node Pool Definitions
variable "lke_node_pool_count" {
  description = "The number of nodes in the Node Pool."
  default = ""
  type = string
}
variable "lke_node_pool_type" {
  description = "A Linode Type for all of the nodes in the Node Pool."
  default = ""
  type = string
}

## Node Pool Autoscaling
variable "lke_node_pool_autoscaling" {
  description = "Enable (or disable) node pool autoscaling"
  default = false
  type = bool
}
variable "lke_node_pool_autoscaling_min" {
  description = "The minimum number of nodes to autoscale to."
  default = ""
  type = string
}
variable "lke_node_pool_autoscaling_max" {
  description = "The maximum number of nodes to autoscale to."
  default = ""
  type = string
}