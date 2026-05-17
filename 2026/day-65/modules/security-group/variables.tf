variable "vpc_id" {}
variable "sg_name" {}
variable "ingress_ports" { type = list(number) default = [22, 80] }
variable "tags" { type = map(string) default = {} }
