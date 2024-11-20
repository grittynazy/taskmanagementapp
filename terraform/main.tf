provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

resource "aws_instance" "task_app_instance" {
  ami           = "ami-0866a3c8686eaeeba"  # Amazon Linux 2 AMI ID (update for your region)
  instance_type = "t2.micro"

  user_data = file("userdata.sh")  # Reference the user-data script
  key_name  = "tms_key"  # Replace with your EC2 key pair name

  tags = {
    Name = "TaskAppEC2"
  }

  # Security group
  vpc_security_group_ids = [aws_security_group.task_app_sg.id]
}

resource "aws_security_group" "task_app_sg" {
  name_prefix = "task_app_sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP access from anywhere
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH access (restrict this for production)
  }

ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH access (restrict this for production)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

