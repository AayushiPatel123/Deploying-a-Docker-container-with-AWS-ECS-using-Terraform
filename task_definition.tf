resource "aws_ecs_task_definition" "sonarqube" {
  family                   = "sonarqube-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([{
    name      = "sonarqube"
    image     = "${aws_ecr_repository.sonarqube.repository_url}:latest"
    essential = true
    memory    = 512
    portMappings = [{
      containerPort = 9000
      hostPort      = 9000
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = "/ecs/sonarqube"
        "awslogs-region"        = "us-east-1"
        "awslogs-stream-prefix" = "ecs"
      }
    }
  }])
}
