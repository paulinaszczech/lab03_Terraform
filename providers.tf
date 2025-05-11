# providers.tf

terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "pszzech-terraform-state"
    key    = "terraform.tfstate"
  }
}

provider "github" {
  token = var.github_token
}
