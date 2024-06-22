# provider.tf

provider "aws" {
  region = "us-east-1" # Adjust this to your desired region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" # Replace with the desired version
    }
  }
}
