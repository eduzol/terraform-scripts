variable "aws_region" {
  type = string
}

variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
}
