variable "helm_create_namespace" {
    type        = bool
    default     = false
    description = "Specify the whether namespace is created by Helm"
}

variable "enable_atomic" {
    type        = bool
    default     = false
    description = "Specify the whether atomic is enabled in Helm"
}

variable "cert_chart_version" {
    type        = string
    default     = "v1.9.1"
    description = "Specify the version of Helm"
}

variable "cert_namespace" {
    type        = string
    default     = "cert-manager"
    description = "cert-manager namespace"
}

variable "cert_chart_repo" {
    type        = string
    default     = "https://charts.jetstack.io"
    description = "helm chart repo"
}

variable "istio_chart_repo" {
    type        = string
    default     = "https://istio-release.storage.googleapis.com/charts"
    description = "helm chart repo for installing istio"
}

variable "istio_namespace" {
    type        = string
    default     = "istio-system"
    description = "namespace to deploy istio resources"
}

variable "acme_email" {
    type        = string
    default     = "kennedy@mavencode.com"
    description = "acme user email"
}

variable "app_namespace" {
    type        = string
    default     = "test-app"
    description = "namespace to deploy the test app"
}

variable "app_name" {
    type        = string
    default     = "test-app"
    description = "name of the app for the test"
}

variable "cluster_name" {
    type        = string
    description = "GKE cluster for deployment"
}

variable "cluster_location" {
    type        = string
    description = "Region hosting the cluster"
}

variable "gcp_project_id" {
    type        = string
    description = "GCP project ID"
}