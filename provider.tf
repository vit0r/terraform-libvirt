terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.16.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.1"
    }
  }
}

provider "kubernetes" {
  alias       = "libvirt"
  config_path = "~/.kube/config"
}

provider "helm" {
  alias = "libvirt"
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "libvirt" {
  uri = var.libvirt_system
}
