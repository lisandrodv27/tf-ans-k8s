variable "rds_sn_id_priv" {
  description = "RDS instance subnet id (private)"
}

variable "rds_sn_id_pub" {
  description = "RDS instance subnet id (public)"
}

variable "rds_sg_id" {
  description = "RDS instance security group id"
}

variable "rds_vpc_id" {
    description = "RDS VPC id"
}

variable "db_username" {
  default = "root"
}

variable "db_password" {
  default = "password123"
}