resource "null_resource" "manage-ns" {
  provisioner "local-exec" {
    command = "sudo chmod +x create-namespace.sh"
  }
  provisioner "local-exec" {
    command = "sudo ./create-namespace.sh"
  }
}

module "cert_manager_install" {
    source                = "github.com/KennedyUC/cert-manager-tf-module.git"
    cert_chart_repo       = var.cert_chart_repo
    cert_chart_version    = var.cert_chart_version
    helm_create_namespace = var.helm_create_namespace
    cert_namespace        = var.cert_namespace
    enable_atomic         = var.enable_atomic
    credential_path       = var.credential_path
}

module "istio_install" {
    depends_on            = [module.cert_manager_install]
    source                = "github.com/KennedyUC/istio-tf-module.git"
    istio_chart_repo      = var.istio_chart_repo
    istio_namespace       = var.istio_namespace
    helm_create_namespace = var.helm_create_namespace
}

module "gateway_install" {
    depends_on            = [module.istio_install]
    source                = "github.com/KennedyUC/gateway-tf-module.git"
}