# R5: Access restricted to company IP address

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP access only from company IP"

  ingress {
    description = "HTTP from company IP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.company_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
