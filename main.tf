module "cert_manager_install" {
    source                    = "github.com/KennedyUC/cert-manager-tf-module.git"
    cert_chart_repo           = var.cert_chart_repo
    cert_chart_version        = var.cert_chart_version
    helm_create_namespace     = var.helm_create_namespace
    cert_namespace            = var.cert_namespace
    enable_atomic             = var.enable_atomic
    cert-manager-chart-values = "./helm-values/cert-manager-values.yaml"
}

module "istio_install" {
    source                    = "github.com/KennedyUC/istio-tf-module.git"
    istio_namespace           = var.istio_namespace
    istio_chart_repo          = var.istio_chart_repo
    helm_create_namespace     = var.helm_create_namespace
}

module "certificate_resources" {
    source                = "github.com/KennedyUC/gateway-tf-module.git"
    acme_email            = var.acme_email
    app_namespace         = var.app_namespace
    app_name              = var.app_name
}