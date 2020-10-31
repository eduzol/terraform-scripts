variable "aws_region" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_names" {
  type = list(string)
}
