provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "terraform_ec2" {
  ami = var.ami
  instance_type = var.instance_type
  count = 3
  tags = {
    Name = var.instance_names[count.index]
  }
}
