resource "aws_ecr_repository" "sonarqube" {
  name = "sonarqube"
  
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
