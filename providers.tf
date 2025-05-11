# providers.tf

terraform {
  required_version = ">=1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # Konfiguracja backendu S3
  backend "s3" {
    region = "us-east-1"
    bucket = "pszzech-terraform-state"
    key    = "terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "github" {
  token = var.github_token
}
