#main LKE provisioning. 
#provisions cluster

resource "time_static" "cluster_date" {}


resource "linode_lke_cluster" "thecluster" {
    # Basic LKE values
    label       =  format("%s-%s", var.lke_name, time_static.cluster_date.unix)
    k8s_version = var.lke_k8s_version
    region      = var.lke_region
    tags        = var.lke_tags

    # Enable high availability for the control plane
    control_plane {
        high_availability = var.lke_controlplane_ha
    }

    pool {
        type  = var.lke_node_pool_type
        count = var.lke_node_pool_count

        dynamic "autoscaler" {
            for_each = var.lke_node_pool_autoscaling ? [1] : []
            content {
                min = var.lke_node_pool_autoscaling_min
                max = var.lke_node_pool_autoscaling_max
            }
        }
    }
}

resource "local_file" "lke_kubeconfig_yaml" {
    content  = base64decode(linode_lke_cluster.thecluster.kubeconfig)
    filename = "${path.module}/kubeconfig.yaml"
    file_permission = "0644" 
    depends_on = [linode_lke_cluster.thecluster]
}

/*
resource "null_resource" "start" {

 provisioner "local-exec" {

    command = "/bin/bash start.sh"
  }
  depends_on = [local_file.lke_kubeconfig_yaml]
}
*/