# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Define the Security Group
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH traffic"

  # Ingress rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH from any IP
  }

  # Egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Data source to get the default subnet ID in a specific availability zone
data "aws_subnet" "default" {
  default_for_az   = true
  availability_zone = "us-west-2a"  # Specify preferred availability zone
}

# Define the EC2 Instance
resource "aws_instance" "terraform_ec2_web" {
  ami                    = "ami-02d3770deb1c746ec"  
  instance_type          = "t2.micro"               
  key_name               = "oregon-key"     

  # Use the security group defined above
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  # Associate the instance with the selected subnet
  subnet_id              = data.aws_subnet.default.id

  tags = {
    Name = "Terraform_ec2_web"
  }
}



