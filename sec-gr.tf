resource "aws_security_group" "alb-sg" {
  name = "ALB SG ${var.name}"
  tags = {
    Name = "TF_ALBSecurityGroup ${var.tag}"
  }
  vpc_id = data.aws_vpc.selected.id

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "server-sg" {
  name   = "WebServerSecurityGroup ${var.name}"
  vpc_id = data.aws_vpc.selected.id
  tags = {
    Name = "TF_WebServerSecurityGroup ${var.tag}"
  }

  ingress {
    from_port       = 80
    protocol        = "tcp"
    to_port         = 80
    security_groups = [aws_security_group.alb-sg.id]
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "db-sg" {
  name   = "RDSSecurityGroup ${var.name}"
  vpc_id = data.aws_vpc.selected.id
  tags = {
    "Name" = "TF_RDSSecurityGroup ${var.tag}"
  }

  ingress {
    from_port       = 3306
    protocol        = "tcp"
    to_port         = 3306
    security_groups = [aws_security_group.server-sg.id]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

}