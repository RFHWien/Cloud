terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# R2: Region isolation via configurable AWS region
provider "aws" {
  region = var.region
}
