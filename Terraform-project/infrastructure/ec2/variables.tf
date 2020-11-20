variable "instance_sg_id" {
    description = "Instance SG id"
}


variable "region" {
    default = "eu-west-1"
}

variable "instance_sn_id" {
    description = "Instance SN id"
}

variable "ami" {
    default = "ami-0dc8d444ee2a42d8a"
}

variable "ec2_instance_type" {
    default = "t2.micro"
}

variable "public_ip_association" {
    description = "Associating public ip address"
}

variable "pub_key_path" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPvfDVuKFg0+/YCkcjLRK1D1REHAH/JIN2FEP86jzgqV91RiiQ++rQVC4W1AkzVj+o2s8q4lQelYLWH1sE6DVZpZoaOZKRzWTwM9B3tSDE5EVytEOI9SvAg5weSvJor0fv41lMg6T2gjImGzB5Xg/8t1Fb7A2XwzD0zV8h82LL1VigRXq+d/DpfevjLd8blLMOL8FapyFEwrlRmnb+SjKyoN5CoRCx97mRRlEiRoourqQkMYe3u7x6oIkibb4EBx5TK5kXLe8y9doz6yuQizDj3hVQTG/A5SbcFlyyRMKeaHBjEDY2TeQDqSb4TXBDZ2b775yODEeIg454jJrangvX ubuntu@ip-172-31-40-88"
}

variable "ec2_vpc_id" {
    description = "Instance VPC id"
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
