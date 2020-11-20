provider "aws" {
  region = var.region
}

resource "aws_instance" "project_vm" {
  ami = var.ami
  instance_type = var.ec2_instance_type
  key_name = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [var.instance_sg_id]
  subnet_id = var.instance_sn_id
  associate_public_ip_address = var.public_ip_association
}

resource "aws_key_pair" "key_pair" {
  key_name = "project-key"
  public_key = var.pub_key_path
}
