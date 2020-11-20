provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.private_sn_cidr
  availability_zone = "eu-west-1a"
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.public_sn_cidr
  availability_zone = "eu-west-1b"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main_vpc.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "private_subnet_association" {
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_security_group" "instance_sg" {
    name = "sg"
    vpc_id = aws_vpc.main_vpc.id

    dynamic "ingress" {
      iterator = port 
      for_each = var.sg_ingress_ports

      content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = [var.open_access]
      }
    }

    egress {
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = [var.egress_sg_cidr]
    }

}
