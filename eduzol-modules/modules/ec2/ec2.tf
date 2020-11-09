resource "aws_instance" "my_ec2" {
  ami           = "ami-0e4035ae3f70c400f"
  instance_type = var.instance_type
}
