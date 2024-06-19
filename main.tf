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

# Create an ECR repository
resource "aws_ecr_repository" "app_ecr_repo" {
  name = "app-repo"
}

resource "aws_ecs_cluster" "cluster_sonarqube" {
  name = "cluster_sonarqube"
}

output "ecs_cluster_id" {
  value = aws_ecs_cluster.cluster_sonarqube.id
} 