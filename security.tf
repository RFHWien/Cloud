# R5: Access restricted to company IP (ALB level)
# S5: Only HTTP traffic allowed to web servers

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow only HTTP traffic from ALB to web servers"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "HTTP from ALB only"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
