terraform {
  required_version = ">= 0.13"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.85.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.3.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.5.0"
    }
  }
  backend "local" {
    path = "/tmp/terraform.tfstate"
  }
}

provider google {}

data "google_client_config" "default" {}

data "google_container_cluster" "terraform_cluster" {
  name     = var.cluster_name
  location = var.cluster_location
  project  = var.gcp_project
}

provider kubernetes {
  host                   = "https://${data.google_container_cluster.terraform_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.terraform_cluster.master_auth[0].cluster_ca_certificate)
}

provider "kubectl" {
  host                   = "https://${data.google_container_cluster.terraform_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.terraform_cluster.master_auth[0].cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = "https://${data.google_container_cluster.terraform_cluster.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(data.google_container_cluster.terraform_cluster.master_auth[0].cluster_ca_certificate)
  }
}