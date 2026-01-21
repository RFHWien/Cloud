# R1: Webserver implemented using Docker (NGINX)
# R3: Cost control using small EC2 instance types
# S3: System updates executed on instance startup

resource "aws_launch_template" "web" {
  name_prefix   = "web-"
  image_id      = "ami-1234567890abcdef0"  # Placeholder AMI
  instance_type = "t3.micro"

  user_data = base64encode(<<EOF
#!/bin/bash
# Update system packages on startup
yum update -y

# Start NGINX via Docker
docker run -d -p 80:80 nginx:latest
EOF
  )
}
