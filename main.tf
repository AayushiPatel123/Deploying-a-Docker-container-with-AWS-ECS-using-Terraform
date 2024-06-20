# Create a VPC
resource "aws_vpc" "sonar_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create subnets
resource "aws_subnet" "sonar_subnet1" {
  vpc_id            = aws_vpc.sonar_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"  # Replace with your availability zone
}

resource "aws_subnet" "sonar_subnet2" {
  vpc_id            = aws_vpc.sonar_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"  # Replace with your availability zone
}

# Create an internet gateway
resource "aws_internet_gateway" "sonar_igt" {
  vpc_id = aws_vpc.sonar_vpc.id
}

# Create a route table
resource "aws_route_table" "sonar_rt" {
  vpc_id = aws_vpc.sonar_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sonar_igt.id
  }
}

# Associate subnets with the route table
resource "aws_route_table_association" "sonar_rta1" {
  subnet_id      = aws_subnet.sonar_subnet1.id
  route_table_id = aws_route_table.example.id
}

resource "aws_route_table_association" "sonar_rta2" {
  subnet_id      = aws_subnet.sonar_subnet2.id
  route_table_id = aws_route_table.sonar_rt.id
}

# Create a security group
resource "aws_security_group" "sonar_asg" {
  vpc_id = aws_vpc.sonar_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an ECR repository
resource "aws_ecr_repository" "app_ecr_repo" {
  name = "app-repo"
}

