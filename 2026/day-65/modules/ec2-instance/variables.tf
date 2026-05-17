variable "ami_id" {}
variable "instance_type" { default = "t2.micro" }
variable "subnet_id" {}
variable "security_group_ids" { type = list(string) }
variable "instance_name" {}
variable "tags" { type = map(string) default = {} }
