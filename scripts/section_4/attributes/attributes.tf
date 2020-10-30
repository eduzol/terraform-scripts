provider "aws" {
  region = "us-west-1"
}

resource "aws_eip" "lb" {
  vpc = true
}

output "eip" {
  value = aws_eip.lb
}

resource "aws_s3_bucket" "mys3" {
  bucket = "eduzol-demo-0001"
}

output "s3bucket" {
  value = aws_s3_bucket.mys3
}
