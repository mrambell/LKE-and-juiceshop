### DEPLOY LKE CLUSTER BASED ON VARS
module "lke" {
	source = "./LKE"
	linode_token	=	var.linode_token
	lke_name	=	var.lke_name
	lke_k8s_version	=	var.lke_k8s_version
	lke_region	=	var.lke_region
	lke_tags	=	var.lke_tags
	lke_controlplane_ha	=	var.lke_controlplane_ha
	lke_node_pool_count	=	var.lke_node_pool_count
	lke_node_pool_type	=	var.lke_node_pool_type
	lke_node_pool_autoscaling	=	var.lke_node_pool_autoscaling
	lke_node_pool_autoscaling_min	=	var.lke_node_pool_autoscaling_min
	lke_node_pool_autoscaling_max	=	var.lke_node_pool_autoscaling_max
}

### DEPLOY JUICESHOP WITH CERT AND DNS NAME
module "app" {
	source = "./App"
    depends_on = [module.lke]
	namespace = var.namespace
	thehost = var.thehost
	aka_access_token = var.aka_access_token
	aka_client_secret = var.aka_client_secret
	aka_client_token = var.aka_client_token
	aka_host = var.aka_host
}
