provider "aws" {
  region  = var.region
}

resource "aws_instance" "terraform_ec2" {
  ami = var.ami
  instance_type = var.instance_type
}
