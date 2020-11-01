provider "aws" {
  region = var.aws_region
}

data "aws_ami" "ecs_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.ecs_ami.id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}
