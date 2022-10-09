terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9"
    }
  }

  required_version = ">= 1.3.1"
}

provider "aws" {
  region = "us-west-2"
}


