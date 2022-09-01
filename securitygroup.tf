resource "aws_security_group" "msvpc-sg-allow-all" {
  name        = "msvpc-sg-allow-all"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.msvpc-01.id

  ingress {
    description = "Allow HTTPS from everywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP from everywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "msvpc-sg-allow-all"
  }
}

resource "aws_security_group" "msvpc-sg-ec2" {
  name        = "msvpc-sg-ec2"
  description = "Allow only alb inbound traffic"
  vpc_id      = aws_vpc.msvpc-01.id

  ingress {
    description     = "Allow all from alb"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.msvpc-sg-allow-all.id]
  }

  ingress {
    description = "Allow ssh from my ip"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MY_IP]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "msvpc-sg-ec2"
  }
}