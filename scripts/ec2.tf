provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "terrafrom_ec2" {
  ami = "ami-0e4035ae3f70c400f"
  instance_type = "t2.micro"
}
