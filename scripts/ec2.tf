provider "aws" {
  region  = "us-west-1"
}

resource "aws_instance" "terraform_ec2" {
  ami = "ami-0e4035ae3f70c400f"
  instance_type = "t2.micro"
}
