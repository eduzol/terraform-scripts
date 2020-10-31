variable "aws_region" {
  type = string
}

variable "elb_name" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "timeout" {
  type = number
}
