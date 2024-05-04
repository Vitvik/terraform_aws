terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
  #region is using variables.tf file
  region = var.region
}

provider "kubernetes" {
  config_path = "~/.kube/config" 
}


