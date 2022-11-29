#deploy external DNS


resource "helm_release" "extdns" {
  name       = "ak-extdns"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "external-dns"
  version   = "6.10.1"
  namespace = var.namespace
  create_namespace = true
  values = [
    file("${path.module}/external-dns.yaml")
  ]
  set {
    name = "akamai.host"
    value = var.aka_host
  }
  set {
    name = "akamai.clientToken"
    value = var.aka_client_token
  }
  set {
    name = "akamai.accessToken"
    value = var.aka_access_token
  }
  set {
    name = "akamai.clientSecret"
    value = var.aka_client_secret
  }
} 



#deploy ingress


resource "helm_release" "ingress" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version   = "4.2.5"
  namespace = var.namespace
  create_namespace = true
  values = [
    file("${path.module}/ingressannotations.yaml")
  ]
  set {
    name = "controller.service.annotations.external-dns.alpha.kubernetes.io/hostname"
    value = var.thehost
  }
  depends_on = [
    helm_release.extdns
  ]
}  

#echo "helm install --set installCRDs=true --namespace cert-manager --create-namespace my-cert-manager cert-manager/cert-manager --version v1.8.2"
resource "helm_release" "cert-manager" {
  name       = "ak-cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version = "1.8.2"
  namespace = var.namespace
  create_namespace = true
  set {
    name  = "installCRDs"
    value = "true"
  }
  depends_on = [
    helm_release.ingress
  ]
} 


#deploy JuiceShop
resource "helm_release" "akajuice" {
  name       = "ak-juiceshop"
  repository = "${path.module}/../helm"
  chart      = "aka-juice"
  namespace = var.namespace
  create_namespace = true
  values = [
    file("${path.module}/valuesakajuice.yaml")
  ]
  set {
    name = "app.juiceshop.ingress.url"
    value = var.thehost
  }
  depends_on = [
    helm_release.cert-manager
  ]
} 


