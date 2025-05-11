terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Domyślna konfiguracja providera AWS
provider "aws" {
  region = "us-east-1"
}

# Alias providera AWS dla innego regionu
provider "aws" {
  alias  = "us_west_2"
  region = "us-west-2"
}
