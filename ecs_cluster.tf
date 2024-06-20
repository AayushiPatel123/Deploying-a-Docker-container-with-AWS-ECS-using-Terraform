resource "aws_ecs_cluster" "cluster_sonarqube" {
  name = "cluster_sonarqube"
}

output "ecs_cluster_id" {
  value = aws_ecs_cluster.cluster_sonarqube.id
} 