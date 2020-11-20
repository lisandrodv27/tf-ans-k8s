variable "vpc_cidr" {
  default = "10.0.0.0/16" 
}

variable "private_sn_cidr" {
  default = "10.0.8.0/24"
}

variable "public_sn_cidr" {
  default = "10.0.6.0/24"
}

variable "ingress_sg_port" {
    default = 22
}

variable "egress_sg_cidr" {
    default = "0.0.0.0/0"
}

variable "sg_ingress_ports" {
  type = list(number)
  default = [22, 80, 3306]
}

variable "open_access" {
  default = "0.0.0.0/0"
}





