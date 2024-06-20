# Define required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.45.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region     = "us-east-1"  # Specify your desired AWS region
}
